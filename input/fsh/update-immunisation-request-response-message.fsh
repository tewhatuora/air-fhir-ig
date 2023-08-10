	Alias: $ethnic-group-level-4-code = https://standards.digital.health.nz/ns/ethnic-group-level-4-code

Instance: update-immunisation-request-response-message-1
InstanceOf: Bundle
Description: "Example synchronous response to an enrolment nomination request message"
Usage: #example

* id = "update-immunisation-request-response-message-1"
* type = #message
* entry[0].resource.resourceType = "MessageHeader"
* entry[0].resource.response.code = #ok

* entry[0].resource.eventCoding.system = "https://standards.digital.health.nz/ns/nes-event-type"
* entry[0].resource.eventCoding.code = #IMMUNISATION_UPDATE_ACK
* entry[0].resource.focus[0] = Reference(OperationOutcome/orchestration-sync-response)
//generated guuid
* entry[0].fullUrl = "https://example.com/fhir/R48182fbd6-c7a5-43a4-bbfc-b1443e493ca39"
//Orchestration serve HPI appid 
* entry[0].resource.source.software =  "HSAP11111"
//Orchestration server FHIR service endpoint 
* entry[0].resource.source.endpoint =  "https://api.air.health.digital.co.nz"
//the Bundle.id of the request message
* entry[0].resource.response.identifier = "72178030"

* entry[1].resource.resourceType = "OperationOutcome"
* entry[1].fullUrl = "OperationOutcome/success"
* entry[1].resource.id = "orchestration-sync-response"

* entry[1].resource.issue[0].severity = #information
* entry[1].resource.issue[0].code = #informational
* entry[1].resource.issue[0].diagnostics = "pmsfacid1"
* entry[1].resource.issue[0].details.coding.code = #AA
* entry[1].resource.issue[0].details.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0008"

* entry[1].resource.issue[1].severity = #information
* entry[1].resource.issue[1].code = #informational
* entry[1].resource.issue[1].diagnostics = "pmsfacid2"
* entry[1].resource.issue[1].details.coding.code = #AA
* entry[1].resource.issue[1].details.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0008"