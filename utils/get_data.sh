#!/bin/bash
# use this command to finish setting up
# a new scratch org

if [ $# -lt 1 ]
then
    echo Usage: get_data.sh alias
    exit
fi

# select Accounts with associated Contacts and Opportunities
sfdx force:data:tree:export -q "SELECT Name, (Select Id, FirstName, LastName, Title FROM Contacts), (SELECT Id, Name, Amount, StageName, CloseDate FROM Opportunities) FROM Account WHERE Name != NULL" -d ./data -u $1