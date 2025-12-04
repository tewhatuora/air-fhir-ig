Instance: air-serology-protection-code-map
InstanceOf: ConceptMap
Usage: #definition
Title: "HL7v2 Serology Obs Value < -- > AIR Serology Protection Code"
Description: "This maps the codes used to report serology protection status in NIR HL7v2 messaging (OBX-5) to the counterpart codes used in the FHIR observation.interpretation field. Note that this map only includes those codes where the code is different between HL7v2 and FHIR standards."

* name = "HL7SerologyObsValue-AIRSerologyProtectionCode-Map"

* url = "https://nzhts.digital.health.nz/fhir/ConceptMap/air-serology-protection-code-map"

* status = #draft

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-serology-protection-code"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-serology-protection-code"

* group.source = "https://standards.digital.health.nz/ns/air-serology-protection-terms"
* group.target = "https://standards.digital.health.nz/ns/air-serology-protection-terms"

* group.element[0].code = #R
* group.element[=].target.code = #P
* group.element[=].target.equivalence = #equivalent

* group.element[0].code = #S
* group.element[=].target.code = #NTP
* group.element[=].target.equivalence = #equivalent

* group.element[0].code = #R
* group.element[=].target.code = #P
* group.element[=].target.equivalence = #equivalent