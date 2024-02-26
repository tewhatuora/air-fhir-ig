Instance: Immunization-bulk-update
InstanceOf: OperationDefinition
Description: "An operation to bulk update or insert Immunization resources."
Usage: #definition

* url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/immunization-bulk-update"

* version = "1.0.0"
* name = "BulkUpdateImmunisationEvent"
* title = "Bulk Update Immunisation Event"
* status = #active
* kind = #operation
* experimental = false
* description = "This operation performs a bulk insert and/or update of immunisation events."
* affectsState = true
* code = #"bulk-update"
* resource = #Immunization
* system = false
* type = true
* instance = false

* parameter[+].name = #"create"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "An Immunization resource to be created."
* parameter[=].type = #Immunization

* parameter[+].name = #"upsert"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].documentation = "An Immunization resource to be either updated (if an algorithmic match is found) or inserted (if no match is found) into ImmSOT."
* parameter[=].type = #Immunization

* parameter[+].name = #"created"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].type = #Immunization
* parameter[=].documentation = "The created immunisation event (as an Immunization resource)." 

* parameter[+].name = #"updated"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "*"
* parameter[=].type = #Immunization
* parameter[=].documentation = "The updated immunisation event (as an Immunization resource)." 

* parameter[+].name = #"failure"
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #OperationOutcome
* parameter[=].documentation = "Error response" 
