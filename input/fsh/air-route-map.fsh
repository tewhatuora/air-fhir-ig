Instance: route-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- Route of Administration HL7v2 < -- > SNOMED "
Description: "This maps the Route codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0162) to SNOMED CT NZ."

* status = #draft

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code-legacy"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code"

* group.source = $AIRTerms
* group.target = $SCT

* group.element[0].code = #PO
* group.element[=].target.code = #26643006
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #IM
* group.element[=].target.code = #78421000
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #SC
* group.element[=].target.code = #34206005
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #ID
* group.element[=].target.code = #372464004
* group.element[=].target.equivalence = #equivalent
