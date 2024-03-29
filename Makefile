
all: main

main_s: main.cpp googletest.a
	$(CXX) -g -Wall -Wextra -pthread -lgcov -fprofile-arcs -ftest-coverage $^ -o $@ -Igoogletest/include -Igooglemock/include 

main_d: main.cpp googletest.so
	$(CXX) -g -Wall -Wextra -pthread -lgcov -fprofile-arcs -ftest-coverage $^ -o $@ -Igoogletest/include -Igooglemock/include 
	@echo "*****************************************"
	@echo "Linux TODO: export LD_LIBRARY_PATH=`pwd`"

googletest.so: gtest-all.o gmock-all.o
	$(CXX) -shared $^ -o $@

gtest-all.o: googletest/src/*.cc
	$(CXX) -fPIC -c $^ -I googletest/ -I googletest/include/

gmock-all.o: googlemock/src/*.cc
	$(CXX) -fPIC -c $^ -I googlemock -I googlemock/include/ -I googletest/include/

googletest.a: gtest-all.o gmock-all.o
	$(AR) $(ARFLAGS) $@ $^ 

clean:
	@rm -f *.o *.a *.so *.exe *.gcno *.gcda

.PHONY: clean
