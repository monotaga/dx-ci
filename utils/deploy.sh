#!/bin/bash
# use this command when creating a new branch 
# from current checked-out branch

if [ $# -lt 1 ]
then
    echo Usage: deploy.sh alias
    exit
fi

#convert the dx metadata to traditional metadata format
sfdx force:source:convert -r force-app/main/default/ -d deploy

#deploy to the org of user's choice
sfdx force:mdapi:deploy -l RunSpecifiedTests -r HashUtil_Test --deploydir deploy -u $1 

sleep 5s

sfdx force:mdapi:deploy:report