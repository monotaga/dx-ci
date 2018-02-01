# dx-ci
Sample project incorporating SFDX with CircleCI

## Developer Instructions

### Create a Feature Branch and Scratch Org
- `./utils/create_branch.sh branch-name`

###  Run Unit Tests
- `./utils/run_tests.sh branch-name`

###  Delete a Feature Branch
- `./utils/delete_branch.sh branch-name`

### Convert to legacy metadata format
- `./utils/convert_metadata.sh`

### Deploy converted metadata to any aliased org
- `./utils/deploy.sh alias`
