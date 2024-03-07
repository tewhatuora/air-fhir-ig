Instance: vaccine-product-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- Vaccine Product TPUU (NZMT) < -- > Vaccine (CVX)"
Description: "This map connects vaccine products as identified by the Therapeutic Product Unit of Use (TPUU) code in the New Zealand Medicines Terminology (NZMT) to the vaccines as identified by CVX codes. This mapping facilitates translating TPUU codes stored in ImmSOT to a CVX code that can be received by legacy PMS systems."

* status = #draft

* experimental = false

// the source and target value sets
* sourceCanonical = "https://standards.digital.health.nz/fhir/air/ValueSet/air-administered-product-code"
* targetCanonical = "https://standards.digital.health.nz/fhir/air/ValueSet/air-vaccine-product-code"

* group[0].source = $NZMT
* group[0].target = $CVX

* insert ConceptMapEntry(10443641000116108, 03, relatedto)
* insert ConceptMapEntry(44016911000116108, 03, relatedto)
* insert ConceptMapEntry(10319251000116109, 48, relatedto)
* insert ConceptMapEntry(10695781000116100, 21, relatedto)

* insert ConceptMapEntry(46101011000116102, 165, relatedto)

* insert ConceptMapEntry(29448821000116105, 121, relatedto)
* insert ConceptMapEntry(46770131000116100, 121, relatedto)
* insert ConceptMapEntry(47407751000116105, 208, relatedto)
* insert ConceptMapEntry(47547081000116102, 218, relatedto)
* insert ConceptMapEntry(47572291000116106, 217, relatedto)
* insert ConceptMapEntry(46580601000116106, 163, relatedto)
* insert ConceptMapEntry(46580461000116107, 163, relatedto)


* insert ConceptMapEntry(47768031000116109, 75, relatedto)
* insert ConceptMapEntry(46044951000116103, 33, relatedto)
* insert ConceptMapEntry(20077561000116105, 133, relatedto)
* insert ConceptMapEntry(10380351000116108, 10, relatedto)
* insert ConceptMapEntry(47666491000116106, 19, relatedto)
* insert ConceptMapEntry(10336221000116104, 43, relatedto)
* insert ConceptMapEntry(31171221000116106, 52, relatedto)
* insert ConceptMapEntry(47562481000116104, 114, relatedto)
* insert ConceptMapEntry(46083691000116109, 08, relatedto)

* insert ConceptMapEntry(43964841000116102, 83, relatedto)
* insert ConceptMapEntry(10695851000116103, 21, relatedto)
* insert ConceptMapEntry(44630041000116108, 114, relatedto)
* insert ConceptMapEntry(47959701000116108, 119, relatedto)
* insert ConceptMapEntry(44006761000116105, 104, relatedto)
* insert ConceptMapEntry(44007131000116104, 104, relatedto)
* insert ConceptMapEntry(10693001000116105, 101, relatedto)
* insert ConceptMapEntry(29557441000116106, 25, relatedto)
* insert ConceptMapEntry(10645561000116106, 37, relatedto)
* insert ConceptMapEntry(29430601000116101, 134, relatedto)

* insert ConceptMapEntry(10215541000116100, 26, relatedto)
* insert ConceptMapEntry(44741471000116105, 222, relatedto)
* insert ConceptMapEntry(44881101000116100, 30, relatedto)
* insert ConceptMapEntry(29458231000116105, 114, relatedto)
* insert ConceptMapEntry(47757241000116104, 219, relatedto)
* insert ConceptMapEntry(47812711000116103, 300, relatedto)
* insert ConceptMapEntry(47411141000116100, 211, relatedto)
* insert ConceptMapEntry(47362071000116105, 210, relatedto)

// Added 15 Nov 23 per IMM-3229 or IMM-3654
* insert ConceptMapEntry(10085391000116108, 52, relatedto)
* insert ConceptMapEntry(44269461000116103, 127, relatedto)
* insert ConceptMapEntry(44967911000116100, 160, relatedto)


* group[+].source = $NZMT
* group[=].target = $NZVX

* insert ConceptMapEntry(44305771000116109, 99009, relatedto)
* insert ConceptMapEntry(10417931000116105, 99009, relatedto)
* insert ConceptMapEntry(31128931000116109, 99013, relatedto)
* insert ConceptMapEntry(47972211000116109, 99006, relatedto)
* insert ConceptMapEntry(47972411000116108, 99006, relatedto)
* insert ConceptMapEntry(47972611000116106, 99006, relatedto)
* insert ConceptMapEntry(47988151000116108, 99006, relatedto)
* insert ConceptMapEntry(47648581000116104, 99006, relatedto)
* insert ConceptMapEntry(47649511000116103, 99006, relatedto)
* insert ConceptMapEntry(47648881000116102, 99006, relatedto)
* insert ConceptMapEntry(47664751000116102, 99006, relatedto)
* insert ConceptMapEntry(10347971000116105, 99001, relatedto)
* insert ConceptMapEntry(10101121000116104, 99012, relatedto)
* insert ConceptMapEntry(29455501000116107, 210307, relatedto)

// Added 15 Nov 23 per IMM-3229 or IMM-3654
* insert ConceptMapEntry(10017131000116103, 99012, relatedto)
* insert ConceptMapEntry(10017251000116104, 99011, relatedto)
* insert ConceptMapEntry(10744051000116109, 52101, relatedto)
* insert ConceptMapEntry(44318211000116104, 210307, relatedto)
* insert ConceptMapEntry(20069331000116107, 99009, relatedto)
* insert ConceptMapEntry(47796751000116103, 99010, relatedto)

// Added 21 Feb 2024 per IMM-4289
* insert ConceptMapEntry(48175861000116107, 217, relatedto)
* insert ConceptMapEntry(48175171000116106, 217, relatedto)
* insert ConceptMapEntry(48262211000116108, 99006, relatedto)
* insert ConceptMapEntry(48285331000116103, 99006, relatedto)

// Added 7 March 24 per IMM-4385
* insert ConceptMapEntry(48231281000116101, 99006, relatedto)
* insert ConceptMapEntry(48294771000116100, 99006, relatedto)


// the following five maps were removed per IMM-2881
/*
* insert ConceptMapEntry(46580601000116106, 115, relatedto)
* insert ConceptMapEntry(46100801000116102, 120, relatedto)
* insert ConceptMapEntry(29455561000116106, 210307, relatedto)
* insert ConceptMapEntry(31116511000116103, 260209, relatedto)
* insert ConceptMapEntry(10598271000116109, 119, relatedto)
*/
