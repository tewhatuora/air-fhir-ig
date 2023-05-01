Extension: AIRDataQualityAssessment
Id: air-data-quality-assessment
Title: "Data Quality Assessment"
Description: "The data quality assessment of this immunization record as calculated by AIR rules."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment"

* insert StandardMetadata 

* value[x] 0..0
* extension contains
    dqIgnore 0..1 and
    dqStatus 1..1 and
    dqScore 1..1 and
    dqLastUpdated 1..1 and
    DQViolations 0..1
* extension[dqIgnore].value[x] only boolean
* extension[dqStatus].value[x] only string
* extension[dqScore].value[x] only integer
* extension[dqLastUpdated].value[x] only dateTime


Extension: DQViolations
Id: dq-violations
Title: "AIR Data Quality Violation Array"
Description: "This describes an instance of an immunisation record violating one or more AIR data quality rules. Each such violation is described by a codes, a type, a message, a pointer to the targeted element, and a weight."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-dq-violations"

* insert StandardMetadata 

* value[x] 0..0
* extension contains
    DQViolation 1..* 


Extension: DQViolation
Id: dq-violation
Title: "AIR Data Quality Violation Detail"
Description: "This describes one particular AIR data quality rule violation for an Immunization. Each rule violation includes a code, a type, a message, the FHIRPath expression to the element where the error occurred, and the weighting associated with the rule."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-dq-violation"

* insert StandardMetadata 

* value[x] 0..0

* extension contains
    violationCode 1..1 and
    violationType 1..1 and
    violationMessage 1..1 and
    violationElement 1..1 and
    violationWeighting 1..1
* extension[violationCode].value[x] only string
* extension[violationType].value[x] only string
* extension[violationMessage].value[x] only string
* extension[violationElement].value[x] only string
* extension[violationWeighting].value[x] only integer