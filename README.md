# Summary
This project defines the FHIR Implementation Guide for AIR using FHIR Shorthand(FSH) files. 

The output of this project is a FHIR Implementation Guide(IG) that can be used throughout other projects.

# Branch naming
The repo contains two main branches main (API-V2), main-V1 (API-V1) and their respective feeder branches uat and uat-V1

feature branches are created against either uat/uat-V1 with the naming 
`^(feature|bugfix|release|cherry-pick|revert)/(uat|uat-V1)|(main|main-V1)/.*`
i.e feature/uat/IMM-1122/add-the-feature or feature/uat/IMM-1122-add-the-feature

where uat|uat-V1|main|main-V1 is the destination branch

# Merging to main
Merges to main are performed through the github workflow [cut-ig-release](https://github.com/tewhatuora/air-fhir-ig/actions/workflows/cut-ig-release.yaml)

which will maintain the version number in sushi-config.yaml and create a merge branch from uat to main (you need to manually create the PR)

# Local build

Docker only or integrated Visual Studio Code (Dev Containers)

## Verify outputs

Build output in the output directory
`firefox output/index.html` (not inside the docker as it won't have firefox installed)

## Visial Studio Code

### Prerequisites
* Visual Studio Code (VSC)
* Docker
* (VSC) extension `Dev Containers : microsoft.com`

### Run build
* <ctrl><shift>p "Reopen in container"
* new terminal
* from the command prompt inside VSC
`./build-ig.sh`

## Docker only

The Dockerfile contains 2 images 
* `BASE` is for the pipeline and non interactive and contains the build chain
* `localdev` extends BASE and includes some useful cli tools, also a non-root user

See `.devcontainer/build-docker-local.sh`

* `docker run -v "$(pwd):/workspace" -w /workspace -it air-api-fhir-ig-dev:devlocal bash` (interactive)
* `docker run -v "$(pwd):/workspace" -w /workspace -it air-api-fhir-ig-dev:devlocal ./build-ig.sh` (non-interactive)

You can also run the BASE image but the user will be root and it screws with the file permissions for the build artifacts
 air-api-fhir-ig-dev:devlocal vs air-api-fhir-ig-dev:latest

* `docker run -v "$(pwd):/workspace" -w /workspace -it air-api-fhir-ig-dev:latest bash` (interactive)
* `docker run -v "$(pwd):/workspace" -w /workspace -it air-api-fhir-ig-dev:latest ./build-ig.sh` (non-interactive)


# Project layout

After a build if not local changes have been made you can restore back to clean with
`docker restore .; docker clean -dfx`

```
.
├── .builder                  (build scripts)
├── .devcontainer             (Docker)
├── .git
├── .github                   (github workflows)
├── .gitignore
├── build-ig.sh               (local and github project build, not the ig builder) 
├── ig.ini
├── immsot-ig-template-local  (to be removed)
├── input                     (source documents) 
├── input-cache               (to be removed - builder cache)
├── README.md
├── README_api_versions.md
└── sushi-config.yaml         (IG configuration file)
```
## build artifacts
```
.
├── _build.bat                (IG builder script download)
├── _build.sh                 (IG builder script download)
├── _gencontinuous.bat        (IG builder script download)
├── _gencontinuous.sh         (IG builder script download)
├── _genonce.bat              (IG builder script download)
├── _genonce.sh               (IG builder script download)
├── _updatePublisher.bat      (IG builder script download)
├── fsh-generated             (intermediate build) 
├── input-cache               (builder cache)
├── node_modules              (local node modules install)
├── output                    (build output)
├── package-lock.json         (local node modules install)
├── package.json              (local node modules install)
├── temp                      
└── template                  (template download)
```