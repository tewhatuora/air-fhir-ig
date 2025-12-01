Instance: air-site-map
InstanceOf: ConceptMap
Usage: #definition
Title: "Concept Map -- Vaccination Site HL7v2 < -- > SNOMED"
Description: "This maps the vaccination site codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0162) to SNOMED CT NZ."

* name = "HL7VaccinationSite-AIRSiteCode-Map"

* url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-site-map"

* status = #draft

* experimental = false

// the source and target value sets
* sourceCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code"
* targetCanonical = "https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code"

* group.source = $AIRTerms
* group.target = $SCT

// map updated per IMM-2922

* insert ConceptMapEntry(LD, 16217701000119102, relatedto)
* insert ConceptMapEntry(LVL, 1217007000, relatedto)
* insert ConceptMapEntry(RD, 16217661000119109, relatedto)
* insert ConceptMapEntry(RVL, 1217006009, relatedto)
* insert ConceptMapEntry(OTH, 74964007, relatedto)
* insert ConceptMapEntry(LA, 66480008, relatedto)
* insert ConceptMapEntry(RA, 64262003, relatedto)
* insert ConceptMapEntry(LUA, 368208006, relatedto)
* insert ConceptMapEntry(RUA, 368209003, relatedto)
* insert ConceptMapEntry(LG, 299121000210105, relatedto)
* insert ConceptMapEntry(RG, 299141000210104, relatedto)
* insert ConceptMapEntry(LT, 61396006, relatedto)
* insert ConceptMapEntry(RT, 11207009, relatedto)
* insert ConceptMapEntry(LVG, 299151000210101, relatedto)
* insert ConceptMapEntry(RVG, 299161000210103, relatedto)
* insert ConceptMapEntry(BU, 206007, relatedto)
* insert ConceptMapEntry(OTH, 719631004, relatedto)
* insert ConceptMapEntry(OTH, 719632006, relatedto)
* insert ConceptMapEntry(OTH, 1403006, relatedto)
* insert ConceptMapEntry(OTH, 78333006, relatedto)
* insert ConceptMapEntry(OTH, 74262004, relatedto)
