Extension: AIRPlannedActivityReferenceExtension
Id: air-planned-activity-reference-extension
Title: "Planned Activity Reference Extension"
Description: "Mirrors FHIR R5 plannedActivityReference (0..1). References exactly one ImmunizationRecommendation resource that represents this activity. The reference equals the recommendation entry's fullUrl (urn:uuid)."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-activity-reference"
* value[x] only Reference(air-immunization-recommendation)

* ^context.type = #element
* ^context.expression = "CarePlan.activity"