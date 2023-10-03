Extension: AIRPlannedEventType
Id: air-planned-event-type-ext
Title: "AIR Planned Event Type"
Description: "This extension to the FHIR ImmunizationRecommendation.recommendation field holds a value that describes the type of planned event used in AIR."
Context: ImmunizationRecommendation.recommendation

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-consumer-state"

* insert StandardMetadata 

* value[x] only CodeableConcept
* valueCodeableConcept from air-planned-event-type-code
