#!/usr/bin/env bash
set -euo pipefail

# Create a cut-down OpenAPI spec for external/marketplace clients.
# Requires Mike Farah yq v4.x: https://github.com/mikefarah/yq

INPUT="${1:-immsot-ig-template-local/package/content/ImmSoTAPI.yaml}"
OUTPUT="${2:-immsot-ig-template-local/package/content/ImmSoTAPI_marketplace.yaml}"

if ! command -v yq >/dev/null 2>&1; then
  echo "ERROR: yq is required but was not found on PATH." >&2
  echo "Install Mike Farah yq v4.x: https://github.com/mikefarah/yq" >&2
  exit 1
fi

if [ ! -f "$INPUT" ]; then
  echo "ERROR: Input file not found: $INPUT" >&2
  exit 1
fi

TMP_FILE="$(mktemp)"
trap 'rm -f "$TMP_FILE" "${TMP_FILE}.2"' EXIT

# Step 1: keep only external paths and components that can be referenced.
yq '
.info.description = "This API provides the ability to create, modify and retrieve Immunisation records and retrieve CarePlan immunisation plans/schedules from AIR ImmSoT for approved external system-to-system clients."
|
.info.version |= sub("-SNAPSHOT$"; "")
|
.servers = [
  {
    "url": "https://api.air.digital.health.nz/s2s/fhir/R4",
    "description": "PROD - External system-to-system endpoint for version 1"
  },
  {
    "url": "https://api.air.digital.health.nz/s2s/fhir/R4/v2",
    "description": "PROD - External system-to-system endpoint for version 2"
  },
  {
    "url": "https://api.test.air.digital.health.nz/s2s/fhir/R4",
    "description": "TEST - External system-to-system endpoint for version 1"
  },
  {
    "url": "https://api.test.air.digital.health.nz/s2s/fhir/R4/v2",
    "description": "TEST - External system-to-system endpoint for version 2"
  },
  {
    "url": "https://api.uat.air.digital.health.nz/s2s/fhir/R4",
    "description": "UAT - External system-to-system endpoint for version 1"
  },
  {
    "url": "https://api.uat.air.digital.health.nz/s2s/fhir/R4/v2",
    "description": "UAT - External system-to-system endpoint for version 2"
  }
]
|
.paths = {
  "/Immunization": .paths."/fhir/R4/Immunization",
  "/Immunization/{ID}": .paths."/fhir/R4/Immunization/{ID}",
  "/Immunization/_search": .paths."/fhir/R4/Immunization/_search",
  "/Immunization/$upsert": .paths."/fhir/R4/Immunization/$upsert",
  "/CarePlan/$view": .paths."/fhir/R4/CarePlan/$view"
}
|
.paths."/Immunization/{ID}" |= pick(["get", "put"])
|
.components.schemas |= pick([
  "Address",
  "AirImmunization",
  "AirImmunizationBundle",
  "AirCarePlan",
  "AirImmunizationRecommendation",
  "CarePlanBundle",
  "ContactPoint",
  "Contained",
  "AirExtension",
  "Identifier",
  "Link",
  "DQExtension",
  "ExtensionBoolean",
  "ExtensionDate",
  "ExtensionDateTime",
  "ExtensionInteger",
  "ExtensionString",
  "LogicalReference",
  "OperationOutcome",
  "RelatedPerson",
  "Observation",
  "ViolationExtension",
  "ViolationsExtension",
  "OrchestrationPatient",
  "OrchesExtensionCable",
  "BirthDateExtension",
  "OrchesPatientAddress",
  "OrchestrationLocation",
  "OrchesLocationAlias",
  "OrchesLocationType",
  "OrchesTelecom",
  "OrchestrationPractitioner",
  "OrchesPracQualifications",
  "OrchesPracExtension",
  "OrchesPreacIdentifier",
  "OrchesPracName",
  "OrchesPracCommunication",
  "OrchestrationOrganization",
  "OrchesOrgTelecom",
  "OrchesOrgAlias",
  "OrchesOrgType",
  "OrchestrationImmunizationBundle",
  "CodeableConceptArray",
  "CodeableConcept",
  "ExtensionCodable"
])
|
.components.responses |= pick([
  "200",
  "201",
  "400",
  "401",
  "403",
  "404",
  "422",
  "429",
  "500"
])
|
.components.examples |= pick([
  "UpdateSuccessDQIdentified",
  "UpdateSuccessDuplicateDQIdentified",
  "CreateSuccessDQPass",
  "CreateSuccessPotentialDuplicate",
  "InvalidData",
  "TooManyReuqest",
  "InternalError",
  "NotFound",
  "CreatePayload",
  "UpdatePayload",
  "UpdateDQIgnore",
  "OrchestrationResult",
  "SearchNoMatch",
  "SearchNhi"
])
|
.components.examples.SearchNhiFullReference = {
  "summary": "Search by full Patient reference",
  "value": "patient=https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKN2155"
}
|
# The marketplace spec is v2-oriented, where Immunization uses the string
# doseNumberString field. The source spec documents both versions
# (doseNumberPositiveInt for v1 and doseNumberString for v2), so restrict the
# marketplace AirImmunization schema/examples to the v2 form here.
# AirImmunizationRecommendation keeps doseNumberString (recommendations use the
# string form in both versions).
.components.schemas.AirImmunization.properties.protocolApplied.items.properties = {
  "doseNumberString": {
    "description": "Dose Number. If provided in the request, it will be retained in the response.",
    "type": "string"
  }
}
|
.components.schemas.AirImmunization.properties.protocolApplied.items.properties.doseNumberString.description style="single"
|
(.components.examples | .. | select(has("doseNumberPositiveInt"))) |= (.doseNumberString = (.doseNumberPositiveInt | tostring) | del(.doseNumberPositiveInt))
|
# The client_credentials scheme is defined in ImmSoTAPI.yaml (the source spec).
# Keep that definition and only override the marketplace-specific token URL,
# description and external scope subset here.
.components.securitySchemes |= pick(["client_credentials"])
|
.components.securitySchemes.client_credentials.description = "__MARKETPLACE_CLIENT_CREDENTIALS_DESCRIPTION__"
|
.components.securitySchemes.client_credentials.flows.clientCredentials.tokenUrl = "https://api.ppd.auth.digital.health.nz/realms/hnz-integration/protocol/openid-connect/token"
|
.components.securitySchemes.client_credentials.flows.clientCredentials.scopes |= pick([
  "system/Immunization.crus",
  "system/Immunization.c",
  "system/Immunization.r",
  "system/Immunization.s",
  "system/Immunization.u",
  "system/CarePlan.s",
  "system/ImmunizationRecommendation.r"
])
|
.components.parameters |= pick([
  "ID",
  "X-Correlation-ID",
  "If-Match",
  "request-context"
])
' "$INPUT" > "$TMP_FILE"

# Step 2: explicitly set operation parameters. This avoids brittle recursive deletes.
yq '
.paths."/Immunization".post.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/Immunization/{ID}".get.parameters = [
  {"$ref": "#/components/parameters/ID"},
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/Immunization/{ID}".put.parameters = [
  {"$ref": "#/components/parameters/ID"},
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/If-Match"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/Immunization/$upsert".post.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/CarePlan/$view".get.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/request-context"},
  {
    "name": "subject",
    "in": "query",
    "required": true,
    "description": "FHIR Reference(Patient) identifying the consumer, e.g. Patient/ZCZ1947. Must resolve to resourceType Patient. Absolute URLs are accepted only if they match the AIR Patient reference base; otherwise rejected with 400.",
    "schema": {"type": "string"},
    "example": "Patient/ZCZ1947"
  }
]
|
.paths."/Immunization/_search".post.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/request-context"},
  {
    "name": "patient",
    "in": "query",
    "required": false,
    "description": "Patient identifier or full Patient reference. Supported values include ZKN2155 and https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKN2155. A full Patient reference is processed as a FHIR reference search against Immunization.patient.reference.",
    "schema": {"type": "string"},
    "examples": {
      "nhi": {"value": "ZKN2155", "summary": "NHI identifier"},
      "fullReference": {"value": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKN2155", "summary": "Full Patient reference"}
    }
  },
  {
    "name": "target-disease",
    "in": "query",
    "required": false,
    "explode": false,
    "schema": {"type": "array", "maxItems": 1000, "items": {"type": "string"}},
    "description": "Used in standard search only. Restrict to specific target disease(s) by system|code",
    "example": "http://snomed.info/sct|123456,http://loinc.org|7890."
  },
  {
    "name": "status-reason:not-in",
    "in": "query",
    "required": false,
    "explode": false,
    "schema": {"type": "array", "maxItems": 1000, "items": {"type": "string"}},
    "description": "Used in standard search only. Exclude given status_reason(s) by system|code",
    "example": "https://standards.digital.health.nz/ns/air-status-reason-terms|CPI,https://standards.digital.health.nz/ns/air-status-reason-terms|RESCHO"
  },
  {
    "name": "status:not-in",
    "in": "query",
    "required": false,
    "explode": false,
    "schema": {"type": "array", "maxItems": 1000, "items": {"type": "string", "enum": ["entered-in-error", "completed", "not-done"]}},
    "description": "Used in standard search only. Exclude given status(s) [entered-in-error, completed, not-done]",
    "example": "entered-in-error,completed"
  },
  {
    "name": "status",
    "in": "query",
    "required": false,
    "explode": false,
    "schema": {"type": "array", "maxItems": 1000, "items": {"type": "string", "enum": ["entered-in-error", "completed", "not-done"]}},
    "description": "Used in standard search only. Include only given status(s) [entered-in-error, completed, not-done]",
    "example": "entered-in-error,completed"
  },
  {
    "name": "_include",
    "in": "query",
    "explode": true,
    "description": "To include enrichment resources. Multiple _include values are supported.",
    "schema": {
      "type": "array",
      "maxItems": 10,
      "items": {
        "type": "string",
        "enum": ["*", "Patient", "Practitioner", "Location", "Organization", "Immunization:patient", "Immunization:performer", "Immunization:location"]
      }
    },
    "example": "Patient"
  },
  {
    "name": "_include:iterate",
    "in": "query",
    "explode": true,
    "description": "To include enrichment resources of secondary included resources. Multiple _include:iterate values are supported.",
    "schema": {
      "type": "array",
      "items": {
        "type": "string",
        "enum": ["Location:organization"]
      },
      "minItems": 0,
      "maxItems": 1
    },
    "examples": {
      "managingOrganization": {
        "value": "Location:organization",
        "summary": "managingOrganization (HPI-O) of the location"
      }
    }
  },
  {
    "name": "organisation",
    "in": "query",
    "required": false,
    "description": "Restrict results to immunisation events associated with the given organisation identifier or reference.",
    "schema": {"type": "string"}
  },
  {
    "name": "location",
    "in": "query",
    "required": false,
    "description": "Restrict results to immunisation events associated with the given location or facility identifier/reference.",
    "schema": {"type": "string"}
  }
]
' "$TMP_FILE" > "${TMP_FILE}.2"
mv "${TMP_FILE}.2" "$TMP_FILE"

# Step 3: keep external standard _search behaviour and remove JSON/admin data-quality search.
# Do not use example keys with spaces here; Mike Farah yq can lexer-fail on those in object literals.
yq '
.paths."/Immunization/_search".post.description = "Search Immunisation records using the external standard search contract. Supported parameters are patient, target-disease, status-reason:not-in, status:not-in, status, _include, _include:iterate, organisation and location. Clients may search by NHI value or full Patient reference. Supported scenarios include POST _search with query parameters and no body, POST _search with application/x-www-form-urlencoded body containing patient=ZKN2155, and POST _search with application/x-www-form-urlencoded body containing patient=https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKN2155. JSON request bodies and admin data-quality search parameters are not supported in the marketplace specification."
|
.paths."/Immunization/_search".post.requestBody = {
  "required": false,
  "description": "Optional form body for standard search parameters. Do not send JSON for _search.",
  "content": {
    "application/x-www-form-urlencoded": {
      "schema": {
        "type": "object",
        "properties": {
          "patient": {"type": "string", "description": "NHI value or full Patient reference."},
          "target-disease": {"type": "string", "description": "Target disease in system|code format."},
          "status-reason:not-in": {"type": "string", "description": "Comma-separated status reason exclusions."},
          "status:not-in": {"type": "string", "description": "Comma-separated status exclusions."},
          "status": {"type": "string", "description": "Comma-separated statuses to include."},
          "_include": {"type": "array", "items": {"type": "string"}, "description": "One or more included resource enrichments."},
          "_include:iterate": {"type": "array", "items": {"type": "string"}, "description": "One or more iterative included resource enrichments."},
          "organisation": {"type": "string", "description": "Organisation identifier or reference."},
          "location": {"type": "string", "description": "Location/facility identifier or reference."}
        }
      },
      "examples": {
        "searchByNhi": {"$ref": "#/components/examples/SearchNhi"},
        "searchByFullPatientReference": {"$ref": "#/components/examples/SearchNhiFullReference"}
      }
    }
  }
}
|
.paths."/Immunization/_search".post.security = [
  {
    "client_credentials": [
      "system/Immunization.s"
    ]
  }
]
' "$TMP_FILE" > "${TMP_FILE}.2"
mv "${TMP_FILE}.2" "$TMP_FILE"

# Step 4: remove admin scopes from retained operation security blocks explicitly.
yq '
.paths."/Immunization".post.security = [
  {
    "client_credentials": [
      "system/Immunization.c"
    ]
  }
]
|
.paths."/Immunization/{ID}".get.security = [
  {
    "client_credentials": [
      "system/Immunization.r"
    ]
  }
]
|
.paths."/Immunization/{ID}".put.security = [
  {
    "client_credentials": [
      "system/Immunization.u"
    ]
  }
]
|
.paths."/Immunization/$upsert".post.security = [
  {
    "client_credentials": [
      "system/Immunization.c",
      "system/Immunization.u"
    ]
  }
]
|
.paths."/CarePlan/$view".get.security = [
  {
    "client_credentials": [
      "system/CarePlan.s",
      "system/ImmunizationRecommendation.r",
      "system/Immunization.r"
    ]
  }
]
' "$TMP_FILE" > "${TMP_FILE}.2"
mv "${TMP_FILE}.2" "$TMP_FILE"

# Step 5: emit the reference client_credentials description in its exact
# wrapped form (yq would write it as a single long line).
python3 - "$TMP_FILE" <<'PY'
import sys

path = sys.argv[1]
with open(path, encoding="utf-8") as handle:
    text = handle.read()

placeholder_plain = "      description: __MARKETPLACE_CLIENT_CREDENTIALS_DESCRIPTION__"
placeholder_quoted = '      description: "__MARKETPLACE_CLIENT_CREDENTIALS_DESCRIPTION__"'
description = (
    '      description: "Intended for the server-to-server authentication, this flow describes\\\n'
    '        \\ an approach when the client application acts on its own behalf rather than\\\n'
    '        \\ on behalf of any individual user. In most scenarios, this flow provides\\\n'
    '        \\ the means to allow users to specify their credentials in the client application,\\\n'
    '        \\ so it can access the resources under the client\u2019s control"'
)

if placeholder_quoted in text:
    text = text.replace(placeholder_quoted, description, 1)
elif placeholder_plain in text:
    text = text.replace(placeholder_plain, description, 1)
else:
    sys.exit("ERROR: client_credentials description placeholder not found")
if not text.endswith("\n"):
    text += "\n"

with open(path, "w", encoding="utf-8") as handle:
    handle.write(text)
PY

# Step 5.5: guardrails. Fail the build rather than silently publish a
# marketplace spec that has drifted from the external contract.
if grep -qE 'OAuth2Implicit|authorizationUrl|implicit:' "$TMP_FILE"; then
  echo "ERROR: marketplace spec contains an implicit OAuth flow; expected client_credentials only." >&2
  exit 1
fi

if grep -q 'x-api-key' "$TMP_FILE"; then
  echo "ERROR: marketplace spec must not expose the x-api-key header." >&2
  exit 1
fi

yq -e '
  (.components.securitySchemes | length) == 1 and
  (.components.securitySchemes | has("client_credentials")) and
  (.components.securitySchemes.client_credentials.flows | has("clientCredentials")) and
  (.components.securitySchemes.client_credentials.flows | has("implicit") | not) and
  (.components.parameters | has("UserID") | not) and
  (.components.parameters | has("Api-Version") | not) and
  (.components.examples | has("TooManyReuqest")) and
  (.components.schemas.AirImmunization.properties.protocolApplied.items.properties | has("doseNumberString")) and
  (.components.schemas.AirImmunization.properties.protocolApplied.items.properties | has("doseNumberPositiveInt") | not) and
  (.components.schemas.AirImmunizationRecommendation.properties.recommendation.items.properties | has("doseNumberString"))
' "$TMP_FILE" >/dev/null || {
  echo "ERROR: marketplace spec failed contract guardrails (security scheme, parameters, examples, or doseNumber fields)." >&2
  exit 1
}

yq -e '([.paths[][].security[]? | keys[]] | unique | join(",")) == "client_credentials"' "$TMP_FILE" >/dev/null || {
  echo "ERROR: marketplace spec operations must all reference the client_credentials scheme." >&2
  exit 1
}

if [ "$(tail -c 1 "$TMP_FILE" | wc -l)" -ne 1 ]; then
  echo "ERROR: marketplace spec must end with a newline." >&2
  exit 1
fi

# Step 6: write final output.
mkdir -p "$(dirname "$OUTPUT")"
cp "$TMP_FILE" "$OUTPUT"

echo "Marketplace OpenAPI generated: $OUTPUT"