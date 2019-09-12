#!/bin/bash

# Get testIDs from tests where klee threw an assertion.
TEST_IDS=`ls -1 klee-last/*.assert.err | sed -r 's/klee-last\/(.*).assert.err/\1/'`;

# Bail out if no klee assertions found. Otherwise, print header.
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
    # Get klee results for testID
    RESULT=`ktest-tool "klee-last/$test_id.ktest"`;
    # Extract the solution from test results
    SOLUTION=`echo $RESULT | sed -r 's/(.*)\stext:\s//'`;
    echo "$test_id:  $SOLUTION";
done

echo "";
