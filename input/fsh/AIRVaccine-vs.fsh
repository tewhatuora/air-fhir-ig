ValueSet: AIRVaccineVS
Id: air-vaccine-vs
Title: "AIR Vaccine Value Set"
Description: "Allowable values for vaccine products in AIR."

// SNOMED vaccines
* include codes from system $SCT where concept is-a #787859002 "Vaccine product (medicinal product)"

// NZMT all codes
* include codes from system $NZMT

// enumerated list of CVX and NZVX codes from Terminz... does this cover everything we need??

* $CVX#3 "Measles, mumps and rubella virus vaccine [12M, 15M, 4Y, 5, 6, 7, Stn]"
* $CVX#8 "Hepatitis B vaccine, paediatric dosage [6W, 3M, 5M, 4, 6, 9, 96, Stn]"
* $CVX#9 "Tetanus and diphtheria toxoids, adsorbed for adult use [6W, 3M, 5M, 4Y, 11Y, 5, 6, 45Y, 65Y]"
* $CVX#10 "Poliovirus vaccine, inactivated [6W, 3M, 5M, 4Y, 11Y, Stn]"
* $CVX#20 "Diphtheria, tetanus toxoids and acellular pertussis [6W, 3M. 5M, 15M, 4Y, 6]"
* $CVX#21 "Varicella virus vaccine [15M, 11Y, Stn]"
* $CVX#30 "Hepatitis B immune globulin [6, 9]"
* $CVX#33 "Pneumococcal polysaccharide [5]"
* $CVX#43 "Hepatitis B vaccine, adult dosage [4, Stn]"
* $CVX#44 "Hepatitis B vaccine, dialysis patient dosage [Stn]"
* $CVX#48 "Haemophilus influenzae type b vaccine, PRP-T conjugate [6W, 3M, 5M, 15M, 6, 8, Stn]"
* $CVX#52 "Hepatitis A vaccine, adult dosage [Stn]"
* $CVX#83 "Hepatitis A vaccine, paediatric/adolescent dosage [Stn]"
* $CVX#114 "Meningococcal polysaccharide (groups A,C,Y and W-135) diphtheria toxoid conjugate vaccine (MCV4P) [Stn]"
* $CVX#119 "Rotavirus, live, monovalent vaccine [6W, 3M]"
* $CVX#121 "Zoster (shingles) vaccine, live, for subcutaneous injection [65Y]"
* $CVX#133 "Pneumococcal conjugate vaccine, 13 valent [6W, 3M, 5M, 12M, 15M, 21, Stn]"
* $CVX#165 "Human papillomavirus, 9-valent vaccine [5, Stn]"
* $CVX#208 "SARS-COV-2 (COVID-19) vaccine, mRNA, spike protein, LNP, preservative free, 30 mcg/0.3mL dose [12]"
* $NZVX#99001 "Diphtheria, tetanus, acellular pertussis, inactivated polio [6W, 3M, 5M, 4Y, 6]"
* $NZVX#99006 "Influenza [1, 2, 3, 16]"
* $NZVX#99012 "Diphtheria adult dosage, Tetanus, acellular Pertussis adult dosage [6W, 3M, 5M, 4Y, 11Y, 45Y, 65Y, 5, 6, 16, Stn, TPW]"
* $NZVX#99013 "Meningococcal C conjugate vaccine [Stn]"
* $NZVX#210307 "Diphtheria, tetanus, acellular pertussis, inactivated polio vaccine, hepatitis B, haemophilus influenzae type b [6W, 3M, 5M, 4Y]"
* $NZVX#260209 "Pneumococcal conjugate vaccine, 10 valent [6W, 5M, 12M, 15M, 21]"
* $NZVX#EVP "Emergency (pandemic) vaccine programme [15, 5, 6]"
* $NZVX#EVPMnC "Emergency vaccine programme meningococcal C conjugate vaccine [5, 6]"
