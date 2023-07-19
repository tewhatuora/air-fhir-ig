Alias: $ethnic-group-level-4-code = https://standards.digital.health.nz/ns/ethnic-group-level-4-code

Instance: enrolment-nomination-request-message-2
InstanceOf: Bundle
Description: "Example enrolment nomination request message"
Usage: #example

* id = "update-immunistation-request1"
* type = #message
* timestamp = 2023-05-14T11:15:33+10:00
* entry[0].resource.resourceType = "MessageHeader"
* entry[0].resource.eventCoding.system = "https://standards.digital.health.nz/ns/air-event-type"
* entry[0].resource.eventCoding.code = #IMMUNISATION_UPDATE
* entry[0].resource.focus[0] = Reference(Patient/ZKC4633)
* entry[0].resource.focus[1] = Reference(Immunisation/IMM-ABCDE)


//AIR HPI appid 
* entry[0].resource.source.software =  "HSAP11111"
 //EDI account of sending facility
* entry[0].resource.source.endpoint =  "Mohedi"
//Moh facility id
* entry[0].resource.source.name =  "Mohfacid"

// appid of HealthLink AIR Broker
//EDI account of receiving facility 
* entry[0].resource.destination.endpoint = "edi123"
//The receiving facility’s Health Facility Code 
* entry[0].resource.destination.name = "pmsfacid"


//generated guuid
* entry[0].fullUrl = "https://air.api-dev.digital.health.nz/fhir/R48182fbd6-c7a5-43a4-bbfc-b1443e493ca39"

* entry[1].resource.resourceType = "Patient"
* entry[1].resource.id = "ZKC4633"
* entry[1].resource.identifier.use = #official
* entry[1].resource.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* entry[1].resource.identifier.value = "ZKC4633"
* entry[1].resource.name[0].id = "10"
* entry[1].resource.name[=].family = "Aufderhar"
* entry[1].resource.name[=].given = "Baby of Jane"
* entry[1].resource.gender = #female
* entry[1].resource.birthDate = "2023-05-25"
* entry[1].resource.extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-ethnicity"
* entry[1].resource.extension[=].valueCodeableConcept.coding.version = "2.0"
* entry[1].resource.extension[=].valueCodeableConcept.coding = $ethnic-group-level-4-code#21111 "Māori"
* entry[1].resource.address.line = "23 Thule St"
* entry[1].resource.address.city = "Waipu"
* entry[1].resource.address.extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* entry[1].resource.address.extension[0].valueString = "Waipu river"
* entry[1].fullUrl = "Patient/ZKC4633"


* entry[2].resource.resourceType = "Immunization" 
* entry[2].resource.id = "IMM-ABCDE"
// Immunisation record #2


// data about the actual resource here
* entry[=].resource[0].resourceType = "Immunization"
* entry[=].resource[=].id = "b868b73d-ef57-4480-85de-ac012a1ee1a9"
* entry[=].resource[=].meta.versionId = "null"
* entry[=].resource[=].meta.lastUpdated = "2023-03-01T16:45:46.781+13:00"
* entry[=].resource[=].meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/orch-immunization"

// diluent extension
* entry[=].resource[=].extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* entry[=].resource[=].extension[=].extension[0].url = "diluentLotNumber"
* entry[=].resource[=].extension[=].extension[=].valueString = "33332222"
* entry[=].resource[=].extension[=].extension[+].url = "diluentExpiryDate"
* entry[=].resource[=].extension[=].extension[=].valueDate = "2026-01-01"

* entry[=].resource[=].status = #completed
* entry[=].resource[=].statusReason = $SCT#127785005 "Active or passive immunisation"
* entry[=].resource[=].vaccineCode = $CVX#03 "MMR"
// AIR only wants one identifier, so this patient reference throws an error
// do we need two profiles after all?
* entry[=].resource[=].patient = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZAA0792)
* entry[=].resource[=].occurrenceDateTime = "2016-09-01T16:45:46+13:00"

// ageGiven extension
* entry[=].resource[=].extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"
* entry[=].resource[=].extension[=].extension[0].url = "years"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 0
* entry[=].resource[=].extension[=].extension[+].url = "months"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 11
* entry[=].resource[=].extension[=].extension[+].url = "days"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 20
* entry[=].resource[=].extension[=].extension[+].url = "daysSinceBirth"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 355
* entry[=].resource[=].extension[=].extension[+].url = "precision"
* entry[=].resource[=].extension[=].extension[=].valueString = "Day"

* entry[=].resource[=].location = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ958-K)

* entry[=].resource[=].site = $SCT#16217701000119102 "Structure of left deltoid muscle"
* entry[=].resource[=].route = $SCT#78421000 "Intramuscular route"

* entry[=].resource[=].performer.function = $AIRTerms#VC
* entry[=].resource[=].performer.actor = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/90ZZLP)
* entry[=].resource[=].reasonCode = $AIRTerms#12M "12 months"
* entry[=].resource[=].protocolApplied.doseNumberPositiveInt = 1

