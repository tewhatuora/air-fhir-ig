#!/bin/bash -x

#  UAT
#  |
#  |  release pipeline
#  |
#  +--> remove -SNAPSHOT
#  |
#  +--> commit release version to UAT
#  |
#  +--> create tag (v1.2.3)
#  |
#  +--> create PR from release/tag into main
#  |
#  +--> increment version on UAT to 1.2.4-SNAPSHOT

if [[ "${CI_COMMIT_BRANCH}" != "uat" && "${CI_COMMIT_BRANCH}" != "uat-V1" ]]; then
  echo "Expecting the branch to be either [uat/uat-V1] found ${CI_COMMIT_BRANCH}"
  exit 5
fi

git fetch origin
git switch ${CI_COMMIT_BRANCH}
git pull --rebase

SUSHI_CONFIG_FILE="sushi-config.yaml"
RELEASE_LABEL=$(yq .releaseLabel ${SUSHI_CONFIG_FILE})
CURRENT_VERSION=$(yq '.version' ${SUSHI_CONFIG_FILE})
RELEASE_VERSION="${CURRENT_VERSION%-SNAPSHOT}"
CURRENT_VERSION_URL_FRIENDLY=$(/usr/bin/echo "${CURRENT_VERSION}" | tr -d .)
MERGE_PR_BRANCH="release/merge-${RELEASE_VERSION}"

git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config user.name "github-actions[bot]"

case "${CI_COMMIT_BRANCH}" in
    uat)
        MERGE_TARGET="main"
        ;;
    uat-V1)
        MERGE_TARGET="main-V1"
        ;;
    *)
        MERGE_TARGET="${CI_COMMIT_BRANCH}"
        ;;
esac

echo "RELEASE_LABEL=${RELEASE_LABEL}"
echo "RELEASE_VERSION=${RELEASE_VERSION}" 
echo "CURRENT_VERSION=${CURRENT_VERSION}" 
echo "CURRENT_VERSION_URL_FRIENDLY=${CURRENT_VERSION_URL_FRIENDLY}" 
echo "MERGE_TARGET=${MERGE_TARGET}"
echo "MERGE_PR_BRANCH=${MERGE_PR_BRANCH}"
echo "SUSHI_CONFIG_FILE=${SUSHI_CONFIG_FILE}"

#####################
# snapshot -> release
#####################

echo "updating ${SUSHI_CONFIG_FILE} for release"
yq -i '(.status = "active" | .releaseLabel = "release" | .version = '"\"${RELEASE_VERSION}\""' )' ${SUSHI_CONFIG_FILE}
git add ${SUSHI_CONFIG_FILE}

#####################
# history.md
#####################

# if this version does not yet exist in the history.md file, add it
if [ $(grep -c "${CURRENT_VERSION}" input/pagecontent/history.md) -eq 0 ]
then
  # add an entry to the history.md log file with the new version
  echo Adding ${CURRENT_VERSION} to history.md 
  sed -i "5i - [${CURRENT_VERSION}](./branches/${CURRENT_VERSION_URL_FRIENDLY})" input/pagecontent/history.md

  # add the history.md update to git master branch, so the entry is stored
  git add input/pagecontent/history.md
fi

#####################
# push changes for release
#####################

git commit -m "[ig-release]: Update for release ${RELEASE_VERSION} [skip ci]"
echo "creating release tag ${RELEASE_VERSION} ${CI_COMMIT_BRANCH}"
git push origin ${CI_COMMIT_BRANCH}
git pull --rebase

git tag -a "${RELEASE_VERSION}" -m "${CI_COMMIT_BRANCH}"
git push origin ${RELEASE_VERSION}
git pull --rebase

#####################
# create PR for main branch
#####################

git switch ${MERGE_TARGET}
git pull --rebase
git switch -c ${MERGE_PR_BRANCH}
git merge ${CI_COMMIT_BRANCH}
git push origin ${MERGE_PR_BRANCH}

# create PR not allowed in workflow
# gh pr create \
#   --base ${MERGE_TARGET} \
#   --head ${MERGE_PR_BRANCH} \
#   --title "release ${CI_COMMIT_BRANCH} to ${MERGE_TARGET}" \
#   --body "release workflow from ${CI_COMMIT_BRANCH}"

#####################
# increment version 
#####################

git switch ${CI_COMMIT_BRANCH}
git pull --rebase

counter=".[-2]"

if [[ ${RELEASE_MAJOR} = "true" ]]
  then
    counter=".[-3]"
fi

echo "updating ${SUSHI_CONFIG_FILE} version to SNAPSHOT"
yq -i '(. | select(has("version")).version |= (split(".") | '"${counter}"' |= ((. tag = "!!int") + 1) | join(".") + "-SNAPSHOT" ))' ${SUSHI_CONFIG_FILE}
yq -i '(.status = "draft" | .releaseLabel = "ci-build")' ${SUSHI_CONFIG_FILE}

# resample version after change
NEW_VERSION=$(yq .version ${SUSHI_CONFIG_FILE})
echo "NEW_VERSION=${NEW_VERSION}"

git add ${SUSHI_CONFIG_FILE}
git commit -m "[ig-release]: Update version to ${NEW_VERSION} [skip ci]" || echo "No changes to commit"
# git push gitlab-ci HEAD:${CI_COMMIT_BRANCH}
git push origin ${CI_COMMIT_BRANCH}
git pull --rebase


git switch ${CI_COMMIT_BRANCH}
