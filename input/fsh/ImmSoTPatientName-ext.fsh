Extension: ImmSoTPatientName
Id: immsot-patient-name
Title: "Patient Name"
Description: "Patient name text"

* ^url = "https://standards.digital.health.nz/fhir/StructureDefinition/immsot-patient-name"

// set status to draft
* ^status = #draft

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* value[x] only string 