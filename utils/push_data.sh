#!/bin/bash
# use this command to finish setting up
# a new scratch org

if [ $# -lt 1 ]
then
    echo Usage: push_data.sh alias
    exit
fi

# create anonymous apex file to execute
echo "delete [select id from Account];" > anon.apex

# delete existing data
sfdx force:apex:execute -f anon.apex -u $1

# delete the anonymous apex
rm anon.apex

#push fresh dataset data 
sfdx force:data:tree:import --sobjecttreefiles data/Account-Contact-Opportunity.json -u $1