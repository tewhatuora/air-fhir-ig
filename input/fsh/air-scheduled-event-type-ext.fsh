Extension: AIRScheduledEventType
Id: air-scheduled-event-type
Title: "AIR Scheduled Event Type"
Description: "This extension to the FHIR ImmunizationRecommendation.recommendation field holds a value that describes the type of planned event used in AIR."
Context: ImmunizationRecommendation.recommendation

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-scheduled-event-type"

* value[x] only CodeableConcept
* valueCodeableConcept from air-scheduled-event-type-code
