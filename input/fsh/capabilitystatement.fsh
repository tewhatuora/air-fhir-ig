Alias: $EventCapabilityMode = http://hl7.org/fhir/event-capability-mode

Instance: AIRCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition

// this capability statement has been aligned to the openapi spec document version 0.3.0

* url = "https://standards.digital.health.nz/fhir/air/CapabilityStatement/AIRCapabilityStatement"
* version = "0.3.0"
* name = "AIRCapabilityStatement"
* title = "AIR FHIR Server Capability Statement"
* status = #draft
* experimental = false
* date = "2023-02-14"
* publisher = "Health New Zealand | Te Whatu Ora"
* description = "The Aotearoa Immunisation Register (AIR) FHIR v4.0.1 API"
* kind = #instance
* implementation.description = "PROD - ImmSoT Service endpoint"
* implementation.url = "https://air.api.digital.health.nz/v2/fhir"
* fhirVersion = #4.0.1
* format = #json

* rest.mode = #server
* rest.security.cors = true
* rest.security.service = http://terminology.hl7.org/CodeSystem/restful-security-service#OAuth
* rest.security.extension.url = "http://fhir-registry.smarthealthit.org/StructureDefinition/oauth-uris"
* rest.security.extension.extension[0].url = "token"
* rest.security.extension.extension[=].valueUri = "https://auth.integration.covid19.health.nz/oauth2/token"
* rest.security.extension.extension[+].url = "authorize"
* rest.security.extension.extension[=].valueUri = "https://auth.integration.covid19.health.nz/oauth2/authorize"

// Immunization resource

* rest.resource[0].type = #Immunization
* rest.resource[=].profile = Canonical(AIRImmunization)
* rest.resource[=].interaction[0].code = #create
* rest.resource[=].interaction[0].documentation = "POST|[base]/Immunization/|The \"create\" operation is used to create a new immunisation event. This method performs  validation checks to ensure that the event is valid before it is created.  

        Returns either the created Immunization record or if there were any issues with the create, the  response will contain an OperationOutcome resource array. The OperationOutcome resource has an informational issue indicating that the create operation failed. The issue array of the OperationOutcome resource would contain additional issues with appropriate severity and code values.|system/Immunization.c"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].documentation = "GET|[base]/Immunization/[id]|The \"read\" operation is used to read an immunisation event. This method takes an immunisation event id and returns back the FHIR resource for the immunization event.|system/Immunization.r"
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[=].documentation = "PUT|[base]/Immunization/[id]| The \"update\" operation is used to update an existing immunisation event. This method checks if the immunisation event with the given ID exists, and if it does, it updates the event with the new details provided. The method also performs validation checks to ensure that the updated event is valid before it is saved.

        Returns either the the updated immunisation record or an OperationOutcome if there were any issues with the update.

        On success - returns the updated immunisation record. data quality issues will be identified and sent as part of the response in the meta section of the resource.

        On Fail - if there were any issues with the update, the response will contain an OperationOutcome resource array. The OperationOutcome resource has an informational issue indicating that the update operation failed. The issue array of the OperationOutcome resource would contain additional issues with appropriate severity and code values.|system/Immunization.u"

// * rest.resource[=].interaction[+].code = #delete
// * rest.resource[=].interaction[+].code = #vread
// * rest.resource[=].interaction[+].code = #search-type
// * rest.resource[=].interaction[=].documentation = "GET|[base]/Immunization/[id]| search for  an Immunisation record |system/Immunization.r"

* rest.resource[=].interaction[+].code = #history-instance
* rest.resource[=].interaction[=].documentation = "GET|[base]/Immunization/[id]_history|The _history interaction is used to return all the versions of an immunization event including the data quality. This method takes an immsot_id and returns back the FHIR bundle, which is a collection of immunization event resources where each resource in the bundle represents a version.|system/Immunization.r, air-admin/Immunization.r"

* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
* rest.resource[=].updateCreate = false
* rest.resource[=].conditionalCreate = false
* rest.resource[=].conditionalRead = #not-supported
* rest.resource[=].conditionalUpdate = false
* rest.resource[=].conditionalDelete = #not-supported

// Search

* rest.resource[=].searchInclude[0] = "*"
* rest.resource[=].searchInclude[+] = "Immunization.patient"
* rest.resource[=].searchInclude[+] = "Immunization.performer.actor"
* rest.resource[=].searchInclude[+] = "Immunization.location"

* rest.resource[=].searchParam[0].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "NHI number of the patient"

* rest.resource[=].searchParam[+].name = "protocolApplied.targetDisease"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/target-disease"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Vaccine-preventable disease being targeted by an immunisation."

* rest.resource[=].searchParam[+].name = "data-quality"
* rest.resource[=].searchParam[=].definition = "https://standards.digital.health.nz/fhir/air/StructureDefinition/immunization-data-quality"
* rest.resource[=].searchParam[=].type = #special
* rest.resource[=].searchParam[=].documentation = "Query search for immunisation events with data quality issues. Restricted to admin users."

// use an extension to say that the patient search parameter is required and you can optionally include a target disease parameter
* rest.resource[=].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[0].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"

* rest.resource[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[=].extension[0].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "optional"
* rest.resource[=].extension[=].extension[=].valueString = "protocolApplied.targetDisease"



// Immunization Operations

* rest.resource[=].operation[+].name = "upsert"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/StructureDefinition/immunization-upsert"
* rest.resource[=].operation[=].documentation = "Update or add an immunisation event"

* rest.resource[=].operation[+].name = "bulk-update"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/StructureDefinition/immunization-bulk-update"
* rest.resource[=].operation[=].documentation = "Update or add immunisation events in bulk."

// Patient resource

* rest.resource[+].type = #Patient
* rest.resource[=].profile = Canonical(AIRPatient)
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].documentation = "GET|[base]/Patient/]id]|Read the current state of an ImmSOT Consumer. Consumer state held in ImmSOT is returned as a FHIR AIR Patient. When an optional header \"origin-nhi-version\" is included which contains the NHI version, the API will check if it is the same NHI version we have stored in ImmSoT database for the Consumer. If it is the same, we return the current data we have in ImmSoT database. If it is not the same, we do a Consumer sync with NHI and update the data we have in ImmSoT database and then return this updated data in the response.|system/Patient.r, air-test/Patient.r"

// Patient Operations

* rest.resource[=].operation[+].name = "update-state"
* rest.resource[=].operation[=].definition = "https://standards.digital.health.nz/fhir/air/StructureDefinition/update-patient-state"
* rest.resource[=].operation[=].documentation = "Update the current state of an ImmSOT Consumer. Updates the Consumer state and/or sub status only. Input is the Consumer version previously read (used for operation optimistic locking) and the desired Consumer state. At least one of state and subStatus must be specified. If state or subStatus is not specified, then these attributes will not be updated. Setting subStatus to null will clear the current sub status. A 412 Preconditioned Failed will be returned if the version received in the payload does not match the server version."

// system interactions

* rest.interaction.code = #transaction
// * rest.interaction.code = #search-system

* rest.operation[+].name = "process-message"
* rest.operation[=].definition = "http://hl7.org/fhir/OperationDefinition/MessageHeader-process-message"
* rest.operation[=].documentation = "POST| [base]/$process-message| http://hl7.org/fhir/OperationDefinition/MessageHeader-process-message| system/MessageHeader.u"

// messaging

* messaging.supportedMessage[0].mode = $EventCapabilityMode#sender
* messaging.supportedMessage[=].definition = "http://hl7.org.nz/fhir/MessageDefinition/UpdateImmunisationRequestMessageDefinition"
* messaging.supportedMessage[+].mode = $EventCapabilityMode#sender
* messaging.supportedMessage[=].definition = "http://hl7.org.nz/fhir/MessageDefinition/UpdateImmunisationResponsetMessageDefinition"
