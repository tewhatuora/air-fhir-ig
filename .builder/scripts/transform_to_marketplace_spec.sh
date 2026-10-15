#!/usr/bin/env bash
set -euo pipefail

# Create a cut-down OpenAPI spec for external/marketplace clients.
# Aligned with DSH marketplace spec v0.7.13.
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

# Step 1: Set info, servers, paths, and keep only external schemas/params/responses/examples.
# Servers aligned with DSH marketplace spec URL pattern.
# Paths include CarePlan/$view for marketplace.
# Parameters: NO X-Api-Key (gateway handles auth via bearer token).
yq '
.info.description = "This API provides the ability to create, modify and retrieve Immunisation records from AIR ImmSoT database for approved external system-to-system clients."
|
.info.version = "2.0.0"
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
.paths."/CarePlan/$view" |= pick(["post"])
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
.components.securitySchemes |= pick([
  "OAuth2ClientCredentials"
])
|
.components.parameters |= pick([
  "ID",
  "X-Correlation-ID",
  "If-Match",
  "request-context"
])
' "$INPUT" > "$TMP_FILE"

# Step 2: Set operation parameters — aligned with DSH spec.
# NO x-api-key on any endpoint (gateway handles auth via bearer token).
# Only X-Correlation-ID and request-context on operations, plus ID/If-Match where needed.
# Add CarePlan/$view parameters including nhi query param.
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
.paths."/CarePlan/$view".post.parameters = [
  {"$ref": "#/components/parameters/X-Correlation-ID"},
  {"$ref": "#/components/parameters/request-context"},
  {
    "name": "nhi",
    "in": "query",
    "required": true,
    "description": "The NHI identifier of the patient whose care plan is being viewed.",
    "schema": {"type": "string"},
    "example": "ZKN2155"
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
    "schema": {"type": "array", "maxItems": 1000, "items": {"type": "string"}},
    "description": "Used in standard search only. Exclude given status(s) [entered-in-error, completed, not-done]",
    "example": "entered-in-error,completed"
  },
  {
    "name": "status",
    "in": "query",
    "required": false,
    "explode": false,
    "schema": {"type": "array", "maxItems": 1000, "items": {"type": "string"}},
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

# Step 3: Rewrite _search description/requestBody for standard search only.
# Set CarePlan/$view security.
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
.paths."/CarePlan/$view".post.security = [
  {
    "OAuth2ClientCredentials": [
      "system/CarePlan.s"
    ]
  }
]
' "$TMP_FILE" > "${TMP_FILE}.2"
mv "${TMP_FILE}.2" "$TMP_FILE"

# Step 4: Set all security blocks to client_credentials OAuth 2 (aligned with DSH spec).
# Remove OAuth2Implicit — marketplace uses client_credentials with token URL.
# Add CarePlan.s scope for the new CarePlan endpoint.
yq '
.paths."/Immunization".post.security = [
  {
    "OAuth2ClientCredentials": [
      "system/Immunization.c"
    ]
  }
]
|
.paths."/Immunization/{ID}".get.security = [
  {
    "OAuth2ClientCredentials": [
      "system/Immunization.r"
    ]
  }
]
|
.paths."/Immunization/{ID}".put.security = [
  {
    "OAuth2ClientCredentials": [
      "system/Immunization.u"
    ]
  }
]
|
.paths."/Immunization/$upsert".post.security = [
  {
    "OAuth2ClientCredentials": [
      "system/Immunization.c",
      "system/Immunization.u"
    ]
  }
]
|
.paths."/Immunization/_search".post.security = [
  {
    "OAuth2ClientCredentials": [
      "system/Immunization.s"
    ]
  }
]
|
.components.securitySchemes.OAuth2ClientCredentials = {
  "type": "oauth2",
  "description": "OAuth 2.0 client_credentials flow for system-to-system access.",
  "flows": {
    "clientCredentials": {
      "tokenUrl": "https://api.ppd.auth.digital.health.nz/realms/hnz-integration/protocol/openid-connect/token",
      "scopes": {
        "system/Immunization.crus": "Full access to Immunization resources (create, read, update, search)",
        "system/Immunization.c": "Create Immunization resources",
        "system/Immunization.r": "Read Immunization resources",
        "system/Immunization.u": "Update Immunization resources",
        "system/Immunization.s": "Search Immunization resources",
        "system/CarePlan.s": "Search CarePlan resources"
      }
    }
  }
}
' "$TMP_FILE" > "${TMP_FILE}.2"
mv "${TMP_FILE}.2" "$TMP_FILE"

# Step 5: Keep meta.tag and doseNumberString as-is from the internal spec.
# These fields are retained in the marketplace spec per team decision.

# Step 6: Write final output.
mkdir -p "$(dirname "$OUTPUT")"
cp "$TMP_FILE" "$OUTPUT"

echo "Marketplace OpenAPI generated: $OUTPUT"