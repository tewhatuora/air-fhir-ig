Instance: vaccine-product-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- Vaccine Product TPUU (NZMT) < -- > Vaccine (CVX)"
Description: "This map connects vaccine products as identified by the Therapeutic Product Unit of Use (TPUU) code in the New Zealand Medicines Terminology (NZMT) to the vaccines as identified by CVX codes. This mapping facilitates translating TPUU codes stored in ImmSOT to a CVX code that can be received by legacy PMS systems."

* status = #draft

* experimental = false

// the source and target value sets
* sourceCanonical = "https://standards.digital.health.nz/fhir/air/ValueSet/air-vaccine-product-code"
* targetCanonical = "https://standards.digital.health.nz/fhir/air/ValueSet/air-vaccine-product-code"

* group.source = $NZMT
* group.target = $CVX

* insert ConceptMapEntry(10443641000116108, 03, relatedto)
* insert ConceptMapEntry(29455561000116106, 210307, relatedto)
* insert ConceptMapEntry(29455501000116107, 210307, relatedto)
* insert ConceptMapEntry(31116511000116103, 260209, relatedto)
* insert ConceptMapEntry(10598271000116109, 119, relatedto)
* insert ConceptMapEntry(44016911000116108, 03, relatedto)
* insert ConceptMapEntry(10319251000116109, 48, relatedto)
* insert ConceptMapEntry(10695781000116100, 21, relatedto)
* insert ConceptMapEntry(10347971000116105, 99001, relatedto)
* insert ConceptMapEntry(10101121000116104, 99012, relatedto)
* insert ConceptMapEntry(46101011000116102, 165, relatedto)
* insert ConceptMapEntry(47648581000116104, 99006, relatedto)
* insert ConceptMapEntry(47649511000116103, 99006, relatedto)
* insert ConceptMapEntry(47648881000116102, 99006, relatedto)
* insert ConceptMapEntry(47664751000116102, 99006, relatedto)
* insert ConceptMapEntry(29448821000116105, 121, relatedto)
* insert ConceptMapEntry(46770131000116100, 121, relatedto)
* insert ConceptMapEntry(47407751000116105, 110, relatedto)
* insert ConceptMapEntry(47547081000116102, 114, relatedto)
* insert ConceptMapEntry(47572291000116106, 115, relatedto)
* insert ConceptMapEntry(46580461000116107, 115, relatedto)
* insert ConceptMapEntry(46580601000116106, 115, relatedto)
* insert ConceptMapEntry(29458231000116105, 116, relatedto)
* insert ConceptMapEntry(47768031000116109, 118, relatedto)
* insert ConceptMapEntry(47972211000116109, 119, relatedto)
* insert ConceptMapEntry(47972411000116108, 120, relatedto)
* insert ConceptMapEntry(47972611000116106, 120, relatedto)
* insert ConceptMapEntry(47988151000116108, 120, relatedto)
* insert ConceptMapEntry(46100801000116102, 120, relatedto)
* insert ConceptMapEntry(46044951000116103, 120, relatedto)
* insert ConceptMapEntry(20077561000116105, 121, relatedto)
* insert ConceptMapEntry(10380351000116108, 130, relatedto)
* insert ConceptMapEntry(47666491000116106, 130, relatedto)
* insert ConceptMapEntry(10336221000116104, 130, relatedto)
* insert ConceptMapEntry(31171221000116106, 130, relatedto)
* insert ConceptMapEntry(47562481000116104, 133, relatedto)
* insert ConceptMapEntry(46083691000116109, 150, relatedto)
* insert ConceptMapEntry(31128931000116109, 161, relatedto)
* insert ConceptMapEntry(43964841000116102, 163, relatedto)
* insert ConceptMapEntry(10695851000116103, 165, relatedto)
* insert ConceptMapEntry(44630041000116108, 19, relatedto)
* insert ConceptMapEntry(47959701000116108, 20, relatedto)
* insert ConceptMapEntry(44006761000116105, 20, relatedto)
* insert ConceptMapEntry(44007131000116104, 20, relatedto)
* insert ConceptMapEntry(10693001000116105, 202, relatedto)
* insert ConceptMapEntry(29557441000116106, 205, relatedto)
* insert ConceptMapEntry(10645561000116106, 206, relatedto)
* insert ConceptMapEntry(29430601000116101, 207, relatedto)
* insert ConceptMapEntry(44305771000116109, 208, relatedto)
* insert ConceptMapEntry(10417931000116105, 21, relatedto)
* insert ConceptMapEntry(10215541000116100, 210, relatedto)
* insert ConceptMapEntry(44741471000116105, 211, relatedto)
* insert ConceptMapEntry(44881101000116100, 212, relatedto)
