Extension: AIRModifiedSourceSystem
Id: air-modified-source-system
Title: "AIR Modified Source System"
Description: "This extension is used in AIR to record the system or software used to update the immunisation event or patient record. Example values are ISM, PMS, and so on."
Context: "(Immunization|Patient).meta"

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system"

* insert StandardMetadata 

* value[x] only string
* valueString 1..1
