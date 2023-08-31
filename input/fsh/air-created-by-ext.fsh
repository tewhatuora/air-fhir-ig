Extension: AIRCreatedBy
Id: air-created-by
Title: "AIR Created By User"
Description: "This extension is used in AIR to record the user who created the immunisation event record."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by"

* ^context.type = #element
* ^context.expression = "Immunization.meta"

* insert StandardMetadata 

* value[x] only string
* valueString 1..1
