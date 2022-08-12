Extension: AIRPatientDOB
Id: air-patient-dob
Title: "Patient DOB"
Description: "Patient Date of Birth"

* ^url = "https://standards.digital.health.nz/fhir/StructureDefinition/air-vaccine-name"

// set status to draft
* ^status = #draft

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

// captured as a string or date
* value[x] only string or date