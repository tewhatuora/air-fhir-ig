Instance: Imm-Bundle-Example
InstanceOf: Bundle
Usage: #example
Description: "An example search bundle response."
* meta.lastUpdated = "2023-03-21T22:18:12.137+00:00"
* type = #searchset
* total = 2
* link.relation = "self"
* link.url = "https://api-dev.nonprod.air-api.aws-syd.moh.govt.nz/v2/fhir/Immunization/_search"
* entry[0].fullUrl = "https://api-dev.nonprod.air-api.aws-syd.moh.govt.nz/v2/fhir/Immunization/02e2b41b-c25f-4b32-a478-c7eaaa761f9e"
* entry[=].resource = Inline-Instance-for-Imm-Bundle-Example-1
* entry[+].fullUrl = "https://api-dev.nonprod.air-api.aws-syd.moh.govt.nz/v2/fhir/Immunization/21892644-fafc-42bb-887c-d925fa992fee"
* entry[=].resource = Inline-Instance-for-Imm-Bundle-Example-2

Instance: Inline-Instance-for-Imm-Bundle-Example-1
InstanceOf: Immunization
Usage: #inline
Description: "An immunization included in a search bundle response."
* id = "02e2b41b-c25f-4b32-a478-c7eaaa761f9e"
* meta.versionId = "1"
* meta.lastUpdated = "2023-03-21T22:16:06.970+00:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* contained.resourceType = "Location"
* contained.id = "1"
* contained.identifier.system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* contained.identifier.value = "123456"
* contained.managingOrganization.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* contained.managingOrganization.identifier.value = "FZZ835-E"
* extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"
* status = #completed
* statusReason = http://snomed.info/sct#127785005
* vaccineCode.coding.version = "1.0.0"
* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#03
* vaccineCode.text = "Priorix"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZA7545"
* occurrenceDateTime = "2023-01-26T00:00:00+00:00"
* location = Reference(1)
* lotNumber = "555123"
* expirationDate = "2024-01-31"
* site.coding = http://snomed.info/sct#16217701000119102
* route.coding = http://snomed.info/sct#78421000
* performer.function.coding = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode[0] = http://snomed.info#359953009
* reasonCode[=].coding = http://snomed.info#359953009
* protocolApplied.doseNumberPositiveInt = 1

Instance: Inline-Instance-for-Imm-Bundle-Example-2
InstanceOf: Immunization
Usage: #inline
Description: "An immunization included in a search bundle response."
* id = "21892644-fafc-42bb-887c-d925fa992fee"
* meta.versionId = "1"
* meta.lastUpdated = "2023-03-21T22:18:08.473+00:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* contained.resourceType = "Location"
* contained.id = "1"
* contained.identifier.system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* contained.identifier.value = "123456"
* contained.managingOrganization.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* contained.managingOrganization.identifier.value = "FZZ835-E"
* extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"
* status = #completed
* statusReason = http://snomed.info/sct#127785005
* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#03
* vaccineCode.text = "Priorix"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZA7545"
* occurrenceDateTime = "2023-01-26T00:00:00+00:00"
* location = Reference(1)
* lotNumber = "555123"
* expirationDate = "2024-05-31"
* site.coding = http://snomed.info/sct#16217701000119102
* route.coding = http://snomed.info/sct#78421000
* performer.function.coding = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode[0] = http://snomed.info#359953009
* reasonCode[=].coding = http://snomed.info#359953009
* protocolApplied.doseNumberPositiveInt = 2

Instance: Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-2
InstanceOf: Location
Usage: #inline
Description: "A contained location for use in a bundle example"
* id = "ImmLocationExample"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-location"
* identifier.system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* identifier.value = "11111111"
* managingOrganization = Reference(ImmOrganizationExample)

Instance: Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-3
InstanceOf: NzOrganization
Usage: #inline
Description: "A contained organization for use in a bundle example"
* id = "ImmOrganizationExample"
* identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* identifier.value = "FZZ835-E"
