#!/bin/bash -x

# commit changes
echo "committing and tagging release"
git config user.email "${GITLAB_USER_EMAIL}"
git config user.name "${GITLAB_USER_NAME}"
git config --global push.followTags true
git checkout -b "$CI_COMMIT_BRANCH" remotes/origin/${CI_COMMIT_BRANCH}
git pull
git remote add gitlab-ci https://oauth2:$RELEASE_ACCESS_TOKEN@gitlab.com/${CI_PROJECT_PATH}.git
git add sushi-config.yaml
git commit -m "[ig-release]: Update sushi-config for release ${MVN_IG_VERSION} [skip ci]"
git tag -a "${MVN_IG_VERSION}" -m "$CI_COMMIT_BRANCH"
git push gitlab-ci HEAD:${CI_COMMIT_BRANCH}


#    Feature PR
#          |
#          v
#    uat
#    2.5.0-SNAPSHOT
#    
#    Release workflow
#          |
#          +-- remove "-SNAPSHOT"
#          |
#          +-- create tag
#          |
#          +-- open rollup PR
#    
#    Merge PR
#          |
#          v
#    main
#    2.5.0
#    
#    Workflow on merge to main
#          |
#          +-- bump uat to 2.6.0-SNAPSHOT