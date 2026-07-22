#!/bin/bash

# Extract from the full open api spec only those interfaces and associated components which will be available in the marketplace

yq '
.info.description |= "This API provides the ability to create, modify and retrieve Immunisation records from AIR ImmSoT database."
|
.paths |= pick([
  "/fhir/R4/Immunization",
  "/fhir/R4/Immunization/{ID}",
  "/fhir/R4/Immunization/_search"])
| 
.components.schemas |= pick([
  "AcknowledgementBundle",
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
  "AirPatient",
  "PatientState",
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
  "ExtensionCodable",
  "MessageHeader",
  "BulkUpdateInputParameter",
  "BulkUpdateOutputParameter"])
|
.components.responses |= pick([
  "200",
  "201",
  "400",
  "401",
  "403",
  "404",
  "412",
  "422",
  "500"])
|
.components.examples |= pick([
  "AcknowledgementRequest",
  "OperationOutcomeAck",
  "UpdateSuccessDQIdentified",
  "UpdateSuccessDuplicateDQIdentified",
  "CreateSuccessDQPass",
  "CreateSuccessPotentialDuplicate",
  "InvalidData",
  "PreconditionFailed",
  "InternalError",
  "NotFound",
  "CreatePayload",
  "UpdatePayload",
  "UpdateDQIgnore",
  "ReadResult",
  "PatientReadResponse",
  "UpdatePatientStateParams",
  "SearchResult",
  "OrchestrationResult",
  "SearchNoMatch",
  "SearchNhi",
  "HistoryResult",
  "BulkUpdateRequest",
  "BulkUpdateResponse"])
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
.components.securitySchemes.OAuth2Implicit.flows.implicit.authorizationUrl |= "https://api.auth.digital.health.nz/realms/hnz-integration/protocol/openid-connect/token"
|
del(.. | select(. == "air-test*"))
|
del(.. | select(. == "air-admin*"))
|
.components.parameters |= pick(["ID", "NHI", "X-Correlation-ID", "If-Match", "X-Api-Key", "request-context"])
|
del(.. | select(.[] == "#/components/parameters/UserID" or .[] == "#/components/parameters/FacilityID" or .[] == "#/components/parameters/SourceSystemID"))
|
.paths[].*.parameters += ({"$ref": "#/components/parameters/request-context"})
' immsot-ig-template-local/package/content/ImmSoTAPI.yaml > immsot-ig-template-local/package/content/ImmSoTAPI_marketplace.yaml

