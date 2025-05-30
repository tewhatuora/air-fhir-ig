Instance: Patient-History
InstanceOf: OperationDefinition
Usage: #definition
Title: "Patient History"
Description: "Fetch all the versions of an ImmSOT Patient/Consumer.

        Modification information is included in the fetched dataset. Input is a valid NHI."

* version = "1.0.0"
* name = "patient-history"
* title = "Patient History"
* status = #active
* kind = #operation
* experimental = false
* affectsState = false
* code = #"patient-history"
* resource = #Patient
* system = false
* type = true
* instance = false

* url = "https://standards.digital.health.nz/fhir/air/OperationDefinition/patient-history"

* parameter[+].name = #"NHI"
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The logical id to identify patient/consumer."
* parameter[=].type = #Patient

* parameter[+].name = #"success"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].type = #Patient
* parameter[=].documentation = "The patient/consumer version (as an Patient resource)." 

* parameter[+].name = #"failure"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome
* parameter[=].documentation = "Error response" 
