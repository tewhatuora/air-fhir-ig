Extension: AIRModifiedBy
Id: air-modified-by
Title: "AIR Modified By User"
Description: "This extension is used in AIR to record the user who modified the immunisation event or patient record."
Context: "(Immunization|Patient).meta"

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by"

* insert StandardMetadata 

* value[x] only string
* valueString 1..1
