#!/bin/bash
# use this command to finish setting up
# a new scratch org

if [ $# -lt 1 ]
then
    echo Usage: setup_scratch_org.sh alias
    exit
fi

## push local code artifacts to scratch org
sfdx force:source:push;

## assign any required permission sets
sfdx force:user:permset:assign -n Viz_user

## import data
./utils/push_data.sh $1
# sfdx force:data:tree:import --sobjecttreefiles data/Account.json;

