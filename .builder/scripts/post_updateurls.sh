#!/bin/bash
set -eo pipefail

# $ENV should be set by the builder

if [[ "${ENV}" == "uat"  ]]; then
  echo "Changing domain in html files from \"fhir-ig.digital.health.nz\" to \"fhir-ig-uat.digital.health.nz\""
  # update the urls, so navigation remains in the uat preview
  (cd output; sed -i 's|fhir-ig.digital.health.nz|fhir-ig-uat.digital.health.nz|g' *.html)
fi
