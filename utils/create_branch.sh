#!/bin/bash
# use this command when creating a new branch 
# from current checked-out branch

if [ $# -lt 1 ]
then
    echo Usage: create_branch.sh branchname
    exit
fi

#create new branch from current branch
git checkout -b $1;

#create a scratch org for this branch
sfdx force:org:create -s -f config/project-scratch-def.json -a $1;

# call setup script for org setup
./utils/setup_scratch_org.sh $1;

# open new scratch org in browser
sfdx force:org:open -u $1;

# list all hub and scratch orgs
sfdx force:org:list

# list branches
git branch

