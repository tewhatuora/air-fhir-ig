
Instance: UpdateImmunisationRequestMessageDefinition
InstanceOf: MessageDefinition
Description: "Defines a message used to notify subscribers of an update to a patient’s vaccination record"
Usage: #definition

* url = "http://hl7.org.nz/fhir/MessageDefinition/UpdateImmunisationRequestMessageDefinition"
* status = #draft
* date = "2020-04-21"
* focus[0].code = #Patient
* focus[0].profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-patient"
* focus[0].min = 0
* focus[0].max = "1"

* focus[1].code = #Immunisation
* focus[1].profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* focus[1].min = 1
* focus[1].max = "1"

* focus[2].code = #RelatedPerson
* focus[2].min = 0
* focus[2].max = "2"


* eventCoding.system = "https://standards.digital.health.nz/ns/air-event-type"
* eventCoding.code = #IMMUNISATION_UPDATE

* allowedResponse.message = "http://hl7.org.nz/fhir/MessageDefinition/UpdateImmunisationResponseMessageDefinition"
