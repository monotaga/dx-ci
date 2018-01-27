#!/bin/bash
#use this command when deleting a branch and it's associated scratch org

if [ $# -lt 1 ]
then
    echo Usage: delete_branch.sh branchname
    exit
fi

git checkout master
git branch -D $1;
sfdx force:org:delete -a $1;
sfdx force:org:list
git branch