Instance: air-status-reason-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map --Immunization Status Reason Codes"
Description: "This maps the immunization status reason codes across various code systems. The AIR target is to record these using SNOMED CT NZ Edition."

* status = #draft

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-status-reason-code"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-status-reason-code"

* group.source = $AIRTerms
* group.target = $SCT 

* group.element[0].code = #GIVNOS
* group.element[=].target.code = #127785005
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #AEFISX
* group.element[=].target.code = #171277005
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #AEFIOT
* group.element[=].target.code = #171277005
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #AEFISO
* group.element[=].target.code = #171277005
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #AEFISA
* group.element[=].target.code = #171277005
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #ALTGVN
* group.element[=].target.code = #201581000210101
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #DMC
* group.element[=].target.code = #266758009
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #DPC
* group.element[=].target.code = #90311000119107
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #DIC
* group.element[=].target.code = #591000119102
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #DNI
* group.element[=].target.code = #168276008
* group.element[=].target.equivalence = #equivalent

/*
* group.element[+].code = #
* group.element[=].target.code = #
* group.element[=].target.equivalence = #equivalent
*/
