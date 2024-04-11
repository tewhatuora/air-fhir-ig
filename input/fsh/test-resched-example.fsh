Instance: imm-example-resched-fail
InstanceOf: air-immunization
Usage: #example
Title: "Immunization Example with Failed Reschedule date"
Description: "This example immunization fails FHIR validation because it has a reschedule date but the status is 'completed'. If a reschedule date is provided, the status must be set to 'not-done' and the statusReason code must be either 'RESCHO', 'RESREF', or 'RESTC'."
* status = #completed
* vaccineCode = $CVX#03 "MMR"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"
* occurrenceDateTime = "2023-03-01T16:45:46+13:00"
* performer.function = $AIRTerms#VC "Vaccinator"
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer.actor.identifier.value = "90ZZLP"

* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-reschedule-date"
* extension[=].valueDate = "2024-12-31"
