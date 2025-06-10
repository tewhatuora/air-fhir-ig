Extension: AIRPerformedActivityExtension
Id: air-performed-activity-extension
Title: "Performed Activity Extension"
Description: "This Performed Activity adds an R5 field to the R4 CarePlan so that we can refer to an Immunization."


* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-performed-activity"
* value[x] only Reference(air-immunization)

* ^context.type = #element
* ^context.expression = "CarePlan.activity.extension"

