Extension: AIRPlannedEventMatchQuality
Id: air-planned-event-match-quality
Title: "Planned Event Match Quality"
Description: "The match quality of a planned event to an immunisation event as calculated by AIR rules."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match-quality"

* insert StandardMetadata 

* value[x] 0..0
* extension contains
    plannedEventId 1..1 and
    createdDate 1..1 and
    createdReason 1..1 and
    resolvedDate 0..1 and
    resolvedReason 0..1 and
    resolvedBy 0..1

* extension[plannedEventId].value[x] only string
* extension[createdDate].value[x] only dateTime
* extension[createdReason].value[x] only Coding
* extension[resolvedDate].value[x] only dateTime
* extension[resolvedReason].value[x] only Coding
* extension[resolvedBy].value[x] only string

Instance: imm-example-match-quality
InstanceOf: air-immunization
Usage: #example
Title: "Immunization Example with Match Quality extension"
Description: "An example of the immunization resource, including the planned event match quality extension."

* meta.extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match-quality"
* meta.extension[=].extension[0].url = "plannedEventId"
* meta.extension[=].extension[=].valueString = "plannedEvent-0001"
* meta.extension[=].extension[+].url = "createdDate"
* meta.extension[=].extension[=].valueDateTime = "2023-08-21T02:18:30.303+00:00"
* meta.extension[=].extension[+].url = "createdReason"
* meta.extension[=].extension[=].valueCoding = #8103 "Prior dose was not given"
* meta.extension[=].extension[+].url = "resolvedDate"
* meta.extension[=].extension[=].valueDateTime = "2023-09-21T02:18:30.303+00:00"
* meta.extension[=].extension[+].url = "resolvedReason"
* meta.extension[=].extension[=].valueCoding = #200 "Immunisation event has been updated"
* meta.extension[=].extension[+].url = "resolvedBy"
* meta.extension[=].extension[=].valueString = "jacky"

* status = #completed
* vaccineCode = $CVX#03 "MMR"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"
* occurrenceDateTime = "2023-03-01T16:45:46+13:00"
* performer.function = $AIRTerms#VC "Vaccinator"
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer.actor.identifier.value = "90ZZLP"