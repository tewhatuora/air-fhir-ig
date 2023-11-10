	Alias: $ethnic-group-level-4-code = https://standards.digital.health.nz/ns/ethnic-group-level-4-code

Instance: update-immunisation-request-response-message-2
InstanceOf: OperationOutcome
Description: "Example synchronous response from Orchestration Server to an update-immunisation request message"
Usage: #example

* id = "update-immunisation-request-response-message-2"


* issue[0].severity = #information
* issue[0].code = #informational
* issue[0].expression = "FZZ968-B"
* issue[0].details.coding.code = #AA
* issue[0].details.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0008"

* issue[1].severity = #error
* issue[1].code = #throttled
* issue[1].expression = "FZZ065-D"