Instance: AIRBundleExample
InstanceOf: Bundle
Title: "AIR Immunisation Bundle Example"
Description: "This is an example of a how multiple immunisation records will be returned from the AIR service. One of the example immunisations includes the data quality information which is only available to certain administrative users."
Usage: #example
* type = #message
* total = 2
* link.relation = "self"
* link.url = "http://example.com/fhir/Immunization?patient=1234"
* entry[0].resource = Inline-Instance-for-AIRBundleExample-1
* entry[=].search.mode = #match
* entry[+].resource = Inline-Instance-for-AIRBundleExample-2
* entry[=].search.mode = #match

Instance: Inline-Instance-for-AIRBundleExample-1
InstanceOf: Immunization
Usage: #inline
* meta.versionId = "2"
* meta.lastUpdated = "2023-03-14T04:12:28.983+00:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* meta.extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment"
* meta.extension.extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-score"
* meta.extension.extension.extension[0].url = "dqScore"
* meta.extension.extension.extension[=].valueInteger = 90
* meta.extension.extension.extension[+].url = "dqLastUpdated"
* meta.extension.extension.extension[=].valueDateTime = "2023-03-14T04:12:28.983+00:00"
* meta.extension.extension.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-dq-violations"
* meta.extension.extension.extension[=].extension[0].url = "DataQualityViolation"
* meta.extension.extension.extension[=].extension[=].extension[0].url = "violationCode"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "200"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationType"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "dataQuality"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationMessage"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "The vaccine code is unrecognised. A vaccine code should be part of the air-vaccine-product-code value set."
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationElement"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "occurrence.vaccine.code"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationWeight"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "2"
* meta.extension.extension.extension[=].extension[+].url = "DataQualityViolation"
* meta.extension.extension.extension[=].extension[=].extension[0].url = "violationCode"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "300"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationType"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "dataQuality"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationMessage"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "An immunisation event should have a vaccine batch expiry date, and the vaccine batch expiry date should not be before the immunisation event date."
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationElement"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "lotNumber"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationWeight"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "1"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZZ7545"
* occurrenceDateTime = "2023-01-26"
* vaccineCode.text = "Priorix"
* vaccineCode.coding = $CVX#03
* protocolApplied.doseNumberPositiveInt = 1
* lotNumber = "555123"
* expirationDate = "2024-01-31"
* extension.url = "https://standards.digital.health.nz/fhir/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"
* route.coding = $SCT#78421000
* site.coding = $SCT#16217701000119102
* location = Reference(l1)
* contained.resourceType = "Location"
* contained.id = "l1"
* contained.identifier.system = "http://hl7.org.nz/fhir/StructureDefinition/esam-id"
* contained.identifier.value = "123456"
* contained.managingOrganization.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* contained.managingOrganization.identifier.value = "FZZ835-E"
* status = #completed
* statusReason = $SCT#127785005
* reasonCode[0] = $SCT#359953009
* reasonCode[+].coding = $SCT#359953009

Instance: Inline-Instance-for-AIRBundleExample-2
InstanceOf: Immunization
Usage: #inline
* meta.versionId = "2"
* meta.lastUpdated = "2023-03-14T04:12:28.983+00:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* meta.extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment"
* meta.extension.extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-score"
* meta.extension.extension.extension[0].url = "dqScore"
* meta.extension.extension.extension[=].valueInteger = 90
* meta.extension.extension.extension[+].url = "dqLastUpdated"
* meta.extension.extension.extension[=].valueDateTime = "2023-03-14T04:12:28.983+00:00"
* meta.extension.extension.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-dq-violations"
* meta.extension.extension.extension[=].extension[0].url = "DataQualityViolation"
* meta.extension.extension.extension[=].extension[=].extension[0].url = "violationCode"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "200"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationType"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "dataQuality"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationMessage"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "The vaccine code is unrecognised. A vaccine code should be part of the air-vaccine-product-code value set."
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationElement"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "occurrence.vaccine.code"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationWeight"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "2"
* meta.extension.extension.extension[=].extension[+].url = "DataQualityViolation"
* meta.extension.extension.extension[=].extension[=].extension[0].url = "violationCode"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "300"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationType"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "dataQuality"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationMessage"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "An immunisation event should have a vaccine batch expiry date, and the vaccine batch expiry date should not be before the immunisation event date."
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationElement"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "lotNumber"
* meta.extension.extension.extension[=].extension[=].extension[+].url = "violationWeight"
* meta.extension.extension.extension[=].extension[=].extension[=].valueString = "1"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZZ7545"
* occurrenceDateTime = "2023-01-26"
* vaccineCode.text = "Priorix"
* vaccineCode.coding = $CVX#03
* protocolApplied.doseNumberPositiveInt = 1
* lotNumber = "555123"
* expirationDate = "2024-01-31"
* extension.url = "https://standards.digital.health.nz/fhir/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"
* route.coding = $SCT#78421000
* route.coding.version = "1.2"
* site.coding = $SCT#16217701000119102
* site.coding.version = "1.1"
* location = Reference(l1)
* contained.resourceType = "Location"
* contained.id = "l1"
* contained.identifier.system = "http://hl7.org.nz/fhir/StructureDefinition/esam-id"
* contained.identifier.value = "123456"
* contained.managingOrganization.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* contained.managingOrganization.identifier.value = "FZZ835-E"
* status = #completed
* statusReason = $SCT#127785005
* reasonCode[0] = $SCT#359953009
* reasonCode[+].coding = $SCT#359953009
