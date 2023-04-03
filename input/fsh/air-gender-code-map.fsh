Instance: gender-code-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- Gender Code HL7v2 PID < -- > Administrative Gender used in FHIR R4 "
Description: "This maps the gender codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0001) to the codes returned by the NHI Service."

* status = #draft

// the source and target value sets
* sourceCanonical = "http://terminology.hl7.org/CodeSystem/v2-0001"
* targetCanonical = "http://hl7.org/fhir/administrative-gender"

* group.source = "http://terminology.hl7.org/CodeSystem/v2-0001"
* group.target = "http://hl7.org/fhir/administrative-gender"

* group.element[0].code = #M
* group.element[=].target.code = #male
* group.element[=].target.equivalence = #equivalent

* group.element[0].code = #F
* group.element[=].target.code = #female
* group.element[=].target.equivalence = #equivalent

// note the code I is not actually part of the HL7 code system, but a NZ extension. may need to move these into AIRTerms if this won't validate.
* group.element[0].code = #I
* group.element[=].target.code = #other
* group.element[=].target.equivalence = #equivalent

* group.element[0].code = #U
* group.element[=].target.code = #unknown
* group.element[=].target.equivalence = #equivalent
