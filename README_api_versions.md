# IG Versioning

## Overview
Support multiple published versions of the IG

## Solution overview
All versions will be maintained within same git repo.

A separate branch will be maintained for each version

If there is a change which should be present in other versions then it can be cherry picked between versions. 

Each version branch can be maintained independently on its own publishing lifecycle.

main branch will always be the latest API version (currently API-V2)
 

## Git version model
~~~
__main____v2________v3______
   \              \
    \              \_____v2______
     \
      \_____v1_____
~~~

The branch versions are main-<version>, so initially there is main (version2), and main-v1.

## Managing changes
New MR’s are created and merged into their respective version. ( uat | uat-V1 ) then merged into ( main | main-v1).

a cherry pick MR can be created to merge changes across the versions.

### Branch naming
Valid branch names are `^(feature|bugfix|release|cherry-pick|revert)/(uat|uat-V1)|(main|main-V1)/.*`
i.e feature/uat/IMM-1122/add-the-feature or feature/uat/IMM-1122-add-the-feature

where uat|uat-V1|main|main-V1 is the destination branch

## Publishing
each of the uat branches is published independantly to a uat preview once merged to main each of the “main” branches can be published independently.

## IG version
 IG version `sushi-config.yaml version:`   
 Publish version `[main] ci-scripts\website-manifest.yaml` 

