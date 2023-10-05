Instance: route-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- Route of Administration HL7v2 < -- > SNOMED"
Description: "This maps the AIR Route of Administration from HL7v2 messaging to SNOMED CT NZ."

* status = #draft

* experimental = false

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code-legacy"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code"

* group.source = $AIRTerms
* group.target = $SCT

* insert ConceptMapEntry(PO, 26643006, equivalent)
* insert ConceptMapEntry(IM, 78421000, equivalent)
* insert ConceptMapEntry(SC, 34206005, equivalent)
* insert ConceptMapEntry(ID, 372464004, equivalent)
