#!/bin/bash
# use this command when creating a new branch 
# from current checked-out branch

if [ $# -lt 1 ]
then
    echo Usage: branch.sh branchname
    exit
fi

#create new branch from current branch
git checkout -b $1;

sfdx force:org:create -s -f config/project-scratch-def.json -a $1;

# call setup script for org setup
./utils/setup_scratch_org.sh $1;

sfdx force:org:open -u $1;

sfdx force:org:list

