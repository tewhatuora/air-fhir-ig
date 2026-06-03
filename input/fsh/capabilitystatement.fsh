// ============================================================
// AIR ImmSoT Capability Statement
// Aligned with OpenAPI Spec v2.1.0
// 
// Versioning convention:
//   - This CapabilityStatement version should match the OpenAPI spec version.
//   - When adding/removing operations, search params, or resources, bump the
//     minor version here AND regenerate the OpenAPI spec via generate-openapi.js.
// ============================================================

Alias: $EventCapabilityMode = http://hl7.org/fhir/event-capability-mode
Alias: $exp = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation

Instance: AIRCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition

* url = "https://standards.digital.health.nz/fhir/air/CapabilityStatement/AIRCapabilityStatement"
* version = "2.1.0"
* name = "AIRCapabilityStatement"
* title = "AIR FHIR Server Capability Statement"
* status = #active
* experimental = false
* date = "2025-06-01"
* publisher = "Health New Zealand | Te Whatu Ora"
* contact.name = "Health New Zealand | Te Whatu Ora"
* contact.telecom.system = #url
* contact.telecom.value = "https://www.tewhatuora.govt.nz/"
* description = """The Aotearoa Immunisation Register (AIR) FHIR R4 API (ImmSoT).

API versioning:
- Internal Health NZ consumers call https://air.api.digital.health.nz/fhir/R4.  
  Omit APIVersion header (or set APIVersion=1) for v1 behaviour; set APIVersion=2 for v2.
- External consumers call https://api.air.digital.health.nz/s2s/fhir/R4 (v1)  
  or https://api.air.digital.health.nz/s2s/fhir/R4/v2 (v2).  
  Both external paths are gateway routes that forward to the internal /fhir/R4 backend."""
* purpose = "Defines the capabilities of the AIR ImmSoT FHIR server so that clients can discover supported interactions, search parameters, and custom operations."
* copyright = "© 2025 Health New Zealand | Te Whatu Ora"

* kind = #instance
* implementation.description = "PROD - ImmSoT Service endpoint"
* implementation.url = "https://air.api.digital.health.nz/fhir/R4"

* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #application/fhir+json

// ─── Security ────────────────────────────────────────────────────────────────

* rest.mode = #server
* rest.documentation = """AIR ImmSoT FHIR R4 server.

All requests require:
- x-api-key header (API Gateway key)
- OAuth2 bearer token with the appropriate scope (see security schemes)
- Optional: UserID, FacilityID, SourceSystemID, X-Correlation-ID headers for audit

API version selection is controlled by the APIVersion header (values: 1 or 2, default: 1)."""

* rest.security.cors = true
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth
* rest.security.description = "OAuth2 client credentials flow. Obtain a bearer token from the token endpoint then include it as Authorization: Bearer <token>."

// OAuth SMART extension (token + authorize endpoints)
* rest.security.extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris"
* rest.security.extension.extension[0].url = "token"
* rest.security.extension.extension[=].valueUri = "https://auth.integration.covid19.health.nz/oauth2/token"
* rest.security.extension.extension[+].url = "authorize"
* rest.security.extension.extension[=].valueUri = "https://auth.integration.covid19.health.nz/oauth2/authorize"

// ─── Immunization Resource ────────────────────────────────────────────────────

* rest.resource[0].type = #Immunization
* rest.resource[=].profile = Canonical(AIRImmunization)
* rest.resource[=].documentation = "Core immunisation event resource. All interactions operate on FHIR Immunization resources conforming to the AIRImmunization profile."

// CREATE - POST /Immunization
* rest.resource[=].interaction[0].code = #create
* rest.resource[=].interaction[=].documentation = """**POST** `[base]/Immunization`

Creates a new immunisation event. Performs validation checks before persisting.

**Required scope:** `system/Immunization.c`

**Request headers:**
- `UserID` (optional) – end-user identifier for audit
- `FacilityID` (optional) – facility where vaccination took place
- `SourceSystemID` (optional) – source system identifier (HIP Integration Application list)
- `X-Correlation-ID` (optional) – correlation UUID for tracing
- `x-api-key` (required) – API Gateway key
- `APIVersion` (optional, default=1) – API version selector (1 or 2)

**Responses:**
- `201 Created` – immunisation record created; Location and ETag headers returned
- `422 Unprocessable Entity` – validation failed (OperationOutcome)
- `403 Forbidden` – insufficient scope
- `429 Too Many Requests` – rate limit exceeded
- `500 Internal Server Error`"""

// READ - GET /Immunization/{id}
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].documentation = """**GET** `[base]/Immunization/{ID}`

Reads a single immunisation event by its ImmSoT logical ID. Returns the enriched Immunization bundle including Patient, Organization, Practitioner and Location resources when available.

**Required scope:** `system/Immunization.r`

**Responses:**
- `200 OK` – Immunization resource (OrchestrationImmunizationBundle)
- `400 Bad Request`
- `403 Forbidden`
- `404 Not Found`
- `429 Too Many Requests`
- `500 Internal Server Error`"""

// UPDATE - PUT /Immunization/{id}
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[=].documentation = """**PUT** `[base]/Immunization/{ID}`

Updates an existing immunisation event. Performs validation and optimistic concurrency check via the `If-Match` header (required, must contain the current versionId ETag).

**Required scope:** `system/Immunization.u` or `air-admin/Immunization.u`

**Request headers (additional to standard):**
- `If-Match` (required) – current versionId ETag, e.g. `"3"`

To suppress data-quality re-evaluation for a known-good update, include in the request body `meta.extension` the `dqIgnore: true` flag (see UpdateDQIgnore example).

**Responses:**
- `200 OK` – updated Immunization resource; data-quality results in meta
- `400 Bad Request`
- `401 Unauthorized`
- `403 Forbidden`
- `422 Unprocessable Entity` – validation failure
- `500 Internal Server Error`"""

// HISTORY-INSTANCE - GET /Immunization/{id}/_history
* rest.resource[=].interaction[+].code = #history-instance
* rest.resource[=].interaction[=].documentation = """**GET** `[base]/Immunization/{ID}/_history`

Returns all versions of an immunisation event as a FHIR history Bundle (type=history). Each bundle entry is a full Immunization resource snapshot at that version, including data-quality metadata in `meta.extension`.

**Required scope:** `system/Immunization.r` or `air-admin/Immunization.r`

**Responses:**
- `200 OK` – Bundle (type=history)
- `400 Bad Request`
- `403 Forbidden`
- `429 Too Many Requests`
- `500 Internal Server Error`"""

// SEARCH-TYPE - POST /Immunization/_search
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].documentation = """**POST** `[base]/Immunization/_search`

Searches for immunisation events. Supports two search modes:

**Standard NHI search** – requires `patient` parameter (NHI number or full Patient reference). Optional filters: `target-disease`, `status-reason:not-in`, `status:not-in`. Include enriched related resources via `_include`.

**Data-quality admin search** – requires `_query=data-quality`, `_lastUpdated` (range or exact), `_offset`, `_count`. Restricted to `air-admin/Immunization.s` scope.

The request body should be `application/x-www-form-urlencoded` (not JSON). Both query parameters and form-body parameters are supported.

**Required scope:** `system/Immunization.s` or `air-admin/Immunization.s`

**Responses:**
- `200 OK` – Bundle (type=searchset); total=0 when no records found
- `400 Bad Request`
- `401 Unauthorized`
- `403 Forbidden`
- `429 Too Many Requests`
- `500 Internal Server Error`"""

* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
* rest.resource[=].updateCreate = false
* rest.resource[=].conditionalCreate = false
* rest.resource[=].conditionalRead = #not-supported
* rest.resource[=].conditionalUpdate = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=].referencePolicy = #logical

// _include parameters
* rest.resource[=].searchInclude[0] = "*"
* rest.resource[=].searchInclude[+] = "Immunization:patient"
* rest.resource[=].searchInclude[+] = "Immunization:performer"
* rest.resource[=].searchInclude[+] = "Immunization:location"

// ─── Search Parameters ────────────────────────────────────────────────────────

// patient (required for standard search)
* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Immunization-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = """NHI number of the patient, or a full Patient reference URL.  
Examples:
- `patient=ZKN2155`
- `patient=https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZKN2155`

When a full URL is provided it is matched against `Immunization.patient.reference`."""

// target-disease (optional, standard search)
* rest.resource[=].searchParam[+].name = "target-disease"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Immunization-target-disease"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Filter by vaccine-preventable disease (system|code). Comma-separated for multiple values. E.g. `http://snomed.info/sct|66071002`."

// status-reason:not-in (optional, standard search)
* rest.resource[=].searchParam[+].name = "status-reason:not-in"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Immunization-StatusReason"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = """Exclude immunisation events with the specified status reason codes. Accepted formats (comma-separated):
- `system|code` e.g. `https://standards.digital.health.nz/ns/air-status-reason-terms|CPI`
- `|code` or bare `code` for system-independent matching."""

// status:not-in (optional, standard search)
* rest.resource[=].searchParam[+].name = "status:not-in"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Immunization-Status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Exclude immunisation events with the specified status codes. Allowed values: `entered-in-error`, `completed`, `not-done`."

// status (data-quality search only)
* rest.resource[=].searchParam[+].name = "status"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Immunization-status"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Used in data-quality search only. Include only events with the given status(es). Defaults to all statuses if omitted. Allowed values: `entered-in-error`, `completed`, `not-done`."

// _query (data-quality search)
* rest.resource[=].searchParam[+].name = "_query"
* rest.resource[=].searchParam[=].definition = "https://standards.digital.health.nz/fhir/air/SearchParameter/Immunization-data-quality"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = "Set to `data-quality` to invoke the admin data-quality search. Requires `air-admin/Immunization.s` scope. Must be combined with `_lastUpdated`, `_offset`, and `_count`."

// _lastUpdated (data-quality search)
* rest.resource[=].searchParam[+].name = "_lastUpdated"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-lastUpdated"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "Used in data-quality search. Supports `eq`, `ge`, and `le` prefixes. E.g. `ge2023-05-11T00:25:20.641Z` or `le2023-06-01`."

// _offset (data-quality search)
* rest.resource[=].searchParam[+].name = "_offset"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-offset"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "Used in data-quality search. Number of records to skip. Default: 0."

// _count (data-quality search)
* rest.resource[=].searchParam[+].name = "_count"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-count"
* rest.resource[=].searchParam[=].type = #number
* rest.resource[=].searchParam[=].documentation = "Used in data-quality search. Maximum records to return (1–100). Default: 100."

// _includeMigratedData (data-quality search)
* rest.resource[=].searchParam[+].name = "_includeMigratedData"
* rest.resource[=].searchParam[=].definition = "https://standards.digital.health.nz/fhir/air/SearchParameter/Immunization-includeMigratedData"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "Used in data-quality search only. Set to `true` to include migrated data. Default: `false`."

// _dqStatus (data-quality search)
* rest.resource[=].searchParam[+].name = "_dqStatus"
* rest.resource[=].searchParam[=].definition = "https://standards.digital.health.nz/fhir/air/SearchParameter/Immunization-dqStatus"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Used in data-quality search only. Filter by data quality status. Allowed values: `I` (Identified), `A` (Accepted), `P` (Passed). Comma-separated."

// _include (enrichment)
* rest.resource[=].searchParam[+].name = "_include"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-include"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "Include related resources in the response. Supported values: `Patient`, `Immunization:performer`, `Immunization:location`. E.g. `_include=Patient`."

// ─── Search Parameter Combinations ───────────────────────────────────────────

// Combination 1: standard search - patient required
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[0].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"

// Combination 2: standard search with optional filters
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[0].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "target-disease"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "status-reason:not-in"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "status:not-in"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "_include"

// Combination 3: data-quality admin search
* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[0].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_query"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_lastUpdated"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_offset"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "_count"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "_includeMigratedData"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "_dqStatus"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "status"

// ─── Immunization Operations ──────────────────────────────────────────────────

// $upsert - POST /Immunization/$upsert
* rest.resource[=].operation[0].name = "upsert"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/OperationDefinition/immunization-upsert"
* rest.resource[=].operation[=].documentation = """**POST** `[base]/Immunization/$upsert`

Performs an upsert using a deterministic matching algorithm (NHI + occurrence date + vaccine code + indication):
1. No match → create new event  
2. Single match → update the matched event  
3. Multiple matches → create new event (duplicate DQ violation raised)  
4. Processing failure → reject the request

**Required scope:** `system/Immunization.c` + `system/Immunization.u`

**Responses:** `200 OK` (updated) or `201 Created` (inserted), `400`, `403`, `422`, `429`, `500`"""

// $bulk-update - POST /Immunization/$bulk-update
* rest.resource[=].operation[+].name = "bulk-update"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/OperationDefinition/immunization-bulk-update"
* rest.resource[=].operation[=].documentation = """**POST** `[base]/Immunization/$bulk-update`

Atomic bulk create/upsert of immunisation events. Request body is a FHIR Parameters resource (`application/x-www-form-urlencoded`).

Each parameter entry has name `create` or `upsert` with a contained Immunization resource:
- `create` → always creates a new event
- `upsert` → applies the same matching algorithm as `$upsert`

The entire operation is atomic: if any event fails, the whole request is rejected.

**Required scope:** `system/Immunization.c` + `system/Immunization.u`

**Responses:** `200 OK` (Parameters resource with `created`/`updated` entries), `400`, `403`, `429`, `500`"""

// $match - POST /Immunization/{id}/$match
* rest.resource[=].operation[+].name = "match"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/OperationDefinition/immunization-match"
* rest.resource[=].operation[=].documentation = """**POST** `[base]/Immunization/{ID}/$match`

Manually matches an immunisation event to a planned event in the consumer's vaccination schedule.

Request body: FHIR Parameters with `version` (string), `plannedEventId` (string), and `reason.code` (string).

**Required scope:** `system/Immunization.c` + `system/Immunization.u`

**Responses:** `200 OK` (Bundle), `400`, `403`, `429`, `500`"""

// $unmatch - POST /Immunization/{id}/$unmatch
* rest.resource[=].operation[+].name = "unmatch"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/OperationDefinition/immunization-unmatch"
* rest.resource[=].operation[=].documentation = """**POST** `[base]/Immunization/{ID}/$unmatch`

Manually unmatches an immunisation event from a planned event.

Request body: same structure as `$match` with an unmatch reason code.

**Required scope:** `system/Immunization.c` + `system/Immunization.u`

**Responses:** `200 OK` (Bundle), `400`, `403`, `429`, `500`"""

// ─── Patient Resource ─────────────────────────────────────────────────────────

* rest.resource[+].type = #Patient
* rest.resource[=].profile = Canonical(AIRPatient)
* rest.resource[=].documentation = "ImmSoT consumer (patient) resource. Stores NHI-linked consumer state, sub-status, and schedule information."

// READ - GET /Patient/{NHI}
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[=].documentation = """**GET** `[base]/Patient/{NHI}`

Reads the current state of an ImmSoT consumer (returned as a FHIR Patient conforming to AIRPatient).

When the optional `origin-nhi-version` request header is supplied, the API compares it against the stored NHI version:
- Same version → return cached data  
- Different version → sync with NHI, update ImmSoT, return fresh data

**Required scope:** `system/Patient.r`

**Responses:** `200 OK`, `400`, `403`, `404`, `429`, `500`"""

* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
* rest.resource[=].updateCreate = false

// ─── Patient Operations ───────────────────────────────────────────────────────

// $update-state - POST /Patient/{NHI}/$update-state
* rest.resource[=].operation[0].name = "update-state"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/OperationDefinition/update-patient-state"
* rest.resource[=].operation[=].documentation = """**POST** `[base]/Patient/{NHI}/$update-state`

Updates a consumer's state and/or sub-status. Uses optimistic locking: the `version` parameter must match the server's current version, otherwise a `412 Precondition Failed` is returned.

At least one of `state` or `subStatus` must be specified. Omitting one leaves it unchanged. Set `subStatus` to null to clear it.

Request body: FHIR Parameters with `version` (integer), optionally `state` (string), optionally `subStatus` (string).

**Required scope:** `system/Patient.u`

**Responses:** `200 OK` (Patient), `400`, `403`, `404`, `412 Precondition Failed`, `429`, `500`"""

// $reassign-schedules - POST /Patient/{NHI}/$reassign-schedules
* rest.resource[=].operation[+].name = "reassign-schedules"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/OperationDefinition/reassign-patient-schedules"
* rest.resource[=].operation[=].documentation = """**POST** `[base]/Patient/{NHI}/$reassign-schedules`

Reassigns a consumer's immunisation schedules. Cancels existing schedules (including manual matches and MQ records) and creates new ones based on the supplied onboarding date. The schedule repair service is then run to regenerate matches against the new plan.

**Note:** Any manual match linked to a cancelled planned event is also unmatched.

Request body: FHIR Parameters with `reassignDate` (date).

**Required scope:** `air-admin/Patient.u` or `system/Patient.u`

**Responses:** `200 OK` (Patient), `400`, `403`, `429`, `500`"""

// $patient-history (history) - GET /Patient/{NHI}/_history
* rest.resource[=].operation[+].name = "patient-history"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/OperationDefinition/patient-history"
* rest.resource[=].operation[=].documentation = """**GET** `[base]/Patient/{NHI}/_history`

Returns all versions of an ImmSoT consumer as a FHIR history Bundle. Each entry is a full Patient snapshot including modification audit metadata (`air-modified-by`, `air-modified-source-system`) in `meta.extension`.

**Required scope:** `air-admin/Patient.r` or `system/Patient.r`

**Responses:** `200 OK` (Bundle, type=history), `400`, `403`, `429`, `500`"""

// ─── CarePlan Resource ────────────────────────────────────────────────────────

* rest.resource[+].type = #CarePlan
* rest.resource[=].profile = Canonical(AIRCarePlan)
* rest.resource[=].documentation = """Read a consumer's immunisation plan (schedule). Each CarePlan represents a single Antigen Group Vaccination (AGV) schedule and links planned ImmunizationRecommendation events and administered Immunization resources."""

* rest.resource[=].interaction[0].code = #search-type
* rest.resource[=].interaction[=].documentation = """**GET** `[base]/CarePlan/$view?nhi={NHI}`

Returns the consumer's full immunisation plan as a Bundle containing CarePlan, Immunization, and ImmunizationRecommendation resources.

**Required scope:** `system/CarePlan.s`

**Responses:** `200 OK` (CarePlanBundle), `400`, `403`, `429`, `500`"""

* rest.resource[=].searchParam[0].name = "nhi"
* rest.resource[=].searchParam[=].definition = "https://standards.digital.health.nz/fhir/air/SearchParameter/CarePlan-nhi"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "NHI identifier of the patient/consumer whose immunisation plan to retrieve. Required."

// ─── System-level Interactions ────────────────────────────────────────────────

* rest.interaction.code = #transaction

// $process-message - POST /Immunization/$process-message
* rest.operation[0].name = "process-message"
* rest.operation[=].definition = "http://hl7.org/fhir/OperationDefinition/MessageHeader-process-message"
* rest.operation[=].documentation = """**POST** `[base]/Immunization/$process-message`

Processes an incoming FHIR message Bundle (type=message) to acknowledge a previously sent immunisation update notification. Updates an existing acknowledgement record from status `SENT` to `RECEIVED`.

Request body: FHIR Bundle containing a MessageHeader with `response.code=ok` and an OperationOutcome entry.

**Required scope:** `system/MessageHeader.u`

**Responses:** `200 OK` (OperationOutcome), `401`, `403`, `422`, `429`, `500`"""

// ─── Messaging ────────────────────────────────────────────────────────────────

* messaging.documentation = "AIR supports HL7 FHIR messaging for immunisation update notifications sent to enrolled consumers and providers."

* messaging.supportedMessage[0].mode = $EventCapabilityMode#sender
* messaging.supportedMessage[=].definition = "https://standards.digital.health.nz/fhir/MessageDefinition/UpdateImmunisationRequestMessageDefinition"

* messaging.supportedMessage[+].mode = $EventCapabilityMode#sender
* messaging.supportedMessage[=].definition = "https://standards.digital.health.nz/fhir/MessageDefinition/UpdateImmunisationResponseMessageDefinition"