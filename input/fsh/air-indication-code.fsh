ValueSet: AIRIndicationCode
Id: air-indication-code
Title: "AIR Indication Codes"
Description: "Coded values to describe the reason an immunisation was given. Initially drawn from legacy NIR codes and CIR SNOMED codes."

* ^experimental = false

* insert StandardMetadata

// SNOMED codes removed per IMM-2832
/* 
* $SCT#161651000210107 "Publicly funded vaccination given for 65 years of age or older"
* $SCT#161641000210109 "Publicly funded vaccination given due to medical condition included in criteria list"
* $SCT#161631000210101 "Publicly funded vaccination given due to pregnancy"
* $SCT#161801000210105 "Publicly funded vaccination given for child four years of age or under due to history of hospitalisation with respiratory condition"
* $SCT#161811000210107 "Privately funded vaccination given"
* $SCT#161791000210106 "Publicly funded vaccination given to Māori and Pacific people aged 55 to 64 years of age"
* $SCT#201581000210101 "Alternate vaccination given"
* $SCT#72011000210108 "Pertussis vaccination given"
* $SCT#101631000210102 "COVID-19 vaccine given"
* $SCT#231731000210103 "Publicly funded vaccination given for child three to twelve years of age"
* $SCT#231741000210106 "Publicly funded vaccination given for serious mental health and addiction"
* $SCT#263781000210105 "Publicly funded vaccination given for child six months to twelve years of age" 
*/

* $AIRTerms#1 "Influenza, eligible over 65 years"
* $AIRTerms#2 "Influenza, eligible under 18 years"
* $AIRTerms#3 "Influenza, eligible criteria"
* $AIRTerms#4 "Sexual or household contact"
* $AIRTerms#5 "Primary course"
* $AIRTerms#6 "Booster course"
* $AIRTerms#7 "Post partum"
* $AIRTerms#8 "Low birth weight"
* $AIRTerms#9 "HepB carrier mother"
* $AIRTerms#10 "At risk for TB"
* $AIRTerms#11 "Pre-post splenectomy schedule"
* $AIRTerms#12 "At risk, no previous history"
* $AIRTerms#13 "At risk, previous PCV history"
* $AIRTerms#14 "At risk, previous 23PPV"
* $AIRTerms#15 "Pre-emergency"
* $AIRTerms#16 "Pregnant"
* $AIRTerms#21 "PCV catch up"
* $AIRTerms#Pre "Pre-primary course"
* $AIRTerms#Stn "Funded, if not otherwise specified"
* $AIRTerms#6W "6 weeks"
* $AIRTerms#3M "3 months"
* $AIRTerms#5M "5 months"
* $AIRTerms#12M "12 months"
* $AIRTerms#15M "15 months"
* $AIRTerms#4Y "4 years"
* $AIRTerms#11Y "11 years"
* $AIRTerms#14Y "14 years"
* $AIRTerms#45Y "45 years"
* $AIRTerms#65Y "65 years"
* $AIRTerms#96 "HepB high risk, booster or extra dose"
* $AIRTerms#TPW "Tetanus-prone wound"
* $AIRTerms#5P "Privately funded, primary course"
* $AIRTerms#6P "Privately funded, booster course"
