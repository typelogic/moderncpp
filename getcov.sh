#!/bin/sh
#

getcov () { 
    local tmpdir=$(mktemp -d)
    for f in *.gcno
    do
        gcov $f
    done
    lcov --capture --directory . --output-file result.info
    mkdir -p $tmpdir
    genhtml result.info --output-directory $tmpdir
    cd $tmpdir/
    echo "[$tmpdir]"
    python2.7 -m SimpleHTTPServer
    cd -
}

getcov
