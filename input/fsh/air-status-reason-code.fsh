ValueSet: AIRStatusReasonCode
Id: air-status-reason-code
Title: "AIR Status Reason Code"
Description: "Values to use in the status reason field of an immunisation event."

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-status-reason-code"
* ^experimental = false

* insert StandardMetadata

//CIR calls this "Vaccine Administered"
* $SCT#127785005 "Administration of substance to produce immunity, either active or passive"
// CIR calls this "Administered Overseas", maps to GIVNOS
* $SCT#201571000210103 "History of vaccination given in another country"
* $SCT#171277005 "Sensitivity contraindicated - immunisation"
// maps to ALTGIVN
* $SCT#201581000210101 "Alternate or non national immunisation schedule vaccination given"
* $SCT#266758009 "Immunisation contraindicated"
* $SCT#90311000119107 "Vaccination declined by caregiver"
* $SCT#591000119102 "Vaccine declined by patient"
* $SCT#168276008 "Serology positive"
// CIR calls this "Medically Unfit"
* $SCT#702370009 "Patient unsuitable for procedure"
//CIR calls this "Consent Declined"
* $SCT#310376006 "Immunisation consent not given"
// CIR calls this "Others"
* $SCT#74964007 "Other"
// For ticket IMM-1283
* $SCT#445672005 "Duplicate report"

* $AIRTerms#AEFIOT "Other AFEI or concern"
* $AIRTerms#AEFISA "Serious and/or Severe AEFI - other - indicating contraindication"
* $AIRTerms#AEFISO "Serious and/or Severe AEFI - indicating caution"
* $AIRTerms#AEFISX "Serious and/or Severe AEFI anaphylaxis indication contradiction"
* $AIRTerms#ALTGIVN "Alternate given"
* $AIRTerms#CIS "Change in Schedule"
* $AIRTerms#CPI "Provider Instruction"
* $AIRTerms#DMC "Permanent contraindication"
* $AIRTerms#DPC "Choice - parental/guardian"
* $AIRTerms#DIC "Choice by Individual"
* $AIRTerms#DNI "Natural immunity confirmed by documented serology"
* $AIRTerms#GIVNOS "Given Overseas"
* $AIRTerms#IND "Indeterminable"
* $AIRTerms#NTP "Unprotected"
* $AIRTerms#P "Protection"
* $AIRTerms#PDS "Parent Declined"
* $AIRTerms#RESCHO "Parental/individual choice to reschedule"
* $AIRTerms#RESREF "Referred elsewhere for immunisation eg specialist"
* $AIRTerms#RESTC "Temporary contraindication"

