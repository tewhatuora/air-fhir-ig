# IG Versioning

## Overview
Support multiple published versions of the IG

## Solution overview
All versions will be maintained within same git repo.

A separate branch will be maintained for each version

If there is a change which should be present in other versions then it can be cherry picked between versions. 

Each version branch can be maintained independently on its own publishing lifecycle.

main branch will always be the latest
 

## Git version model
~~~
__main____v2________v3______
   \              \
    \              \_____v2______
     \
      \_____v1_____
~~~      
So main branch always has the “latest” api version

The branch versions are main-<version>, so initially there is main (version2), and main-v1.

## Managing changes
New MR’s are created and merged into their respective version. ( main | main-v1).

a cherry pick MR can be created to merge changes across the versions.

## Publishing
Each of the “main” branches can be published independently.

## Website Publish Overview
During CI each version branch will:
- build the website for its version
- zip the website folder
- push the zip into the Gitlab Package registry
- pull the website build scripts from main [Package Repository](https://gitlab.com/healthnz-prm/air/air-api-fhir-ig/-/packages)
- download all the zip files from the Package registry
- build a “wrapper html”
- bundle the website
- publish the combined website [air-api-fhir-ig](https://healthnz-prm.gitlab.io/air/air-api-fhir-ig)

## Website version transition
The transition to support multi versions is 2 stage:
- stage1: each branch will 
  - zip it website folder 
  - push to the gitlab package repository
- stage2: each branch will 
  - pull the scripts from main,
  - pull all the website packages from gitlab package repository
  - publish the combined website 

## IG version
 IG version `sushi-config.yaml version:`   
 Publish version `[main] ci-scripts\website-manifest.yaml` 
