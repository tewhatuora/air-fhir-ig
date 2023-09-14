Extension: AIRSerologyReport
Id: air-serology-report-extension
Title: "AIR Serology Report Extension"
Description: "This extension allows an AIR Immunization instance to contain information from a serology report that describes a patient's expected level of immune protection from Hepatitis B infection. Note that this extension could be updated to cover additional diseases in the future."
Context: Immunization


* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report-extension"

* insert StandardMetadata

* value[x] only Reference(Observation) 
