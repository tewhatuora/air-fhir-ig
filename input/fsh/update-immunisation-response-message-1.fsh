Alias: $ethnic-group-level-4-code = https://standards.digital.health.nz/ns/ethnic-group-level-4-code

Instance: update-immunisation-response-message-1
InstanceOf: Bundle
Description: "Example enrolment nomination request message"
Usage: #example

* id = "34567"
* type = #message
* entry[0].resource.resourceType = "MessageHeader"
//sending pms facility id
* entry[0].resource.source.name =  "pmsfacid"
//EDI account of sending facility
* entry[0].resource.source.endpoint =  "pmsedi"

//EDI account of receiving facility 
* entry[0].resource.destination.endpoint = "Mohedi"
//The receiving facility’s Health Facility Code 
* entry[0].resource.destination.name = "Mohfacid"


* entry[0].resource.eventCoding.system = "https://standards.digital.health.nz/ns/nes-event-type"
* entry[0].resource.eventCoding.code = #IMMUNISATION_UPDATE_ACK
* entry[0].resource.focus[0] = Reference(OperationOutcome/success)

//the Bundle.id of the request message
* entry[0].resource.response.identifier = "update-immunisation-request1"


* entry[1].resource.resourceType = "OperationOutcome"
* entry[1].resource.id = "success"
* entry[1].resource.issue.severity =  #information
* entry[1].resource.issue.code =  #informational
* entry[1].resource.issue.details.text = "accepted"
* entry[1].resource.issue.details.coding.code = #ACCEPTED
* entry[1].resource.issue.details.coding.system = "https://standards.digital.health.nz/ns/hl7v2-result"

