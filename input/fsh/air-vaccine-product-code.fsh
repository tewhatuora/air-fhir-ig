ValueSet: AIRVaccineProductCode
Id: air-vaccine-product-code
Title: "AIR Vaccine Product Value Set"
Description: "Allowable values for vaccine products in AIR."

* ^experimental = false
* insert StandardMetadata

// NZMT TPUU codes

// * $NZMT# template line for reuse
* $NZMT#10443641000116108 "MMR Vaccine"
* $NZMT#29455561000116106 "Infanrix Hexa powder for injection"
* $NZMT#29455501000116107 "Infanrix-hexa"
* $NZMT#31116511000116103 "Synflorix"
* $NZMT#10598271000116109 "Rotarix"
* $NZMT#44016911000116108 "Priorix"
* $NZMT#10319251000116109 "Hiberix"
* $NZMT#10695781000116100 "Varilrix"
* $NZMT#10347971000116105 "Infanrix IPV"
* $NZMT#10101121000116104 "Boostrix"
* $NZMT#46101011000116102 "Gardasil-9"
* $NZMT#47648581000116104 "Afluria Quad"
* $NZMT#47649511000116103 "Afluria Quad Junior"
* $NZMT#47648881000116102 "Fluad Quad"
* $NZMT#47664751000116102 "FluQuadri"
* $NZMT#29448821000116105 "Zostavax"
* $NZMT#46770131000116100 "Shingrix"
* $NZMT#47407751000116105 "Comirnaty purple"
* $NZMT#47547081000116102 "Comirnaty orange"
* $NZMT#47572291000116106 "Comirnaty gray"
* $NZMT#46580461000116107 "Bexsero with needle"
* $NZMT#46580601000116106 "Bexsero without needle"
* $NZMT#29458231000116105 "Menactra"
* $NZMT#47768031000116109 "JYNNEOS"
* $NZMT#47972211000116109 "Afluria Quad 2023"
* $NZMT#47972411000116108 "Afluria Quad Junior 2023"
* $NZMT#47972611000116106 "Fluad Quad 2023"
* $NZMT#47988151000116108 "FluQuadri 2023"
* $NZMT#46100801000116102 "Gardasil 9"
* $NZMT#46044951000116103 "Pneumovax 23"
* $NZMT#20077561000116105 "Prevenar 13"
* $NZMT#10380351000116108 "IPOL"
* $NZMT#47666491000116106 "BCG Vaccine AJV"
* $NZMT#10336221000116104 "Engerix B (20 mcg)"
* $NZMT#31171221000116106 "Havrix"
* $NZMT#47562481000116104 "MenQuadfi"

// added 4 aug 23 for ticket IMM-2103
* $NZMT#46083691000116109 "Engerix-B (10mcg)"
* $NZMT#31128931000116109 "NeisVac-C"
* $NZMT#43964841000116102 "Havrix Junior"
* $NZMT#10695851000116103 "Varivax"

// added 7 Aug for IMM-2180
* $NZMT#44630041000116108 "Nimenrix"
* $NZMT#47959701000116108 "Rotarix"
* $NZMT#44006761000116105 "Twinrix"
* $NZMT#44007131000116104 "Twinrix Jr"
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

 
// enumerated list of CVX and NZVX codes from Terminz and from NIR
// Display names for these codes taken from NIR Spec v4_5, RXA-5, page 47. 
// Long description.
// For codes not on that list, used a corresponding long description from somewhere else.

* $CVX#03 "MMR"
* $CVX#06 "Rubella"
* $CVX#08 "HepB"
* $CVX#09 "Td"
* $CVX#10 "IPV"
* $CVX#100 "PCV7"
* $CVX#101 "Typhoid"
* $CVX#103 "MenC"
* $CVX#104 "HepB-HepA"
* $CVX#110 "DTaP-IPV-HepB"
* $CVX#114 "MenACWY"
* $CVX#115 "Tdap"

// * $CVX#116 "Rotavirus, pentavalent"

* $CVX#118 "HPV2"
* $CVX#119 "RV1"
* $CVX#120 "DTaP-IPV-Hib"
* $CVX#121 "ZV"
* $CVX#130 "DTaP-IPV"
* $CVX#133 "PCV13"
* $CVX#150 "Influenza"
* $CVX#161 "Influenza"
* $CVX#163 "MenB"
* $CVX#165 "HPV9"
* $CVX#187 "rZV"
* $CVX#19 "BCG"
* $CVX#20 "DTaP"
* $CVX#202 "Influenza"
* $CVX#205 "Influenza"

// * $CVX#206 "Vaccinia (smallpox)"

// * $CVX#207 "COVID-19"

* $CVX#208 "COVID-19"
* $CVX#21 "VV"
* $CVX#210 "COVID-19"
* $CVX#211 "COVID-19"

// * $CVX#212 "COVID-19"

* $CVX#217 "COVID-19"

* $CVX#218 "COVID-19"

* $CVX#219 "COVID-19"

* $CVX#222 "TBE"
* $CVX#22 "DTP-Hib"

// * $CVX#229 "COVID-19"

* $CVX#26 "Cholera"
* $CVX#28 "DT"
* $CVX#30 "HBIG"
* $CVX#33 "23PPV"
* $CVX#35 "Tetanus"
* $CVX#37 "YFV"
* $CVX#39 "JEV"
* $CVX#300 "COVID-19"
* $CVX#43 "HepB"
* $CVX#44 "HepB"
* $CVX#48 "Hib-PRP-T"
* $CVX#50 "DTaP-Hib"
* $CVX#500 "COVID-19"

/* * $CVX#501 "COVID-19"
* $CVX#502 "COVID-19"
* $CVX#504 "COVID-19"
* $CVX#505 "COVID-19"
* $CVX#506 "COVID-19"
* $CVX#507 "COVID-19"
* $CVX#509 "COVID-19" */

* $CVX#51 "Hib-HepB"

/* * $CVX#510 "COVID-19"
* $CVX#511 "COVID-19" */

* $CVX#52 "HepA"
* $CVX#62 "HPV4"
* $CVX#75 "MPX"
* $CVX#83 "Hep A, paed./adol., 2 dose"
* $CVX#25 "Typhoid"

// note that NIR spec doc has this as 90306, but there are 800,000+ records with 090306 and only 32 with 90306
// so I've changed the code to 090306
* $NZVX#090306 "PCV unspecified"
* $NZVX#210307 "DTaP-IPV-HepB/Hib"
* $NZVX#260209 "PCV10"
* $NZVX#90906 "Td"
* $NZVX#99001 "DTaP-IPV"
* $NZVX#99002 "MeNZB"
* $NZVX#99003 "Diphtheria, paed"
* $NZVX#99004 "aP"
* $NZVX#99005 "Diphtheria, adult"
* $NZVX#99006 "Influenza"
* $NZVX#99007 "HepA"
* $NZVX#99008 "MenACWY"
* $NZVX#99009 "Rabies"
* $NZVX#99010 "RIG"
* $NZVX#99011 "DTaP-IPV"
* $NZVX#99012 "Tdap"
* $NZVX#99013 "MenC"

// * $NZVX#EVP "EVP"

* $NZVX#EVPMnC "MenC"
