Extension: AIRPlannedEventType
Id: air-planned-event-type
Title: "AIR Planned Event Type"
Description: "This extension to ImmunizationRecommendation is used in AIR to communicate the type of Planned Event that is described by a recommendation inside an ImmunizationRecommendation resource." 
Context: ImmunizationRecommendation.recommendation

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-type"

* insert StandardMetadata 

* value[x] only codeableConcept

* valueCodeableConcept from air-planned-event-code
