
Instance: UpdateImmunisationResponseMessageDefinition
InstanceOf: MessageDefinition
Description: "Defines a message used to respond to a notification of an update to a patient’s vaccination record"
Usage: #definition

* url = "http://hl7.org.nz/fhir/MessageDefinition/UpdateImmunisationResponsetMessageDefinition"
* status = #draft
* date = "2020-04-21"
* focus[0].code = #OperationOutcome
* focus[0].profile = "http://hl7.org.nz/fhir/StructureDefinition/EnrolmentNominationResponse"
* focus[0].min = 1
* focus[0].max = "1"


* eventCoding.system = "https://standards.digital.health.nz/ns/air-event-type"
* eventCoding.code = #IMMUNISATION_UPDATE_ACK

