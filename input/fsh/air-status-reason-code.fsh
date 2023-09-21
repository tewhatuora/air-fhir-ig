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


// AEFI codes removed per IMM-2617
/* 
* $AIRSR#AEFIOT "Other AFEI or concern"
* $AIRSR#AEFISA "Serious and/or Severe AEFI - other - indicating contraindication"
* $AIRSR#AEFISO "Serious and/or Severe AEFI - indicating caution"
* $AIRSR#AEFISX "Serious and/or Severe AEFI anaphylaxis indication contradiction" 
*/

// All these serology related codes moved out of AIR-Terms and into their own codeSystem 
// as part of IMM-2617
/*
* $AIRSR#IND "Indeterminable"
* $AIRSR#NTP "Unprotected"
* $AIRSR#P "Protection"
* $AIRSR#PDS "Parent Declined"
*/


* $AIRSR#ALTGIVN "Alternative vaccination"
* $AIRSR#CIS "Change in Schedule"
* $AIRSR#CPI "Provider Instruction"
* $AIRSR#DMC "Permanent contraindication"
* $AIRSR#DPC "Declined by parent/guardian"
* $AIRSR#DIC "Declined by individual"
* $AIRSR#DNI "Immune"
* $AIRSR#GIVNOS "Overseas vaccination"

* $AIRSR#RESCHO "Parental/individual choice to reschedule"
* $AIRSR#RESREF "Referred elsewhere for immunisation eg specialist"
* $AIRSR#RESTC "Temporary contraindication"

// GIVEN and HISTGVN added per IMM-2617

* $AIRSR#GIVEN "Vaccination given"
* $AIRSR#HISTGVN "Historic vaccination"
