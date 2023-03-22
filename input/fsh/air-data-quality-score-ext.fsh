Extension: AIRDataQualityScore
Id: air-data-quality-score
Title: "Data Quality Score"
Description: "The data quality score of this immunization record as calculated by AIR rules. Range is from 0 (terrible quality) to 100 (passes all checks)."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-score"

* insert StandardMetadata 


* value[x] 0..0
* extension contains
    dataQualityScore 1..1
* extension[dataQualityScore].value[x] only integer 
