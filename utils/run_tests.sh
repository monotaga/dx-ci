#!/bin/bash
# run all tests for a given alias or username

if [ $# -lt 1 ]
then
    echo Usage: run_tests.sh alias
    exit
fi
#run all unit tests and output to test_results dir
sfdx force:apex:test:run --resultformat tap --codecoverage -d test_results -u $1
#find the last tests run and report on them
node ./utils/parse_test_results.js