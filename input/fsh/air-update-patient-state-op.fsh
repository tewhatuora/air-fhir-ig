Instance: Update-patient-state
InstanceOf: OperationDefinition
Usage: #definition
Title: "Update AIR patient state"
Description: "Update the current state of an ImmSOT Consumer.

        Updates the Consumer state and/or sub status only. Input is the Consumer version previously read (used for operation optimistic locking) and the desired Consumer state.

        At least one of **state** and **subStatus** must be specified. If **state** or **subStatus** is not specified, then these attributes will not be updated. Setting subStatus to null will clear the current sub status."

* version = "1.0.0"
* name = "update-patient-state"
* status = #active
* kind = #query
* experimental = false
* affectsState = false
* code = #"update-state"
* resource = #Patient
* system = false
* type = false
* instance = true

* url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/update-patient-state"

* parameter[+].name = #"NHI"
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The logical id to identify patient/consumer."
* parameter[=].type = #Patient

* parameter[+].name = #"version"
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The consumer version previously read."
* parameter[=].type = #Patient

* parameter[+].name = #"state"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The consumer state."
* parameter[=].type = #Patient

* parameter[+].name = #"subStatus"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The consumer subStatus."
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
