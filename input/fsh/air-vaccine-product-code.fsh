ValueSet: AIRVaccineProductCode
Id: air-vaccine-product-code
Title: "AIR Vaccine Product"
Description: "Allowable values for CVX and NZVX codes used to populate the vaccineCode element in an AIR Immunization resource."

* ^experimental = false

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-vaccine-product-code"

* insert StandardMetadata

* $CVX#03 "MMR"
// Added 05 for IMM-4165
* $CVX#05 "Measles"
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
* $CVX#48 "Hib"
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
* $CVX#182 "OPV"

* $CVX#187 "rZV"
* $CVX#202 "Influenza"
* $CVX#205 "Influenza"

// * $CVX#206 "Vaccinia (smallpox)"
// * $CVX#207 "COVID-19"

* $CVX#208 "COVID-19 mRNA-CV (30mcg)"
* $CVX#210 "COVID-19 ChAd-CV"
* $CVX#211 "COVID-19 rCV"

// * $CVX#212 "COVID-19"

* $CVX#217 "COVID-19 mRNA-CV (30mcg)"
* $CVX#218 "COVID-19 mRNA-CV (10mcg)"
* $CVX#219 "COVID-19 mRNA-CV (3mcg)"
* $CVX#222 "TBE"

// * $CVX#229 "COVID-19"

* $CVX#300 "COVID-19 mRNA-CV (15mcg/15mcg)"
* $CVX#303 "RSV"
* $CVX#93 "RSV"
* $CVX#500 "COVID-19 Product Unspecified"

/* * $CVX#501 "COVID-19"
* $CVX#502 "COVID-19"
* $CVX#504 "COVID-19"
* $CVX#505 "COVID-19"
* $CVX#506 "COVID-19"
* $CVX#507 "COVID-19"
* $CVX#509 "COVID-19" */


/* * $CVX#510 "COVID-19"
* $CVX#511 "COVID-19" */

// Added for IMM-5781
* $CVX#316 "MenABCWY"
* $CVX#01 "DTP"
* $CVX#17 "Hib, unspecified"
* $CVX#89 "Polio, unspecified"
* $CVX#198 "DTP-HepB-Hib"
* $CVX#122 "RV, unspecified"
* $CVX#148 "MenC/Y-Hib PRP"
* $CVX#167 "Meningococcal"
* $CVX#191 "MenA"
* $CVX#192 "MenAC"
* $CVX#215 "PCV15"
* $CVX#216 "PCV20"
* $CVX#327 "PCV21"
* $CVX#04 "M/R"
* $CVX#94 "MMRV"

// IMM-6378 NZXV codes moved to their own CodeSystem
* include codes from system immunisation-code