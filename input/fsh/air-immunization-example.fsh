Instance: ImmSoTImmunizationExample
InstanceOf: Immunization
Usage: #example
Title: "AIR Immunization Example"
Description: "An example of an AIR v2 immunization resource, including contained patient and location resources. "

* id = "imm-example-1"
* meta.versionId = "null"
* meta.lastUpdated = "2023-03-01T16:45:46.781+13:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"

* extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"

* status = #completed

* statusReason.coding = http://snomed.info/sct#127785005

* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#3
* vaccineCode.text = "Measles, Mumps, Rubella"

* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"

* occurrenceDateTime = "2023-03-01T16:45:46+13:00"

* location = Reference(l1)

* contained[0].resourceType = "Location"
* contained[0].id = "l1"
* contained[0].identifier.system = "http://hl7.org.nz/fhir/StructureDefinition/esam-id"
* contained[0].identifier.value = "123456"

* contained[0].managingOrganization = Reference(mo1)

* contained[1].resourceType = "Organization"
* contained[1].id = "mo1"
* contained[1].identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* contained[1].identifier.value = "FZZ835-E"

* site.coding = http://snomed.info/sct#16217701000119102

* route.coding = http://snomed.info/sct#54471007

* performer.function = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer.actor.identifier.value = "90ZZLP"
* performer.actor.identifier.assigner = Reference("https://standards.digital.health.nz/ns/hpi-organisation-id/G00001-G")

* reasonCode = http://snomed.info/sct#161651000210107

* protocolApplied.doseNumberPositiveInt = 1
