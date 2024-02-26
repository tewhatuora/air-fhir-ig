Alias: $EventCapabilityMode = http://hl7.org/fhir/event-capability-mode

Instance: AIRCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition

* url = "https://standards.digital.health.nz/fhir/air/CapabilityStatement/AIRCapabilityStatement"
* version = "0.3.0"
* name = "AIRCapabilityStatement"
* title = "AIR FHIR Server Capability Statement"
* status = #draft
* experimental = false
* date = "2023-02-14"
* publisher = "Te Whatu Ora"
* description = "The Aotearoa Immunisation Register (AIR) FHIR v4.0.1 API"
* kind = #instance
* implementation.description = "The Aotearoa Immunisation Register (AIR) FHIR v4.0.1 API"
* implementation.url = "https://air.digital.health.nz/v2/fhir/R4"
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
* rest.resource[0].type = #Immunization
* rest.resource[=].profile = Canonical(AIRImmunization)
* rest.resource[=].interaction[0].code = #create
* rest.resource[=].interaction[0].documentation = "POST,[base]/Immunization/, create a new Immunisation record ,system/Immunization.c"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].documentation = "GET,[base]/Immunization/[id], get an Immunisation record by id ,system/Immunization.r"
* rest.resource[=].interaction[+].code = #update
* rest.resource[=].interaction[=].documentation = "POST,[base]/Immunization/[id], update an Immunisation record ,system/Immunization.u"
// * rest.resource[=].interaction[+].code = #delete
// * rest.resource[=].interaction[+].code = #vread
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].interaction[=].documentation = "GET,[base]/Immunization/[id], search for  an Immunisation record ,system/Immunization.r"
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

* rest.resource[=].searchParam[0].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "NHI number of the patient"

* rest.resource[=].searchParam[0].name = "protocolApplied.targetDisease"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/target-disease"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Vaccine-preventable disease being targeted by an immunisation."

* rest.interaction.code = #transaction
* rest.interaction.code = #search-system
* messaging.supportedMessage[0].mode = $EventCapabilityMode#sender
* messaging.supportedMessage[0].definition = "http://hl7.org.nz/fhir/MessageDefinition/UpdateImmunisationRequestMessageDefinition"
* messaging.supportedMessage[1].mode = $EventCapabilityMode#sender
* messaging.supportedMessage[1].definition = "http://hl7.org.nz/fhir/MessageDefinition/UpdateImmunisationResponsetMessageDefinition"

// Operations

* rest.operation[+].name = "process-message"
* rest.operation[=].definition = "http://hl7.org/fhir/OperationDefinition/MessageHeader-process-message"
* rest.operation[=].documentation = "POST, [base]/$process-message, http://hl7.org/fhir/OperationDefinition/MessageHeader-process-message, system/MessageHeader.u"

* rest.resource.operation[+].name = "upsert"
* rest.resource.operation[=].definition = "https://standards.digital.health.nz/fhir/air/StructureDefinition/immunization-upsert"
* rest.resource.operation[=].documentation = "POST, [base]/Immunization/$upsert, Update or add an immunisation event, system/Immunization.cu"

* rest.resource.operation[+].name = "bulk-update"
* rest.resource.operation[=].definition = "https://standards.digital.health.nz/fhir/air/StructureDefinition/immunization-bulk-update"
* rest.resource.operation[=].documentation = "POST, [base]/Immunization/$bulk-update, Update or add immunisation events in bulk, system/Patient.cu"
