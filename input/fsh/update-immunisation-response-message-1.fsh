Alias: $ethnic-group-level-4-code = https://standards.digital.health.nz/ns/ethnic-group-level-4-code

Instance: update-immunisation-response-message-1
InstanceOf: Bundle
Description: "Example immunisation nomination response message"
Usage: #example

* id = "update-immunisation-response-message-1"
* type = #message
* entry[0].resource.resourceType = "MessageHeader"
//sending pms facility id
* entry[0].resource.source.name =  "pmsfacid"
//EDI account of sending facility
* entry[0].resource.source.endpoint =  "pmsedi"
* entry[0].resource.response.code = #ok

//EDI account of receiving facility 
* entry[0].resource.destination.endpoint = "Mohedi"
//The receiving facility’s Health Facility Code 
* entry[0].resource.destination.name = "Mohfacid"


* entry[0].resource.eventCoding.system = "https://standards.digital.health.nz/ns/air-event-type"
* entry[0].resource.eventCoding.code = #IMMUNISATION_UPDATE_ACK
* entry[0].resource.focus[0] = Reference(OperationOutcome/success1)
//generated guuid
* entry[0].fullUrl = "https://example.com/fhir/R48182fbd6-c7a5-43a4-bbfc-b1443e493ca39"

//the  MessageHeader.id of the request message
* entry[0].resource.response.identifier = "9876543"


* entry[1].resource.resourceType = "OperationOutcome"
* entry[1].fullUrl = "OperationOutcome/success1"
* entry[1].resource.id = "success1"
* entry[1].resource.issue.severity =  #information
* entry[1].resource.issue.code =  #informational
* entry[1].resource.issue.diagnostics = "accepted"
* entry[1].resource.issue.details.coding.code = #AA
* entry[1].resource.issue.details.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0008"

