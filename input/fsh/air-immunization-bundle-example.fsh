Instance: AIRBundleExample
InstanceOf: Bundle
Title: "AIR Immunisation Bundle Example"
Description: "This is an example of a how multiple immunisation records will be returned from the AIR service. One of the example immunisations includes the data quality information which is only available to certain administrative users."
Usage: #example
* type = #message
* total = 2
* link.relation = "self"
* link.url = "http://example.com/fhir/Immunization?patient=1234"
* entry[0].resource = ImmSoTImmunizationExampleForBundle-1
* entry[=].search.mode = #match
* entry[+].resource = ImmSoTImmunizationExampleForBundleWithDQ-2
* entry[=].search.mode = #match

Instance: ImmSoTImmunizationExampleForBundle-1
InstanceOf: Immunization
Usage: #example
Title: "AIR Immunization Example"
Description: "An example of an AIR v2 immunization resource, including contained patient and location resources. "

* id = "imm-example-for-bundle-1"
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
* patient.identifier.value = "ZZZ7545"

* occurrenceDateTime = "2023-03-01T16:45:46+13:00"

* location = Reference(l1-bundle)

* contained[0].resourceType = "Location"
* contained[0].id = "l1-bundle"
* contained[0].identifier.system = "http://hl7.org.nz/fhir/StructureDefinition/esam-id"
* contained[0].identifier.value = "123456"
* contained[0].managingOrganization = Reference(mo1-bundle)

* contained[1].resourceType = "Organization"
* contained[1].id = "mo1-bundle"
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

Instance: ImmSoTImmunizationExampleForBundleWithDQ-2
InstanceOf: Immunization
Usage: #example
Title: "AIR Immunization Example with Data Quality Extension"
Description: "An example of an AIR v2 immunization resource, including contained patient and location resources. This example also includes extended data quality information that is only visible to selected admin users. In this example, the immunisation record has an invalid vaccine code."

* id = "imm-example-for-bundle-with-dq-2"
* meta.versionId = "null"
* meta.lastUpdated = "2023-03-01T16:45:46.781+13:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"

* meta.extension[air-data-quality-assessment][0].extension[dqStatus][0].valueString = "Accepted"
* meta.extension[air-data-quality-assessment][0].extension[dqScore][0].valueInteger = 25
* meta.extension[air-data-quality-assessment][0].extension[dqLastUpdated][0].valueDateTime = "2023-04-03"
* meta.extension[air-data-quality-assessment][0].extension[DQViolations][0].extension[DQViolation][0].extension[violationCode][0].valueString = "170"
* meta.extension[air-data-quality-assessment][0].extension[DQViolations][0].extension[DQViolation][0].extension[violationType][0].valueString = "dataQuality"
* meta.extension[air-data-quality-assessment][0].extension[DQViolations][0].extension[DQViolation][0].extension[violationMessage][0].valueString = "The vaccine code is unrecognised. A vaccine code should be part of the air-vaccine-product-code value set."
* meta.extension[air-data-quality-assessment][0].extension[DQViolations][0].extension[DQViolation][0].extension[violationElement][0].valueString = "occurrence.vaccine.code"
* meta.extension[air-data-quality-assessment][0].extension[DQViolations][0].extension[DQViolation][0].extension[violationWeighting][0].valueInteger = 1

* extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"

* status = #completed

* statusReason.coding = http://snomed.info/sct#127785005

* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#333
* vaccineCode.text = "Measles, Mumps, Rubella"

* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZZ7545"

* occurrenceDateTime = "2023-03-01T16:45:46+13:00"

* location = Reference(l-dq-bundle-1)

* contained[0].resourceType = "Location"
* contained[0].id = "l-dq-bundle-1"
* contained[0].identifier.system = "http://hl7.org.nz/fhir/StructureDefinition/esam-id"
* contained[0].identifier.value = "123456"
* contained[0].managingOrganization = Reference(mo-dq-1)

* contained[1].resourceType = "Organization"
* contained[1].id = "mo-dq-bundle-1"
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
