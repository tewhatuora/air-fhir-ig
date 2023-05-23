Instance: d53fb9cc-e742-4614-b78b-989eda6fa8da
InstanceOf: Immunization
Title: "AIR Immunisation Event Example"
Description: "This is an example of the response to a 'Read Immunisation' query to the AIR system."
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2023-03-14T04:12:21.743+00:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
// * contained = example-location
* extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"
* status = #completed
* statusReason = $SCT#127785005
* vaccineCode.coding = $CVX#03
* vaccineCode.text = "Priorix"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZZZ7545"
* occurrenceDateTime = "2023-01-26T00:00:00+00:00"
* location = Reference(example-location)
* lotNumber = "555123"
* expirationDate = "2024-01-31"
* site.coding = $SCT#16217701000119102
* route.coding = $SCT#78421000
* performer.function.coding = $AIRTerms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode[0] = $SCT#359953009
* reasonCode[=].coding = $SCT#359953009
* protocolApplied.doseNumberPositiveInt = 1

Instance: example-location
InstanceOf: Location
Usage: #inline
* id = "1"
* identifier.system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* identifier.value = "123456"
* managingOrganization.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* managingOrganization.identifier.value = "FZZ835-E"