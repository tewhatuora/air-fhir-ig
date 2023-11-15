ValueSet: AIRVaccineProductCode
Id: air-vaccine-product-code
Title: "AIR Vaccine Product Value Set"
Description: "Allowable values for CVX and NZVX codes used to populate the vaccineCode element in an AIR Immunization resource."

* ^experimental = false
* insert StandardMetadata

* $CVX#03 "MMR"
* $CVX#06 "Rubella"
* $CVX#08 "HepB"
* $CVX#09 "Td"
* $CVX#10 "IPV"
* $CVX#19 "BCG"
* $CVX#20 "DTaP"
* $CVX#21 "VV"
* $CVX#22 "DTP-Hib"
* $CVX#25 "Typhoid"
* $CVX#26 "Cholera"
* $CVX#28 "DT"
* $CVX#30 "HBIG"
* $CVX#33 "23PPV"
* $CVX#35 "Tetanus"
* $CVX#37 "YFV"
* $CVX#39 "JEV"
* $CVX#43 "HepB"
* $CVX#44 "HepB"
* $CVX#48 "Hib-PRP-T"
* $CVX#50 "DTaP-Hib"
* $CVX#51 "Hib-HepB"
* $CVX#52 "HepA"
// Added for IMM-3229
* $CVX#56 "Dengue"

* $CVX#62 "HPV4"
* $CVX#75 "MPX"
* $CVX#83 "HepA"
* $CVX#100 "PCV7"
* $CVX#101 "Typhoid"
* $CVX#103 "MenC"
* $CVX#104 "HepB-HepA"
* $CVX#110 "DTaP-IPV-HepB"
* $CVX#114 "MenACWY"
* $CVX#115 "Tdap"

//Re-enabled this code for IMM-3282
* $CVX#116 "RV5"

* $CVX#118 "HPV2"
* $CVX#119 "RV1"
* $CVX#120 "DTaP-IPV-Hib"
* $CVX#121 "rZV"

// Added for IMM-3229
* $CVX#127 "Influenza A (H1N1)"

* $CVX#130 "DTaP-IPV"
* $CVX#133 "PCV13"

// Added for IMM-3229
* $CVX#134 "JEV"

* $CVX#150 "Influenza"

// Added for IMM-3229
* $CVX#160 "Influenza A (H5N1)"

* $CVX#161 "Influenza"
* $CVX#163 "MenB"
* $CVX#165 "HPV9"

// Added for IMM-3229
* $CVX#182 "Polio, oral"

* $CVX#187 "rZV"
* $CVX#202 "Influenza"
* $CVX#205 "Influenza"

// * $CVX#206 "Vaccinia (smallpox)"
// * $CVX#207 "COVID-19"

* $CVX#208 "COVID-19"
* $CVX#210 "COVID-19"
* $CVX#211 "COVID-19"

// * $CVX#212 "COVID-19"

* $CVX#217 "COVID-19"
* $CVX#218 "COVID-19"
* $CVX#219 "COVID-19"
* $CVX#222 "TBE"

// * $CVX#229 "COVID-19"

* $CVX#300 "COVID-19"
* $CVX#500 "COVID-19"

/* * $CVX#501 "COVID-19"
* $CVX#502 "COVID-19"
* $CVX#504 "COVID-19"
* $CVX#505 "COVID-19"
* $CVX#506 "COVID-19"
* $CVX#507 "COVID-19"
* $CVX#509 "COVID-19" */


/* * $CVX#510 "COVID-19"
* $CVX#511 "COVID-19" */


// Added for IMM-3229
* $NZVX#52101 "HepA-Typhoid"

// note that NIR spec doc has this as 90306, but there are 800,000+ records with 090306 and only 32 with 90306
// so I've changed the code to 090306
* $NZVX#090306 "PCV unspecified"

* $NZVX#90906 "Td"
* $NZVX#99001 "Tdap-IPV"
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
* $NZVX#210307 "DTaP-IPV-HepB/Hib"
* $NZVX#260209 "PCV10"

// * $NZVX#EVP "EVP"

* $NZVX#EVPMnC "MenC"
