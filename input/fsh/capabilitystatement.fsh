Instance: AIRCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition

* url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/AIRCapabilityStatement"
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
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[+].code = #update
// * rest.resource[=].interaction[+].code = #delete
// * rest.resource[=].interaction[+].code = #vread
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].versioning = #versioned
* rest.resource[=].readHistory = false
* rest.resource[=].updateCreate = false
* rest.resource[=].conditionalCreate = false
* rest.resource[=].conditionalRead = #not-supported
* rest.resource[=].conditionalUpdate = false
* rest.resource[=].conditionalDelete = #not-supported
// * rest.resource[=].searchInclude[0] = "*"
// * rest.resource[=].searchInclude[+] = "Immunization.identifier"
* rest.resource[=].searchParam[0].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "NHI number of the patient"
// * rest.resource[=].searchParam[+].name = "status"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/CarePlan-status"
// * rest.resource[=].searchParam[=].type = #token
// * rest.resource[=].searchParam[=].documentation = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
// * rest.resource[=].searchParam[+].name = "subject"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/CarePlan-subject"
// * rest.resource[=].searchParam[=].type = #reference
// * rest.resource[=].searchParam[=].documentation = "Who the care plan is for"
// * rest.resource[=].searchParam[+].name = "_id"
// * rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
// * rest.resource[=].searchParam[=].type = #token
// * rest.resource[=].searchParam[=].documentation = "Logical id of this artifact"
// * rest.resource[=].searchInclude[0] = "*"
// * rest.resource[=].searchRevInclude[0] = "*"
* rest.interaction.code = #transaction
* rest.interaction.code = #search-system
