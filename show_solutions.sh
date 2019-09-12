#!/bin/bash

# Find the testIDs of all tests that found a solution
TEST_IDS=`ls -1 klee-last/ | grep err | sed -r 's/(.*).assert.err/\1/'`;

# Bail out if no solutions found
if [ -z "$TEST_IDS" ];
then
    echo "No solutions found";
    exit -1;
else
    echo "";
    echo "TESTID       SOLUTION";
fi

# Get result for each test, and print solution.
for test_id in $TEST_IDS;
do
    # Print the solution for given testID
    RESULT=`ktest-tool "klee-last/$test_id.ktest"`;
    SOLUTION=`echo $RESULT | sed -r 's/(.*)\stext:\s//'`;
    echo "$test_id:  $SOLUTION";
done

echo "";
