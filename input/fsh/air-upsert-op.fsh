Instance: Immunization-upsert
InstanceOf: OperationDefinition
Description: "An operation to update or insert Immunization resources."
Usage: #definition

* url = "https://standards.digital.health.nz/fhir/air/OperationDefinition/immunization-upsert"

* version = "1.0.0"
* name = "UpsertImmunisationEvent"
* title = "Upsert Immunisation Event"
* status = #active
* kind = #operation
* experimental = false
* description = "Upsert an immunisation event based on a matching algorithm."
* affectsState = true
* code = #"upsert"
* resource = #Immunization
* system = false
* type = true
* instance = false

* parameter[+].name = #immunization
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The Immunization resource to be either updated (if an algorithmic match is found) or inserted (if no match is found) into ImmSOT."
* parameter[=].type = #Immunization

* parameter[+].name = #"return"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #Immunization
* parameter[=].documentation = "The updated or created immunisation event (as an Immunization resource)." 

* parameter[+].name = #"failure"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome
* parameter[=].documentation = "Error response" 
