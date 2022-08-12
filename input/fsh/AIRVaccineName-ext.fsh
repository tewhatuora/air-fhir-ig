Extension: AIRVaccineName
Id: air-vaccine-name
Title: "Vaccine Name"
Description: "Vaccine name text"

* ^url = "https://standards.digital.health.nz/fhir/StructureDefinition/air-vaccine-name"

// set status to draft
* ^status = #draft

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* value[x] only string 