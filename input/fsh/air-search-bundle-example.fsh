Instance: AIRBundleOrchestrationExample
InstanceOf: Bundle
Title: "AIR Orchestration Service Immunisation Bundle Example"
Description: "This is an example of a how multiple immunisation records will be returned from ImmSoT, inclusive of and following the expansion functions performed by the Orchestration Service."
Usage: #example

// trying out the syntax for the entries as done in 
// https://github.com/HL7NZ/nes-ig/blob/master/input/fsh/examples/enrolment-nomination-request-message-1.fsh

* type = #searchset
* link.relation = "self"
* link.url = "https://standards.digital.health.nz/fhir/air/Immunization?_include=*&patient=ZAA0792"

// Immunisation record #1

// data about the bundle entry here
* entry[+].search.mode = #match
* entry[=].fullUrl = "Immunization/imm-example-for-bundle-orch-1"

// data about the actual resource here
* entry[=].resource[0].resourceType = "Immunization"
* entry[=].resource[=].id = "imm-example-for-bundle-orch-1"
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
* entry[=].resource[=].occurrenceDateTime = "2023-03-01T16:45:46+13:00"

// ageGiven extension
* entry[=].resource[=].extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"
* entry[=].resource[=].extension[=].extension[0].url = "years"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 7
* entry[=].resource[=].extension[=].extension[+].url = "months"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 5
* entry[=].resource[=].extension[=].extension[+].url = "days"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 20
* entry[=].resource[=].extension[=].extension[+].url = "daysSinceBirth"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 2730

// this is an ESAM location type
* entry[=].resource[=].location = Reference(http://rest.moh.health.nz/services/eSAMMoHAddressREST_v01Location/1112139)

* entry[=].resource[=].site = $SCT#16217701000119102 "Structure of left deltoid muscle"
* entry[=].resource[=].route = $SCT#78421000 "Intramuscular route"

* entry[=].resource[=].performer.function = $AIRTerms#VC "Vaccinator"
* entry[=].resource[=].performer.actor = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/90ZZLP)

// Because this record has an ESAM location, we need a performer organisation as well
* entry[=].resource[=].performer.function = $AIRTerms#MO "Managing Organisation"
* entry[=].resource[=].performer.actor = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Organization/GZZ956-B)

* entry[=].resource[=].reasonCode = $SCT#161651000210107 "Publicly funded vaccination given for 65 years of age or older"
* entry[=].resource[=].protocolApplied.doseNumberPositiveInt = 1

// Immunisation record #2

// data about the bundle entry here
* entry[+].search.mode = #match
* entry[=].fullUrl = "Immunization/imm-example-for-bundle-orch-2"

// data about the actual resource here
* entry[=].resource[0].resourceType = "Immunization"
* entry[=].resource[=].id = "imm-example-for-bundle-orch-2"
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
* entry[=].resource[=].occurrenceDateTime = "2023-03-01T16:45:46+13:00"

// ageGiven extension
* entry[=].resource[=].extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"
* entry[=].resource[=].extension[=].extension[0].url = "years"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 9
* entry[=].resource[=].extension[=].extension[+].url = "months"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 9
* entry[=].resource[=].extension[=].extension[+].url = "days"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 1
* entry[=].resource[=].extension[=].extension[+].url = "daysSinceBirth"
* entry[=].resource[=].extension[=].extension[=].valueInteger = 2487

* entry[=].resource[=].location = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ958-K)

* entry[=].resource[=].site = $SCT#16217701000119102 "Structure of left deltoid muscle"
* entry[=].resource[=].route = $SCT#78421000 "Intramuscular route"

* entry[=].resource[=].performer.function = $AIRTerms#VC
* entry[=].resource[=].performer.actor = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/90ZZLP)
* entry[=].resource[=].reasonCode = $SCT#161651000210107 "Publicly funded vaccination given for 65 years of age or older"
* entry[=].resource[=].protocolApplied.doseNumberPositiveInt = 1


// Patient NHI Patient Example

// data about the bundle entry here
* entry[+].search.mode = #include
* entry[=].fullUrl = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZAA0792"

// data about the actual resource here
* entry[=].resource[0].resourceType = "Patient"
* entry[=].resource[=].id = "ZAA0792" 
* entry[=].resource[=].meta.versionId = "3368251"
* entry[=].resource[=].meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NhiPatient"
* entry[=].resource[=].extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-ethnicity"
* entry[=].resource[=].extension[=].valueCodeableConcept.coding.version = "2.0"
* entry[=].resource[=].extension[=].valueCodeableConcept.coding = $ethnic-group-level-4-code#11111 "New Zealand European"
* entry[=].resource[=].extension[=].valueCodeableConcept.text = "New Zealand European"
* entry[=].resource[=].extension[+].extension.url = "status"
* entry[=].resource[=].extension[=].extension.valueCodeableConcept.coding.version = "1.0.0"
* entry[=].resource[=].extension[=].extension.valueCodeableConcept.coding = $nz-citizenship-status-code#unknown "The citizenship status is unknown"
* entry[=].resource[=].extension[=].extension.valueCodeableConcept.text = "The citizenship status is unknown"
* entry[=].resource[=].extension[=].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-citizenship"
* entry[=].resource[=].extension[+].extension[0].url = "source"
* entry[=].resource[=].extension[=].extension[=].valueCodeableConcept.coding.version = "1.0.0"
* entry[=].resource[=].extension[=].extension[=].valueCodeableConcept.coding = $information-source-code#HL7 "HL7 applied"
* entry[=].resource[=].extension[=].extension[=].valueCodeableConcept.text = "HL7 applied"
* entry[=].resource[=].extension[=].extension[+].url = "status"
* entry[=].resource[=].extension[=].extension[=].valueCodeableConcept.coding.version = "1.0.0"
* entry[=].resource[=].extension[=].extension[=].valueCodeableConcept.coding = $nz-residency-code#yes "Permanent Resident"
* entry[=].resource[=].extension[=].extension[=].valueCodeableConcept.text = "Permanent Resident"
* entry[=].resource[=].extension[=].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-residency"
* entry[=].resource[=].identifier[0].use = #official
* entry[=].resource[=].identifier[=].system = "https://standards.digital.health.nz/ns/nhi-id"
* entry[=].resource[=].identifier[=].value = "ZAA0792"
* entry[=].resource[=].identifier[=].assigner = Reference(Organization/G00001-G)
* entry[=].resource[=].identifier[+].use = #old
* entry[=].resource[=].identifier[=].system = "https://standards.digital.health.nz/ns/nhi-id"
* entry[=].resource[=].identifier[=].value = "ZAA0806"
* entry[=].resource[=].identifier[=].assigner = Reference(Organization/G00001-G)
* entry[=].resource[=].name.id = "5"
* entry[=].resource[=].name.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-preferred"
* entry[=].resource[=].name.extension.valueBoolean = true
* entry[=].resource[=].name.family = "NEWMUM"
* entry[=].resource[=].name.given = "BABY OF TESTING"
* entry[=].resource[=].gender = #female
* entry[=].resource[=].birthDate = "2015-09-09"
* entry[=].resource[=].birthDate.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/information-source"
* entry[=].resource[=].birthDate.extension.valueCodeableConcept.coding.version = "1.0.0"
* entry[=].resource[=].birthDate.extension.valueCodeableConcept.coding = $information-source-code#HL7 "HL7 applied"
* entry[=].resource[=].birthDate.extension.valueCodeableConcept.text = "HL7 applied"
* entry[=].resource[=].address[0].id = "17"
* entry[=].resource[=].address[=].extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/not-validated-address-reason"
* entry[=].resource[=].address[=].extension[=].valueCodeableConcept.coding.version = "1.1"
* entry[=].resource[=].address[=].extension[=].valueCodeableConcept.coding = $address-not-validated-reason-code#OSEA "Overseas Address"
* entry[=].resource[=].address[=].extension[=].valueCodeableConcept.text = "Overseas Address"
* entry[=].resource[=].address[=].extension[+].url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* entry[=].resource[=].address[=].extension[=].valueString = "Moutsamoudou"
* entry[=].resource[=].address[=].use = #home
* entry[=].resource[=].address[=].type = #physical
* entry[=].resource[=].address[=].line = "Rue Mtsangani"
* entry[=].resource[=].address[=].city = "Bandrele "
* entry[=].resource[=].address[=].postalCode = "0606"
* entry[=].resource[=].address[+].id = "18"
* entry[=].resource[=].address[=].extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-address-id"
* entry[=].resource[=].address[=].extension[=].valueString = "3571798"
* entry[=].resource[=].address[=].extension[+].url = "http://hl7.org.nz/fhir/StructureDefinition/domicile-code"
* entry[=].resource[=].address[=].extension[=].valueCodeableConcept = $domicile-code#0504 "Auckland Harbourside"
* entry[=].resource[=].address[=].extension[=].valueCodeableConcept.text = "Auckland Harbourside"
* entry[=].resource[=].address[=].extension[+].url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* entry[=].resource[=].address[=].extension[=].valueString = "Auckland Central"
* entry[=].resource[=].address[=].use = #home
* entry[=].resource[=].address[=].type = #postal
* entry[=].resource[=].address[=].line = "147 Quay Street"
* entry[=].resource[=].address[=].city = "Auckland"
* entry[=].resource[=].address[=].postalCode = "1010"
* entry[=].resource[=].address[=].country = "NZ"


// Location ESAM Location

// data about the bundle entry here
* entry[+].search.mode = #include
* entry[=].fullUrl = "Location/1112139"

// data about the actual resource here

* entry[=].resource[0].resourceType = "Location"
* entry[=].resource[=].id = "1112139"
* entry[=].resource[=].meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-location"
* entry[=].resource[=].identifier[0].use = #official
* entry[=].resource[=].identifier[=].system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* entry[=].resource[=].identifier[=].value = "1112139"
* entry[=].resource[=].managingOrganization = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Organization/GZZ956-B)


// Practitioner HPI Practitioner

// data about the bundle entry here
* entry[+].search.mode = #include
* entry[=].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/90ZZLP"

// data about the actual resource here

* entry[=].resource[0].resourceType = "Practitioner"
* entry[=].resource[0].id = "90ZZLP"
* entry[=].resource[0].meta.versionId = "9971"
* entry[=].resource[0].meta.lastUpdated = "2022-04-07T09:12:26.000+12:00"
* entry[=].resource[0].meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/HPIPractitioner"
* entry[=].resource[0].meta.security[0] = $v3-ObservationValue#REDACTED
* entry[=].resource[0].meta.security[+] = $v3-Confidentiality#R
* entry[=].resource[0].identifier.use = #official
* entry[=].resource[0].identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* entry[=].resource[0].identifier.value = "90ZZLP"
* entry[=].resource[=].identifier[=].assigner = Reference(Organization/G00001-G)


// Location HPI Location

// data about the bundle entry here
* entry[+].search.mode = #include
* entry[=].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ958-K"

// data about the actual resource here

* entry[=].resource[0].resourceType = "Location"
* entry[=].resource[=].id = "FZZ958-K"
* entry[=].resource[=].meta.versionId = "10803"
* entry[=].resource[=].meta.lastUpdated = "2022-11-09T12:00:14.000+13:00"
* entry[=].resource[=].meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/HPILocation"
* entry[=].resource[=].extension.url = "http://hl7.org.nz/fhir/StructureDefinition/established"
* entry[=].resource[=].extension.valuePeriod.start = "1980-12-12"
* entry[=].resource[=].identifier[0].use = #official
* entry[=].resource[=].identifier[=].system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* entry[=].resource[=].identifier[=].value = "FZZ958-K"
* entry[=].resource[=].identifier[=].assigner = Reference(Organization/G00001-G)
* entry[=].resource[=].identifier[+].use = #official
* entry[=].resource[=].identifier[=].system = "https://standards.digital.health.nz/ns/nzhis-facility-id"
* entry[=].resource[=].identifier[=].value = "9987"
* entry[=].resource[=].identifier[=].assigner = Reference(Organization/G00001-G)
* entry[=].resource[=].status = #active
* entry[=].resource[=].name = "Medical Centre Flat-Unit"
* entry[=].resource[=].alias = "Medical Centre Flat-Unit"
* entry[=].resource[=].alias.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/alias-type"
* entry[=].resource[=].alias.extension.valueCodeableConcept.coding.version = "1.0.0"
* entry[=].resource[=].alias.extension.valueCodeableConcept.coding = $alias-type-code#current "Current unverified or unofficial name"
* entry[=].resource[=].alias.extension.valueCodeableConcept.text = "Current unverified or unofficial name"
* entry[=].resource[=].type.coding.version = "1.0"
* entry[=].resource[=].type.coding = $location-type-code#gpenrol "Enrolling GP Practice"
* entry[=].resource[=].telecom[0].system = #phone
* entry[=].resource[=].telecom[=].value = "021 555558"
* entry[=].resource[=].telecom[=].use = #temp
* entry[=].resource[=].telecom[=].rank = 1
* entry[=].resource[=].telecom[=].period.start = "1980-12-12"
* entry[=].resource[=].telecom[+].system = #phone
* entry[=].resource[=].telecom[=].value = "021 464646"
* entry[=].resource[=].telecom[=].use = #work
* entry[=].resource[=].telecom[=].rank = 1
* entry[=].resource[=].telecom[=].period.start = "1980-12-12"
* entry[=].resource[=].address.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* entry[=].resource[=].address.extension.valueString = "Wellington 6011"
* entry[=].resource[=].address.use = #work
* entry[=].resource[=].address.type = #physical
* entry[=].resource[=].address.text = "2C/123 Molesworth Street, Thorndon, Wellington 6011"
* entry[=].resource[=].address.line[0] = "Thorndon"
* entry[=].resource[=].address.line[+] = "2C/123 Molesworth Street"
* entry[=].resource[=].managingOrganization = Reference(Organization/GZZ956-B) "Flat-Unit Address Org"


// Organization HPI Organization

// data about the bundle entry here
* entry[+].search.mode = #include
* entry[=].fullUrl = "https://api.hip.digital.health.nz/fhir/hpi/v1/Organization/GZZ956-B"

// data about the actual resource here

* entry[=].resource[0].resourceType = "Organization"
* entry[=].resource[=].id = "GZZ956-B"
* entry[=].resource[=].meta.versionId = "8910"
* entry[=].resource[=].meta.lastUpdated = "2022-04-05T15:04:16.000+12:00"
* entry[=].resource[=].meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/HPIOrganization"
* entry[=].resource[=].extension.url = "http://hl7.org.nz/fhir/StructureDefinition/established"
* entry[=].resource[=].extension.valuePeriod.start = "2018-05-20"
* entry[=].resource[=].identifier[0].use = #official
* entry[=].resource[=].identifier[=].system = "https://standards.digital.health.nz/ns/hpi-organisation-id"
* entry[=].resource[=].identifier[=].value = "GZZ956-B"
* entry[=].resource[=].identifier[=].assigner = Reference(Organization/G00001-G)
* entry[=].resource[=].identifier[+].use = #official
* entry[=].resource[=].identifier[=].system = "https://standards.digital.health.nz/ns/hpi-nzbn"
* entry[=].resource[=].identifier[=].value = "9999999999041"
* entry[=].resource[=].identifier[=].assigner = Reference(Organization/MBIE)
* entry[=].resource[=].active = true
* entry[=].resource[=].type.coding.version = "1.1"
* entry[=].resource[=].type.coding = $organisation-type-code#999 "Other"
* entry[=].resource[=].name = "Flat-Unit Address Org"
* entry[=].resource[=].alias = "Flat-Unit Address Org"
* entry[=].resource[=].alias.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/alias-type"
* entry[=].resource[=].alias.extension.valueCodeableConcept.coding.version = "1.0.0"
* entry[=].resource[=].alias.extension.valueCodeableConcept.coding = $alias-type-code#legal "Legal"
* entry[=].resource[=].alias.extension.valueCodeableConcept.text = "Legal"
* entry[=].resource[=].telecom.system = #phone
* entry[=].resource[=].telecom.value = "021 101010"
* entry[=].resource[=].telecom.use = #work
* entry[=].resource[=].telecom.rank = 1
* entry[=].resource[=].telecom.period.start = "1970-01-01"
