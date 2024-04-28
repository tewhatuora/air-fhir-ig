Extension: AIRPlannedEventMatch
Id: air-planned-event-match
Title: "Planned Event Match"
Description: "The match of a planned event to an immunisation event as calculated by AIR rules."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match"

* insert StandardMetadata 

* value[x] 0..0
* extension contains
    plannedEventId 1..1 and
    matchedDate 1..1 and
    matchedReason 1..1 and
    matchedBy 1..1 and
    unmatchedDate 0..1 and
    unmatchedReason 0..1 and
    unmatchedBy 0..1

* extension[plannedEventId].value[x] only string
* extension[matchedDate].value[x] only dateTime
* extension[matchedReason].value[x] only Coding
* extension[matchedBy].value[x] only string
* extension[unmatchedDate].value[x] only dateTime
* extension[unmatchedReason].value[x] only Coding
* extension[unmatchedBy].value[x] only string

Instance: imm-example-match
InstanceOf: air-immunization
Usage: #example
Title: "Immunization Example with Match and Match Quality extension"
Description: "An example of the immunization resource, including the planned event match quality extension."

* meta.extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match"
* meta.extension[=].extension[0].url = "plannedEventId"
* meta.extension[=].extension[=].valueString = "plannedEvent-0001"
* meta.extension[=].extension[+].url = "matchedDate"
* meta.extension[=].extension[=].valueDateTime = "2023-08-21T02:18:30.303+00:00"
* meta.extension[=].extension[+].url = "matchedReason"
* meta.extension[=].extension[=].valueCoding = #322 "Automatically matched by dose and alternative indication"
* meta.extension[=].extension[+].url = "matchedBy"
* meta.extension[=].extension[=].valueString = "jacky"
* meta.extension[=].extension[+].url = "resolvedDate"
* meta.extension[=].extension[=].valueDateTime = "2023-09-21T02:18:30.303+00:00"
* meta.extension[=].extension[+].url = "resolvedReason"
* meta.extension[=].extension[=].valueCoding = #400 "Immunisation event has been updated and is no longer a match"
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