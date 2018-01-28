# SFDX  App

## Dev, Build and Test
- sfdx force:auth:web:login -a devhub -d
- sfdx force:org:create -a dx-ci -f config/project-scratch-def.json
- sfdx force:config:set defaultusername=dx-ci
- sfdx force:apex:test:run --resultformat human --codecoverage

## Resources


## Description of Files and Directories


## Issues


