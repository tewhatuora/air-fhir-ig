Extension: AIRConsumerNIROptOff
Id: air-consumer-nir-opt-off
Title: "AIR Consumer NIR Opt Off"
Description: """
This extension is used in AIR to indicate the Air Patient (AKA Consumer) as having opted off NIR before they were migrated into AIR. 
Presence of this extension on the AIR Patient indicates that the consumer _has_ opted off NIR and the extension includes the date that the consumer requested this to occur.
"""

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-consumer-nir-opt-off"

* ^context.type = #element
* ^context.expression = "Immunization"

* insert StandardMetadata 

* value[x] only date
* valueDate 1..1
