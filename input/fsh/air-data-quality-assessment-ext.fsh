Extension: AIRDataQualityAssessment
Id: air-data-quality-assessment
Title: "Data Quality Score"
Description: "The data quality assessment of this immunization record as calculated by AIR rules."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-score"

* insert StandardMetadata 

* value[x] 0..0
* extension contains
    dataQualityScore 1..1
* extension[dataQualityScore].value[x] only integer 
