Extension: AIRRescheduleDate
Id: air-reschedule-date
Title: "AIR Reschedule Date Extension"
Description: "This extension is used on an AIR Immunization resource that is sent to AIR as part of a $bulk-update operation. It holds the date to which the Immunisation Event has been rescheduled."
Context: Immunization

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-reschedule-date"

* insert StandardMetadata 

* value[x] only date
