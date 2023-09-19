Extension: AIRConsumerSubStatus
Id: air-consumer-sub-status
Title: "AIR Consumer Sub Status"
Description: "This extension is used in AIR to communicate the current sub status of an AIR Patient (AKA Consumer)."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-consumer-sub-status"

* ^context.type = #element
* ^context.expression = "Immunization"

* insert StandardMetadata 

* value[x] only CodeableConcept
* valueCodeableConcept from air-consumer-sub-status-code
