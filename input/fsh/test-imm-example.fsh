
Instance: imm-example-1
InstanceOf: air-immunization
Usage: #example
Title: "Immunization Example 1"
Description: "A simple example of the immunization resource, to be used as a starting point in learning, testing, and building more complex examples. This has the absolute minimum amount of data."
* status = #completed
* vaccineCode = $CVX#03 "MMR"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"
* occurrenceDateTime = "2023-03-01T16:45:46+13:00"
* performer[practitioner].function = $AIRTerms#VC "Vaccinator"
* performer[practitioner].actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer[practitioner].actor.identifier.value = "90ZZLP"


Instance: imm-example-2
InstanceOf: air-immunization
Usage: #example
Title: "Immunization Example 2"
Description: "An example immunization resource containing the complete set of fields for recording an immunisation event in AIR."

* meta.extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-source-system"
* meta.extension[=].valueString = "SS123"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by"
* meta.extension[=].valueString = "111"
* meta.extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system"
* meta.extension[=].valueString = "SS345"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by"
* meta.extension[=].valueString = "222"
* meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/firstCreated"
* meta.extension[=].valueDateTime = "2023-08-21T02:18:30.303+00:00"
* meta.versionId = "2"
* meta.lastUpdated = "2023-08-31T02:18:32.217+00:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"

* status = #completed
* statusReason = $SCT#127785005

* vaccineCode = $CVX#03 "MMR"
* lotNumber = "1234567890"
* expirationDate = "2024-08-31"
// diluent extension
* extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension[=].extension[0].url = "diluentLotNumber"
* extension[=].extension[=].valueString = "33332222"
* extension[=].extension[+].url = "diluentExpiryDate"
* extension[=].extension[=].valueDate = "2026-01-01"

// mobile site extension
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-mobile-site"
* extension[=].url = "mobileSiteId"
* extension[=].valueString = "FZZ958-K_MOB0001"

* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"

* occurrenceDateTime = "2023-03-01T16:45:46+13:00"

// ageGiven extension
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"
* extension[=].extension[0].url = "years"
* extension[=].extension[=].valueInteger = 1
* extension[=].extension[+].url = "months"
* extension[=].extension[=].valueInteger = 2
* extension[=].extension[+].url = "days"
* extension[=].extension[=].valueInteger = 22
* extension[=].extension[+].url = "daysSinceBirth"
* extension[=].extension[=].valueInteger = 445
* extension[=].extension[+].url = "precision"
* extension[=].extension[=].valueString = "Day"

* performer[practitioner].function = $AIRTerms#VC "Vaccinator"
* performer[practitioner].actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer[practitioner].actor.identifier.value = "90ZZLP"

* location = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E)
* location.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* location.identifier.value = "FZZ835-E"


* site.coding.version = "1.0.0"
* site.coding = $SCT#368209003 "Right upper arm"
* route.coding.version = "1.0.0"
* route.coding = $SCT#54471007 "Buccal route"

* reasonCode.coding.version = "1.0.0"
* reasonCode.coding = $SCT#161651000210107 "Publicly funded vaccination given for 65 years of age or older"

* protocolApplied.doseNumberPositiveInt = 1

* contained[0] = imm-related-person-1
* contained[+] = imm-serology-report-1


Instance: imm-related-person-1
InstanceOf: RelatedPerson
Usage: #inline
Title: "Related Person Example 1"
Description: "An example related person for insertion into an immunization resource."
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-extension"
* patient = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ9994)
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZZ9994"
* relationship = $relationCode#01
* name.family = "Dill"
* name.given = "Jane Jess"
* telecom[0].system = #phone
* telecom[=].value = "041111111"
* telecom[=].use = #home
* telecom[+].system = #phone
* telecom[=].value = "091111111"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "jadill@moh.govt.nz"
* telecom[=].use = #home
* address.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* address.extension.valueString = "ccc"
* address.use = #home
* address.type = #physical
* address.line[0] = "456 Main St"
* address.line[+] = "nzland"
* address.city = "ddd"
* address.postalCode = "1111"

Instance: imm-serology-report-1
InstanceOf: Observation
Usage: #inline
Title: "Serology Report Example 1"
Description: "An example serology report for insertion into an immunization resource."
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report"
* code = $SCT#278969009
* interpretation = $serProt#IND
* status = #final