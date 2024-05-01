#!/bin/bash

# Extract from the full open api spec only those interfaces and associated components which will be available in the marketplace

yq '
.info.description |= "This API provides the ability to create, modify and retrieve Immunisation records from AIR ImmSoT database."
|
.paths |= pick([
  "/v2/fhir/Immunization",
  "/v2/fhir/Immunization/{ID}",
  "/v2/fhir/Immunization/_search"])
| 
.components.schemas |= pick([
  "Address",
  "AirImmunization",
  "AirImmunizationBundle",
  "CodeableConcept",
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
  "ViolationsExtension"])
|
.components.responses |= pick([
  "200",
  "201",
  "400",
  "401",
  "403",
  "404",
  "422",
  "500"])
|
.components.examples |= pick([
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
  "SearchResult",
  "SearchNoMatch",
  "SearchNhi"])
|
.components.securitySchemes.client_credentials.flows.clientCredentials.scopes |= pick([
  "system/Immunization.c",
  "system/Immunization.r",
  "system/Immunization.u",
  "system/Immunization.s",
  "air-admin/Immunization.u",
  "air-admin/Immunization.s"
])
|
del(.. | select(. == "air-test*"))
' immsot-ig-template-local/package/content/ImmSoTAPI.yaml > immsot-ig-template-local/package/content/ImmSoTAPI_marketplace.yaml
