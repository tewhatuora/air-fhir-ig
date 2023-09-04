Extension: AIRModifiedSourceSystem
Id: air-modified-source-system
Title: "AIR Modified Source System"
Description: "This extension is used in AIR to record the system or software used to update the immunisation event record. Example values are ISM, PMS, and so on."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system"

* ^context.type = #element
* ^context.expression = "Immunization.meta"

* insert StandardMetadata 

* value[x] only string
* valueString 1..1
