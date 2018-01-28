#!/usr/local/bin/node
var fs = require('fs');
var testRunId  = fs.readFileSync('test_results/test-run-id.txt', 'utf8'),
    testRunFilename = `test_results/test-result-${testRunId}.json`,
    coverage = JSON.parse(fs.readFileSync('test_results/test-result-codecoverage.json', 'utf8') ),
    results = JSON.parse(fs.readFileSync(testRunFilename, 'utf8') );

console.log(`test run id ${testRunId}`);

if(results.summary.outcome === 'Failed'){
    console.log(results.summary);
}else{
    console.log( `All tests pass\nCode Coverage: ${coverage[0].coveredPercent}%\n`);
}

for(var test of results.tests){
    if(test.Outcome !== 'Pass'){
        console.log(`\nFAILURE: ${test.StackTrace} \n ${test.Message}\n`);
    }
}

