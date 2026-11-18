Instance: CarePlanView
InstanceOf: OperationDefinition
Usage: #definition
Title: "CarePlan $view Operation"
Description: "Returns the consumer's full immunisation schedule as a CarePlan View Bundle containing CarePlan, ImmunizationRecommendation, and Immunization resources."

* url = "https://standards.digital.health.nz/fhir/air/OperationDefinition/CarePlan-view"
* version = "1.0.0"
* name = "view"
* status = #active
* kind = #operation
* code = #view
* resource = #CarePlan
* system = false
* type = true
* instance = false
* affectsState = false
* experimental = false

* parameter[+].name = #nhi
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The consumer's National Health Index (NHI)"
* parameter[=].type = #string

* parameter[+].name = #return
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Bundle containing the consumer's full immunisation plan. Response codes: 200 with schedules, 200 empty with REDACTED security tag (information suppressed), 200 empty without REDACTED tag (no schedules), 404 OperationOutcome (not found)"
* parameter[=].type = #Bundle
* parameter[=].targetProfile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-careplan-view-bundle"
