ValueSet: AIRVaccinatorFunctionCode
Id: air-vaccinator-function-code
Title: "AIR Vacciniator Function"
Description: "A value set of codes for the functions performed by vaccinators."

* insert StandardMetadata

// the initial value set is defined by HL7, and the basic binding is extensible
* include codes from valueset http://hl7.org/fhir/ValueSet/immunization-function

// we might need some NZ codes of our own, such as to describe specific provider types like fully qualified vaccinator, vaccinator-in-training, etc
