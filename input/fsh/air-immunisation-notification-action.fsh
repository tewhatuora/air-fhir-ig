Extension: AirImmunisationNotificationAction
Id: air-immunisation-notification-action
Title:  "Air Immunisation Notification Action"
Description: "Indicates which parties should be notified of the event"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/air-immunisation-notification-action"

* ^context.type = #element
* ^context.expression = "MessageHeader"

* extension 0..0
* value[x] only Coding

* valueCoding from https://standards.digital.health.nz/ns/air-immunisation-notification-action-code