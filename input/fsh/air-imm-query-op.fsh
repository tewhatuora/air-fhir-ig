Instance: Data-quality
InstanceOf: OperationDefinition
Usage: #definition
Title: "Search for Immunisation Events Using Data Quality Parameters"
Description: "An operation to search for Immunisation events that have data quality issues by date range."

* version = "1.0.0"
* name = "data-quality"
* status = #active
* kind = #query
* experimental = false
* affectsState = false
* code = #"data-quality"
* resource = #Immunization
* system = false
* type = true
* instance = false

* url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/immunization-data-quality"

* parameter[+].name = #"_lastUpdated"
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "Used in data-quality search only. Use eq prefix to search for a specific date, or combination of ge prefix and le prefix to search for records within a specified date range."
* parameter[=].type = #Immunization

* parameter[+].name = #"_offset"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The number of records to skip before starting to collect the result set."
* parameter[=].type = #Immunization

* parameter[+].name = #"_count"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The number of records to return in the result set."
* parameter[=].type = #Immunization

* parameter[+].name = #"_includeMigratedData"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "To include migration data in the response. Default to 'false' if not provided."
* parameter[=].type = #Immunization

* parameter[+].name = #"_status"
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Which immunisation statuses to include in the results of a DQ search. Possible values are C (completed), E (entered-in-error) and N (not-done).  Default to including all three statuses (C, E, N) if blank or omitted."
* parameter[=].type = #Immunization
