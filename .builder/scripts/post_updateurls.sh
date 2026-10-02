#!/bin/bash
set -eo pipefail

# $ENV should be set by the builder

if [[ "${ENV}" == "uat"  ]]; then
  echo "Changing history url in html files from \"https://standards.digital.health.nz/fhir/air/history.html\" to \"https://fhir-ig-uat.digital.health.nz/air-v1/history.html\""
  # update the urls, so navigation remains in the uat preview
  (cd output; sed -i 's|https://standards.digital.health.nz/fhir/air/history.html|https://fhir-ig-uat.digital.health.nz/air-v1/history.html|g' *.html)
  exit
fi

if [[ "${ENV}" == "prod"  ]]; then
  echo "Changing history url in html files from \"https://standards.digital.health.nz/fhir/air/history.html\" to \"https://fhir-ig.digital.health.nz/air-v1/history.html\""
  # update the urls, so navigation remains in the uat preview
  (cd output; sed -i 's|https://standards.digital.health.nz/fhir/air/history.html|https://fhir-ig.digital.health.nz/air-v1/history.html|g' *.html)
  exit
fi
