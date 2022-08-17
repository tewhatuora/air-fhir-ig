ValueSet: AIRVaccineVS
Id: air-vaccine-vs
Title: "AIR Vaccine Value Set"
Description: "Allowable values for vaccine products in AIR."

// SNOMED vaccines
* include codes from system $SCT where concept is-a #787859002 "Vaccine product (medicinal product)"

// NZMT all codes
* include codes from system $NZMT

// enumerated list of CVX and NZVX codes from Terminz and from NIR
// Display names edited by John C... need these to be ratified and possibly
// expanded to include a Preferred Term and some number of Display Names

* $CVX#3 "Measles, Mumps, Rubella"
* $CVX#8 "Hepatitis B"
* $CVX#9 "Tetanus and diphtheria toxoids"
* $CVX#10 "Inactivated Poliovirus"
* $CVX#19 "BCG"
* $CVX#20 "Diphtheria, tetanus toxoids and acellular pertussis"
* $CVX#21 "Varicella"
* $CVX#30 "Hepatitis B immune globulin"
* $CVX#33 "Pneumococcal polysaccharide"
* $CVX#43 "Hepatitis B vaccine, adult dosage"
* $CVX#44 "Hepatitis B vaccine, dialysis patient dosage"
* $CVX#48 "Haemophilus influenzae type b vaccine"
* $CVX#50 "DTap/Hib"
* $CVX#51 "Hib/HepB"
* $CVX#52 "Hepatitis A vaccine"
* $CVX#62 "HPV Quadrivalent"
* $CVX#83 "Hepatitis A vaccine, paediatric/adolescent dosage"
* $CVX#100 "Pneumococcal conjugate vaccine, 7 valent"
* $CVX#114 "Meningococcal polysaccharide (groups A,C,Y and W-135) diphtheria toxoid conjugate vaccine (MCV4P)"
* $CVX#116 "Rotavirus Pentavalent"
* $CVX#119 "Rotavirus, live, monovalent vaccine"
* $CVX#121 "Zoster (shingles) vaccine, live, for subcutaneous injection"
* $CVX#133 "Pneumococcal conjugate vaccine, 13 valent "
* $CVX#163 "Meningococcal B conjugate vaccine"
* $CVX#165 "Human papillomavirus, 9-valent vaccine"
* $CVX#208 "SARS-COV-2 (COVID-19) vaccine, mRNA, spike protein, LNP, preservative free, 30 mcg/0.3mL dose"
* $NZVX#90306 "PCV"
* $NZVX#90906 "PCV-1"
* $NZVX#99001 "Diphtheria, tetanus, acellular pertussis, inactivated polio"
* $NZVX#99002 "MeNZB"
* $NZVX#99006 "Influenza"
* $NZVX#99008 "MenACYW-135"
* $NZVX#99011 "DTaP / IPV"
* $NZVX#99012 "Diphtheria adult dosage, Tetanus, acellular Pertussis adult dosage"
* $NZVX#99013 "Meningococcal C conjugate vaccine"
* $NZVX#210307 "Diphtheria, tetanus, acellular pertussis, inactivated polio vaccine, hepatitis B, haemophilus influenzae type b"
* $NZVX#260209 "Pneumococcal conjugate vaccine, 10 valent"
* $NZVX#EVP "Emergency (pandemic) vaccine programme"
* $NZVX#EVPMnC "Emergency vaccine programme meningococcal C conjugate vaccine"
