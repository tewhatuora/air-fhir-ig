Instance: air-site-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- Vaccination Site HL7v2 < -- > SNOMED"
Description: "This maps the vaccination site codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0162) to SNOMED CT NZ."

* status = #draft

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code"

* group.source = $AIRTerms
* group.target = $SCT

* group.element[0].code = #LD
* group.element[=].target.code = #16217701000119102
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #RD
* group.element[=].target.code = #16217661000119109
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #LVL
* group.element[=].target.code = #1217007000
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #RVL
* group.element[=].target.code = #1217006009
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #LUA
* group.element[=].target.code = #368208006
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #RUA
* group.element[=].target.code = #368209003
* group.element[=].target.equivalence = #equivalent

* group.element[+].code = #OTH
* group.element[=].target.code = #74964007
* group.element[=].target.equivalence = #equivalent
