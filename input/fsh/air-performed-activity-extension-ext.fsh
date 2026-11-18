Extension: AIRPerformedActivityExtension
Id: air-performed-activity-extension
Title: "Performed Activity Extension"
Description: "Mirrors FHIR R5 performedActivity. References Immunization resources that were matched to this planned activity. Each reference is the Immunization's absolute fullUrl. The extension itself is repeatable (0..*) in CarePlan.activity."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-performed-activity"
* value[x] only Reference(air-immunization)

* ^context.type = #element
* ^context.expression = "CarePlan.activity"

