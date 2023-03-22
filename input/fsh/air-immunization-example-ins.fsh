Instance: example-AIRImmunization
InstanceOf: air-immunization
Usage: #example
Title: "AIR Immunization v1 Example"
Description: "An example of the AIR Immunization v1 (history service) resource showing a single vaccine administration."

// metadata fields

* id = "immsot-id" // local id for internal use only
* meta.lastUpdated = "2023-02-15T13:28:17+12:00"

// record identifier from the source system
* identifier.use = #official
* identifier.value = "0234-3456-6789" // whatever comes from the source system
* identifier.system = "https://uri/for/CIR" // this should be a URI

* status = #completed // must be one of completed, not-done, or entered-in-error

// statusReasons are brought into ImmSoT from source systems
// according to mapping table available at 
// https://mohits.atlassian.net/wiki/spaces/NIS/pages/3360064739/Immunisation+Sync+data+Mapping
* statusReason.coding[0].system = $SCT
* statusReason.coding[0].code = #127785005
* statusReason.coding[0].display = "Administration of substance to produce immunity, either active or passive"
* statusReason.text = "Vaccine Administered"

// this is the vaccine product that was administered
// Note that even though this is a codeableConcept datatype it is acceptable 
// to only populate the .text element, meaning you can store free text if needed
* vaccineCode.coding[0].system = $NZVX
* vaccineCode.coding[0].code = #210307 
* vaccineCode.coding[0].display = "Diphtheria, tetanus, acellular pertussis, inactivated polio vaccine, hepatitis B, haemophilus influenzae type b"
* vaccineCode.text = "Infanrix Hexa"

// here's a reference to a patient instance
* patient = Reference(pat)

// this is when the vaccine was administered
* occurrenceDateTime = "2012-12-25"

// this is the facility where the vaccine was administered
* location.type = "air-Location"
* location.identifier.system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* location.identifier.value = "98404"
* location.display = "133 Molesworth Street"

// diluent
* extension[air-diluent][0].extension[diluentLotNumber][0].valueString = "ABC-123"
* extension[air-diluent][0].extension[diluentExpiryDate][0].valueDate = "2023-12-31"


Instance: a8dac655-0469-48ab-8570-fd3a7033c78f
InstanceOf: Immunization
Usage: #example
Title: "AIR Immunization v2 Example"
Description: "An example of an AIR v2 immunization resource, including contained patient and location resources."
* meta.versionId = "null"
* meta.lastUpdated = "2023-03-01T16:45:46.781+13:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* meta.extension[AIRDataQualityScore][0].extension[dataQualityScore][0].valueInteger = 25

* contained[0] = Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-1
* contained[+] = Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-2
* contained[+] = Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-3

* status = #completed

* statusReason.coding = http://snomed.info/sct#127785005

* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#3
* vaccineCode.text = "Measles, Mumps, Rubella"

* patient = Reference(ImmPatientExample)

* occurrenceDateTime = "2023-03-01T16:45:46+13:00"

* location = Reference(ImmLocationExample)

* site.coding = http://snomed.info/sct#16217701000119102

* route.coding = http://snomed.info/sct#54471007

* performer.function = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://nursingcouncil.org.nz"
* performer.actor.identifier.value = "477616"
* performer.actor.identifier.assigner.display = "Nursing Council"

* reasonCode = http://snomed.info/sct#161651000210107

* protocolApplied.doseNumberPositiveInt = 1

Instance: Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-1
InstanceOf: Patient
Usage: #inline
* id = "ImmPatientExample"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-patient"
* identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier.value = "ABC1234"

Instance: Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-2
InstanceOf: Location
Usage: #inline
* id = "ImmLocationExample"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-location"
* identifier.system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* identifier.value = "11111111"
* managingOrganization = Reference(ImmOrganizationExample)

Instance: Inline-Instance-for-a8dac655-0469-48ab-8570-fd3a7033c78f-3
InstanceOf: NzOrganization
Usage: #inline
* id = "ImmOrganizationExample"
* identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* identifier.value = "FZZ835-E"

Instance: 5c5f6a1c-234e-46e5-815b-312152cf98f7
InstanceOf: Bundle
Usage: #example
* meta.lastUpdated = "2023-03-21T22:18:12.137+00:00"
* type = #searchset
* total = 2
* link.relation = "self"
* link.url = "https://api-dev.nonprod.air-api.aws-syd.moh.govt.nz/v2/fhir/Immunization/_search"
* entry[0].fullUrl = "https://api-dev.nonprod.air-api.aws-syd.moh.govt.nz/v2/fhir/Immunization/02e2b41b-c25f-4b32-a478-c7eaaa761f9e"
* entry[=].resource = Inline-Instance-for-5c5f6a1c-234e-46e5-815b-312152cf98f7-1
* entry[+].fullUrl = "https://api-dev.nonprod.air-api.aws-syd.moh.govt.nz/v2/fhir/Immunization/21892644-fafc-42bb-887c-d925fa992fee"
* entry[=].resource = Inline-Instance-for-5c5f6a1c-234e-46e5-815b-312152cf98f7-2

Instance: Inline-Instance-for-5c5f6a1c-234e-46e5-815b-312152cf98f7-1
InstanceOf: Immunization
Usage: #inline
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
* site.coding.version = "1.1"
* site.coding = http://snomed.info/sct#16217701000119102
* route.coding.version = "1.2"
* route.coding = http://snomed.info/sct#78421000
* performer.function.coding.version = "1.0.0"
* performer.function.coding = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode[0] = http://snomed.info#359953009
* reasonCode[+].coding.version = "1"
* reasonCode[=].coding = http://snomed.info#359953009
* protocolApplied.doseNumberPositiveInt = 1

Instance: Inline-Instance-for-5c5f6a1c-234e-46e5-815b-312152cf98f7-2
InstanceOf: Immunization
Usage: #inline
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
* vaccineCode.coding.version = "1.0.0"
* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#03
* vaccineCode.text = "Priorix"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZA7545"
* occurrenceDateTime = "2023-01-26T00:00:00+00:00"
* location = Reference(1)
* lotNumber = "555123"
* expirationDate = "2024-05-31"
* site.coding.version = "1.1"
* site.coding = http://snomed.info/sct#16217701000119102
* route.coding.version = "1.2"
* route.coding = http://snomed.info/sct#78421000
* performer.function.coding.version = "1.0.0"
* performer.function.coding = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode[0] = http://snomed.info#359953009
* reasonCode[+].coding.version = "1"
* reasonCode[=].coding = http://snomed.info#359953009
* protocolApplied.doseNumberPositiveInt = 2

Instance: Imm-Bundle-Example
InstanceOf: Bundle
Usage: #example
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
* site.coding.version = "1.1"
* site.coding = http://snomed.info/sct#16217701000119102
* route.coding.version = "1.2"
* route.coding = http://snomed.info/sct#78421000
* performer.function.coding.version = "1.0.0"
* performer.function.coding = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode[0] = http://snomed.info#359953009
* reasonCode[+].coding.version = "1"
* reasonCode[=].coding = http://snomed.info#359953009
* protocolApplied.doseNumberPositiveInt = 1

Instance: Inline-Instance-for-Imm-Bundle-Example-2
InstanceOf: Immunization
Usage: #inline
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
* vaccineCode.coding.version = "1.0.0"
* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#03
* vaccineCode.text = "Priorix"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZA7545"
* occurrenceDateTime = "2023-01-26T00:00:00+00:00"
* location = Reference(1)
* lotNumber = "555123"
* expirationDate = "2024-05-31"
* site.coding.version = "1.1"
* site.coding = http://snomed.info/sct#16217701000119102
* route.coding.version = "1.2"
* route.coding = http://snomed.info/sct#78421000
* performer.function.coding.version = "1.0.0"
* performer.function.coding = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode[0] = http://snomed.info#359953009
* reasonCode[+].coding.version = "1"
* reasonCode[=].coding = http://snomed.info#359953009
* protocolApplied.doseNumberPositiveInt = 2