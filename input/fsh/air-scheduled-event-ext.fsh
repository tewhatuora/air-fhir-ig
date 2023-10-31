Extension: AIRScheduledEvent
Id: air-scheduled-event
Title: "AIR Scheduled Event"
Description: "The extension to the AIR ImmunizationRecommendation profile is used to convey information about scheduled events, including the event type, the schedule type, the series type, and the antigen group."
Context: ImmunizationRecommendation.recommendation

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-scheduled-event"

* insert StandardMetadata 

* value[x] 0..0
* extension contains 
    type 1..1

* extension[type].value[x] only Coding
