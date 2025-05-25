Instance: Reassign-patient-schedules
InstanceOf: OperationDefinition
Usage: #definition
Title: "Reassign Patient Schedules"
Description: "Reassign immunisation schedules for a patient.

        Cancels the existing schedules and then creates a new set of schedules based on the new onboarding date. Input is the new onboarding date."

* version = "1.0.0"
* name = "reassign-patient-schedules"
* title = "Reassign Patient Schedules"
* status = #active
* kind = #operation
* experimental = false
* affectsState = false
* code = #"reassign-schedules"
* resource = #Patient
* system = false
* type = true
* instance = false

* url = "https://standards.digital.health.nz/fhir/air/OperationDefinition/reassign-patient-schedules"

* parameter[+].name = #"NHI"
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The logical id to identify patient/consumer."
* parameter[=].type = #Patient

* parameter[+].name = #"reassignDate"
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The new onboarding date for the consumer"
* parameter[=].type = #Patient

* parameter[+].name = #"version"
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The consumer version following the update."
* parameter[=].type = #Patient

* parameter[+].name = #"state"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The consumer state."
* parameter[=].type = #Patient

* parameter[+].name = #"subStatus"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The consumer subStatus."
* parameter[=].type = #Patient
