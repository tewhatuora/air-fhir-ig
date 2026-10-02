ValueSet: AIRAdministeredProductCode
Id: air-administered-product-code
Title: "AIR Administered Product Code"
Description: "NZMT TPUU codes for use in populating the administeredProduct element in an AIR Immunization resource."

* ^experimental = false

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-administered-product-code"

* insert StandardMetadata

// NZMT TPUU codes

// !!! each code in this file should be mapped to a CVX code in air-vaccine-product-map !!!

// * $NZMT# template line for reuse
* $NZMT#10443641000116108 "M-M-R-II"
* $NZMT#29455501000116107 "Infanrix-hexa"
* $NZMT#44016911000116108 "Priorix"
* $NZMT#10319251000116109 "Hiberix"
* $NZMT#10695781000116100 "Varilrix"
* $NZMT#10347971000116105 "Infanrix IPV"
* $NZMT#10101121000116104 "Boostrix"
* $NZMT#46101011000116102 "Gardasil 9"
* $NZMT#47648581000116104 "Afluria Quad"
* $NZMT#47649511000116103 "Afluria Quad Junior"
* $NZMT#47648881000116102 "Fluad Quad"
* $NZMT#47664751000116102 "FluQuadri"
* $NZMT#29448821000116105 "Zostavax"
* $NZMT#46770131000116100 "Shingrix"
* $NZMT#47407751000116105 "Comirnaty mRNA-CV (30mcg) Diluted"
* $NZMT#47547081000116102 "Comirnaty mRNA-CV (10mcg)"
* $NZMT#47572291000116106 "Comirnaty mRNA-CV (30mcg)"

// This code updated as per IMM-4122
* $NZMT#46580461000116107 "Bexsero"

//This code re-added (see below) with an updated display per IMM-4122
* $NZMT#46580601000116106 "Bexsero"

* $NZMT#29458231000116105 "Menactra"
* $NZMT#47768031000116109 "JYNNEOS"
* $NZMT#47972211000116109 "Afluria Quad"
* $NZMT#47972411000116108 "Afluria Quad Junior"
* $NZMT#47972611000116106 "Fluad Quad"
* $NZMT#47988151000116108 "FluQuadri"
* $NZMT#46044951000116103 "Pneumovax 23"
* $NZMT#20077561000116105 "Prevenar 13"
* $NZMT#10380351000116108 "IPOL"
* $NZMT#47666491000116106 "BCG Vaccine AJV"
* $NZMT#47562481000116104 "MenQuadfi"

// IMM-4919 swap tpuu and correct displays
* $NZMT#10336221000116104 "Havrix 1440"
* $NZMT#31171221000116106 "Engerix B (20 mcg)"

// added 4 aug 23 for ticket IMM-2103
* $NZMT#46083691000116109 "Engerix B (10 mcg)"
* $NZMT#31128931000116109 "NeisVac-C"
* $NZMT#43964841000116102 "Havrix Junior"
* $NZMT#10695851000116103 "Varivax"

// added 7 Aug for IMM-2180
* $NZMT#44630041000116108 "Nimenrix"
* $NZMT#47959701000116108 "Rotarix"
* $NZMT#44006761000116105 "Twinrix"
* $NZMT#44007131000116104 "Twinrix Junior"
* $NZMT#10693001000116105 "Typhim Vi"
* $NZMT#29557441000116106 "Vivotif"
* $NZMT#10645561000116106 "Stamaril"
* $NZMT#29430601000116101 "JEspect"
* $NZMT#44305771000116109 "Rabipur"
* $NZMT#10417931000116105 "Merieux"
* $NZMT#10215541000116100 "Dukoral"
* $NZMT#44741471000116105 "TicoVac"

// Added 22 Aug for NAT-4143
// description updated 30 aug 23
* $NZMT#44881101000116100 "HyperHEP B 110 IU/0.5mL"

// Added 03 Oct 2023 per IMM-2881
* $NZMT#47757241000116104 "Comirnaty mRNA-CV (3mcg)"
* $NZMT#47812711000116103 "Comirnaty mRNA-CV Bivalent (15mcg/15mcg)"
* $NZMT#47411141000116100 "Nuvaxovid rCV"
* $NZMT#47362071000116105 "AstraZeneca ChAd-CV"

// Added 15 Nov 2023 per IMM-3229
* $NZMT#10017131000116103 "Adacel"
* $NZMT#10017251000116104 "Adacel Polio"
* $NZMT#10744051000116109 "Vivaxim"
* $NZMT#10085391000116108 "Avaxim"
* $NZMT#44318211000116104 "Hexaxim"
* $NZMT#44269461000116103 "Panvax H1N1"
* $NZMT#44967911000116100 "Panvax"
* $NZMT#20069331000116107 "Verorab"
* $NZMT#47796751000116103 "Berirab P"

// Added 21 Feb 2024 per IMM-4289
* $NZMT#48175861000116107 "Comirnaty Omicron XBB.1.5 (30mcg) SDV"
* $NZMT#48175171000116106 "Comirnaty Omicron XBB.1.5 (30mcg) MDV"
* $NZMT#48262211000116108 "Influvac Tetra 2024"
* $NZMT#48285331000116103 "Afluria Quad 2024"

// Added 7-8 March 24 per IMM-4385
* $NZMT#48231281000116101 "Flucelvax Quad 2024"
* $NZMT#48294771000116100 "Fluad Quad 2024"

// Added 15 March per IMM-4502
* $NZMT#48322461000116106 "FluQuadri 2024"

* $NZMT#48111641000116101 "Arexvy"

// the following five codes were removed per IMM-2881
/* 
* $NZMT#46580601000116106 "Bexsero without needle"
* $NZMT#46100801000116102 "Gardasil 9"
* $NZMT#29455561000116106 "Infanrix Hexa powder for injection"
* $NZMT#31116511000116103 "Synflorix"
* $NZMT#10598271000116109 "Rotarix"
*/

// Added 13 May per IMM-4462
* $NZMT#48176671000116109 "Comirnaty Omicron XBB.1.5 (10mcg) SDV"
* $NZMT#48179211000116107 "Comirnaty Omicron XBB.1.5 (3mcg) MDV"

// Added 30 May per IMM-4767
* $NZMT#31115901000116100 "Act-HIB"

// Added 19 Nov 2024 per IMM-5353
* $NZMT#48407111000116100 "Comirnaty JN.1 (30mcg) SDV"
* $NZMT#48407721000116108 "Comirnaty JN.1 (10mcg) SDV"
* $NZMT#48408951000116102 "Comirnaty JN.1 (3mcg) MDV"

// Added 21 Feb 2025 per IMM-5538
* $NZMT#48606481000116100 "Flucelvax Quad 2025"
* $NZMT#48583461000116109 "Influvac Tetra 2025"
* $NZMT#48606291000116104 "Fluad Quad 2025"
* $NZMT#48611851000116100 "FluQuadri 2025"
* $NZMT#48606101000116102 "Afluria Quad 2025"

// Added 21 May 2025 per IMM-5782
* $NZMT#45442391000116106 "Palivizumab"

// Added 27 Nov 2025 per IMM-6433
* $NZMT#48709091000116105 "Comirnaty LP.8.1 (3mcg) MDV"
* $NZMT#48709061000116101 "Comirnaty LP.8.1 (10mcg) SDV"
* $NZMT#48709151000116103 "Comirnaty LP.8.1 (30mcg) PFS"

// Added 23 Feb 2026 per IMM-6615
* $NZMT#48833691000116109 "Flucelvax 2026"
* $NZMT#48843351000116107 "Influvac Tetra 2026"
* $NZMT#48838141000116100 "Fluad 2026"
* $NZMT#48864131000116105 "Fluzone 2026"
