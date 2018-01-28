#run all unit tests and output to test_results dir
sfdx force:apex:test:run --resultformat tap --codecoverage -d test_results
#find the last tests run and report on them
node ./utils/parse_test_results.js