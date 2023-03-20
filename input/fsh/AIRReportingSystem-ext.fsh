Extension: AIRReportingSystem 
Id: air-reporting-system
Title: "Immunization Reporting System"
Description: "The system that is reporting the immunization."

* ^url = "https://standards.digital.health.nz/fhir/StructureDefinition/air-reporting-system"

// set status to draft
* ^status = #draft

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* value[x] 0..0
* extension contains
    systemName 1..1
* extension[systemName].value[x] only string 
