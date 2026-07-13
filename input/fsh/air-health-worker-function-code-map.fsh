Instance: air-health-worker-function-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- HL7v2 Immunization Function < -- > AIR Health Worker Function"
Description: "This maps HL7 Immunization Function Codes and Provider Roles to AIR Health Worker Function Codes. HL7v2 codes are from V2 table 0443 (Provider Role) and map to message segments as defined in [CodeSystem: providerRole](https://terminology.hl7.org/4.0.0/CodeSystem-v2-0443.html). HL7v3 codes are from [CodeSystem: ParticipationType](http://terminology.hl7.org/CodeSystem/v3-ParticipationType)"

* name = "HL7ImmFuncCode-AIRPerformerHealthWorkerFunction_Map"

* url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-health-worker-function-map"

* status = #active

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-imm-func-code-legacy"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-performer-health-worker-function-code"

* group[0].source = "http://terminology.hl7.org/CodeSystem/v2-0443"
* group[0].target = "https://standards.digital.health.nz/ns/air-terms-code"

* group[0].element[0].code = #AP
* group[0].element[=].target.code = #AP
* group[0].element[=].target.equivalence = #equivalent

* group[0].element[+].code = #OP
* group[0].element[=].target.code = #OP
* group[0].element[=].target.equivalence = #equivalent

* group[1].source = "http://terminology.hl7.org/CodeSystem/v3-ParticipationType"
* group[1].target = "https://standards.digital.health.nz/ns/air-terms-code"

* group[1].element[0].code = #ATND
* group[1].element[=].target.code = #ATND
* group[1].element[=].target.equivalence = #equivalent

* group[1].element[+].code = #ENT
* group[1].element[=].target.code = #ENT
* group[1].element[=].target.equivalence = #equivalent

* group[1].element[+].code = #PPRF
* group[1].element[=].target.code = #PPRF
* group[1].element[=].target.equivalence = #equivalent
