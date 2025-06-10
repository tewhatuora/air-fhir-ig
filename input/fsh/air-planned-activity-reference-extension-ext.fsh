Extension: AIRPlannedActivityReferenceExtension
Id: air-planned-activity-reference-extension
Title: "Planned Activity Reference Extension"
Description: "This Planned Activity Reference adds an R5 field to the R4 CarePlan so that we can refer to an ImmunizationRecommendation."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-activity-reference"
* value[x] only Reference(air-immunization-recommendation)

* ^context.type = #element
* ^context.expression = "CarePlan.activity.extension"