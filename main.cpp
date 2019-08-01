#include <iostream>

#include <gtest/gtest.h>
#include <gmock/gmock.h>

void f(int n)
{
    if (n < 0) {
        std::cout << "n is less than zero\n";
    } else {
        std::cout << "n greater than or equal to zero\n";
    }
}

int main(int argc, char *argv[])
{
    testing::InitGoogleTest(&argc, argv);

    f(3);

    return RUN_ALL_TESTS();
}

TEST(My, Test1)
{
    auto func = [](int a, int b) -> int {
        return a + b;
    };

    ASSERT_EQ(7, func(3,4));
}
