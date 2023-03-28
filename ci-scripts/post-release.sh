#!/bin/bash

file="sushi-config.yaml"
counter=".[-2]"

# checkout branch and pull latest after ig-release stage
git stash
git checkout -b "$CI_COMMIT_BRANCH" remotes/origin/${CI_COMMIT_BRANCH}
git pull
git stash pop

if [[ $RELEASE_MAJOR = "true" ]]
  then
    counter=".[-3]"
elif [[ "$CI_COMMIT_REF_NAME" = "release/"* ]]
  then
    counter=".[-1]"
fi

echo "updating version and sushi config file for development"
yq -i '(. | select(has("version")).version |= (split(".") | '"$counter"' |= ((. tag = "!!int") + 1) | join(".")))' $file
if [[ "$CI_COMMIT_REF_NAME" != "release/"* ]]
  then
    yq -i '(. | select(has("version")).version |= (split(".") | '.[-1]' |= 0 | join(".")))' $file
fi
yq -i '(.status = "draft" | .releaseLabel = "ci-build")' $file
version=$(yq .version $file)

echo "commit changes"
git config user.email "${GITLAB_USER_EMAIL}"
git config user.name "${GITLAB_USER_NAME}"
git remote add gitlab-ci https://oauth2:$RELEASE_ACCESS_TOKEN@gitlab.com/${CI_PROJECT_PATH}.git
git add $file
git commit -m "[ig-release]: Update version to ${version} [skip ci]" || echo "No changes to commit"
git push gitlab-ci HEAD:${CI_COMMIT_BRANCH} -o ci.skip