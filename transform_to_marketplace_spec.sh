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
trap 'rm -f "$TMP_FILE"' EXIT

# Step 1: keep only external paths and global components that can be referenced.
yq '
.info.description = "This API provides the ability to create, modify and retrieve Immunisation records from AIR ImmSoT database for approved external system-to-system clients."
|
.servers = [
  {
    "url": "https://api.air.digital.health.nz/s2s/fhir/R4",
    "description": "PROD - External system-to-system endpoint for version 1"
  },
  {
    "url": "https://api.air.digital.health.nz/s2s/fhir/R4/v2",
    "description": "PROD - External system-to-system endpoint for version 2"
  }
]
|
.paths |= pick([
  "/fhir/R4/Immunization",
  "/fhir/R4/Immunization/{ID}",
  "/fhir/R4/Immunization/_search",
  "/fhir/R4/Immunization/$upsert"
])
|
.paths."/fhir/R4/Immunization/{ID}" |= pick(["get", "put"])
|
.components.schemas |= pick([
  "Address",
  "AirImmunization",
  "AirImmunizationBundle",
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
.components.securitySchemes |= pick([
  "apikey_header",
  "OAuth2Implicit"
])
|
.components.securitySchemes.OAuth2Implicit.flows.implicit.scopes |= pick([
  "system/Immunization.crus",
  "system/Immunization.c",
  "system/Immunization.r",
  "system/Immunization.u",
  "system/Immunization.s"
])
|
.components.securitySchemes.OAuth2Implicit.flows.implicit.authorizationUrl = "https://api.auth.digital.health.nz/realms/hnz-integration/protocol/openid-connect/token"
|
.components.parameters |= pick([
  "ID",
  "X-Correlation-ID",
  "If-Match",
  "X-Api-Key",
  "request-context"
])
' "$INPUT" > "$TMP_FILE"

# Step 2: explicitly set operation parameters. This avoids brittle recursive deletes while preserving the external search contract.
yq '
.paths."/fhir/R4/Immunization".post.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/X-Api-Key"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/fhir/R4/Immunization/{ID}".get.parameters = [
  {"$ref": "#/components/parameters/ID"},
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/X-Api-Key"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/fhir/R4/Immunization/{ID}".put.parameters = [
  {"$ref": "#/components/parameters/ID"},
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/If-Match"},
  {"$ref": "#/components/parameters/X-Api-Key"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/fhir/R4/Immunization/$upsert".post.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/X-Api-Key"},
  {"$ref": "#/components/parameters/request-context"}
]
|
.paths."/fhir/R4/Immunization/_search".post.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/X-Api-Key"},
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
    "description": "To include the enrichment of the resources namely Patient, Organization, Practitioner & Location",
    "schema": {"type": "string"},
    "example": "Patient"
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

# Step 3: keep external standard _search behaviour and remove only JSON body/admin data-quality search.
yq '
.paths."/fhir/R4/Immunization/_search".post.description = "Search Immunisation records using the external standard search contract. Supported parameters are patient, target-disease, status-reason:not-in, status:not-in, status, _include, organisation and location. Clients may search by NHI value or full Patient reference. Supported scenarios include POST _search with query parameters and no body, POST _search with application/x-www-form-urlencoded body containing patient=ZKN2155, and POST _search with application/x-www-form-urlencoded body containing patient=https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKN2155. JSON request bodies and admin data-quality search parameters are not supported in the marketplace specification."
|
.paths."/fhir/R4/Immunization/_search".post.requestBody = {
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
          "_include": {"type": "string", "description": "Included resource enrichment."},
          "organisation": {"type": "string", "description": "Organisation identifier or reference."},
          "location": {"type": "string", "description": "Location/facility identifier or reference."}
        }
      },
      "examples": {
        "Search by NHI number": {"$ref": "#/components/examples/SearchNhi"},
        "Search by full Patient reference": {"$ref": "#/components/examples/SearchNhiFullReference"}
      }
    }
  }
}
|
.paths."/fhir/R4/Immunization/_search".post.security = [
  {
    "OAuth2Implicit": [
      "system/Immunization.s"
    ]
  }
]
' "$TMP_FILE" > "${TMP_FILE}.2"
mv "${TMP_FILE}.2" "$TMP_FILE"

# Step 4: remove admin scopes from retained operation security blocks explicitly.
yq '
.paths."/fhir/R4/Immunization/{ID}".put.security = [
  {
    "OAuth2Implicit": [
      "system/Immunization.u"
    ]
  }
]
|
.paths."/fhir/R4/Immunization/$upsert".post.security = [
  {
    "OAuth2Implicit": [
      "system/Immunization.c",
      "system/Immunization.u"
    ]
  }
]
' "$TMP_FILE" > "${TMP_FILE}.2"
mv "${TMP_FILE}.2" "$TMP_FILE"

# Step 5: write final output.
mkdir -p "$(dirname "$OUTPUT")"
cp "$TMP_FILE" "$OUTPUT"

echo "Marketplace OpenAPI generated: $OUTPUT"