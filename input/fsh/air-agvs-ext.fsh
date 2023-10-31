Extension: AIRAGVS
Id: air-agvs
Title: "AIR Antigen Group Vaccination Schedule"
Description: "This extension to the AIR ImmunizationRecommendation profile is used to convey information about the antigen group vaccination schedule associated with a Scheduled Event, including the schedule type, the series type, the antigen group, and the version."
Context: ImmunizationRecommendation.recommendation

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-agvs"

* insert StandardMetadata 

* value[x] 0..0
* extension contains 
    schedule-type 1..1 and
    series-type 1..1 and
    antigen-group 1..1 and
    version 1..1

* extension[schedule-type].value[x] only Coding
* extension[series-type].value[x] only Coding
* extension[antigen-group].value[x] only Coding
* extension[version].value[x] only string
