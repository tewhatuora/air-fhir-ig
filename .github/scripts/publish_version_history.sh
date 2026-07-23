#!/usr/bin/env bash

if [[ "${CI_COMMIT_BRANCH}" != "main" && "${CI_COMMIT_BRANCH}" != "main-V1"]]; then
  echo "Expecting the branch to be either [main/main-V1] found ${CI_COMMIT_BRANCH}"
  exit 5
fi

git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config user.name "github-actions[bot]"

# get the current IG version number
CURRENT_VERSION=$(yq '.version' sushi-config.yaml)
# get the current IG version number in a IG builder URL friendly format (remove .)
CURRENT_VERSION_URL_FRIENDLY=$(echo "${CURRENT_VERSION}" | tr -d .)

echo "CURRENT_VERSION=${CURRENT_VERSION}"
echo "CURRENT_VERSION_URL_FRIENDLY=${CURRENT_VERSION_URL_FRIENDLY}"

# create a new release branch for the current version and push it
# @TODO  does this have to be a branch can it be a tag?
git fetch
git push origin --delete ${CURRENT_VERSION_URL_FRIENDLY} || true
git checkout -b ${CURRENT_VERSION_URL_FRIENDLY}
git push --set-upstream origin ${CURRENT_VERSION_URL_FRIENDLY}

# request the FHIR IG auto-builder to deploy the release branch
echo Request the FHIR IG auto-builder to deploy the release branch ${CI_COMMIT_BRANCH}
curl -X POST "https://us-central1-fhir-org-starter-project.cloudfunctions.net/ig-commit-trigger" \
  -H "Content-type: application/json" \
  --data "{\"ref\": \"refs/heads/${CURRENT_VERSION_URL_FRIENDLY}\", \"repository\": {\"full_name\": \"tewhatuora/air-fhir-ig\"}}"
