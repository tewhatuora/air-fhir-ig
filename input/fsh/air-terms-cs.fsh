CodeSystem: AIRTerms
Id: air-terms
Title: "AIR Terms"
Description: "This is a code system for all the terms needed in AIR ImmSoT that don't come from an external standard"

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/air-terms-code"

* ^experimental = false
* ^caseSensitive = false

// Health Worker functions
* #VC "Vaccinator" 
    "A person who administers vaccinations and has an additional practicing credential, such as a nurse or doctor."
* #VHW "Vaccinating health worker"
    "A person who administers vaccinations but does not have a higher credential such as a nurse or doctor."

// NIR Indications
* #1 "Over 65 years (Influenza)"
* #2 "Under 18 years, eligible condition (Influenza)"
* #3 "Eligible condition (Influenza)"
* #4 "Sexual or household contact"
* #5 "Primary course"
* #6 "Booster or extra dose"
* #7 "Postpartum"
* #8 "Low birth weight"
* #9 "HepB carrier mother"
* #10 "At risk for TB"
* #11 "Pre- or post-splenectomy"
* #12 "At risk for pneumococcal, no previous history"
* #13 "At risk for pneumococcal, previous conjugate/PCV7 history"
* #14 "At risk for pneumococcal, previous polysaccharide/23PPV history"
* #15 "Pre-emergency"
* #16 "Pregnant woman"
* #21 "Pneumococcal vaccine given on catch-up schedule"
* #Pre "Pre-primary course (vaccines required before any primary course)"
* #Stn "Standard"
* #6W "6 weeks"
* #3M "3 months"
* #5M "5 months"
* #12M "12 months"
* #15M "15 months"
* #4Y "4 years"
* #11Y "11 years"
* #14Y "14 years"
* #45Y "45 years"
* #65Y "65 years"
* #96 "HepB high risk - booster or extra dose"
* #TPW "Tetanus-prone wound"

// NIR Status Reason Codes

* #AEFIOT "Other AFEI or concern"
* #AEFISA "Serious and/or Severe AEFI - other - indicating contraindication"
* #AEFISO "Serious and/or Severe AEFI - indicating caution"
* #AEFISX "Serious and/or Severe AEFI anaphylax is indication contradiction"
* #ALTGIVN "Alternate given"
* #CIS "Change in Schedule"
* #CPI "Provider Instruction"
* #DMC "Permanent contraindication"
* #DPC "Choice - parental/guardian"
* #DIC "Choice by Individual"
* #DNI "Natural immunity confirmed by documented serology"
* #GIVNOS "Given Overseas"
* #IND "Indeterminable"
* #NTP "Unprotected"
* #P "Protection"
* #PDS "Parent Declined"
* #RESCHO "Parental/individual choice to reschedule"
* #RESREF "Referred elsewhere for immunisation eg specialist"
* #RESTC "Temporary contraindication"

// legacy HL7v2 Route codes from the Message Spec v4.5 2020
// These are in HL7v2 table 0162

* #PO "Oral"
* #IM "Intramuscular"
* #SC "Subcutaneous"
* #ID "Intradermal"

// from  http://terminology.hl7.org/CodeSystem/v2-0163
// the below list taken from NIR File Specification version 4.5 24 Sept 2020

* #LD "Left Deltoid"
* #LVL "Left Vastus Lateralis"
* #RD "Right Deltoid"
* #RVL "Right Vastus Lateralis"
* #OTH "Other"
* #LA "Left Arm"
* #RA "Right Arm"
* #LUA "Left Upper Arm"
* #RUA "Right Upper Arm"
* #LG "Left Gluteus Medius"
* #RG "Right Gluteus Medius"
* #LT "Left Thigh"
* #LVG "Left Ventragluteal"
* #RVG "Right Ventragluteal"
* #BU "Buttock" 
