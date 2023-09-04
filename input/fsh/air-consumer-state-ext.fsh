Extension: AIRConsumerState
Id: air-consumer-state
Title: "AIR Consumer State"
Description: "This extension is used in AIR to communicate the current state of an Air Patient (AKA Consumer)."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-consumer-state"

* ^context.type = #element
* ^context.expression = "Immunization"

* insert StandardMetadata 

* value[x] only CodeableConcept
* valueCodeableConcept from air-consumer-state-code
