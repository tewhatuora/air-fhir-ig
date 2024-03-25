Instance: health-worker-function-code-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map --  HL7v2 Immunization Function Codes < -- > AIR Health Worker Function Codes"
Description: "This maps the codes used to report serology protection status in NIR HL7v2 messaging (OBX-5) to the counterpart codes used in the FHIR observation.interpretation field. Note that this map only includes those codes where the code is different between HL7v2 and FHIR standards."

* status = #draft

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-hl7v2-imm-func"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-performer-health-worker-function-code"

* group.source = "http://terminology.hl7.org/CodeSystem/v2-0443"
* group.target = "https://standards.digital.health.nz/ns/air-terms-code"

* group.element[0].code = #AP
* group.element[=].target.code = #AP
* group.element[=].target.equivalence = #equivalent

* group.element[0].code = #OP
* group.element[=].target.code = #OP
* group.element[=].target.equivalence = #equivalent
