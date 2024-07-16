Instance: Immunization-StatusReason
InstanceOf: SearchParameter
Title: "status-reason:not-in"
Usage: #definition
* url = "http://hl7.org/fhir/SearchParameter/Immunization-StatusReason"
// * url = "https://nzhts.digital.health.nz/fhir/SearchParameter/Immunization-StatusReason"
* name = "StatusReasonSearchParameter"
* status = #active
* experimental = false
* description = "This search parameter excludes Immunizations with specifed status_reason(s) by system|code. Used in standard search only"
* code = #statusReason
* base[0] = #Immunization
* type = #token
* multipleAnd = true
* multipleOr = false
* expression = "Immunization.statusReason.coding"
* modifier = #not-in

Instance: Immunization-Status
InstanceOf: SearchParameter
Title: "status:not-in"
Usage: #definition
* url = "http://hl7.org/fhir/SearchParameter/Immunization-Status"
// * url = "https://nzhts.digital.health.nz/fhir/SearchParameter/Immunization-StatusReason"
* name = "StatusSearchParameter"
* status = #active
* experimental = false
* description = "This search parameter excludes Immunizations with specified status(es). Used in standard search only"
* code = #status
* base[0] = #Immunization
* type = #token
* multipleAnd = true
* multipleOr = false
* expression = "Immunization.status"
* modifier = #not-in