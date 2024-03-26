CodeSystem: AIRTerms
Id: air-terms-code
Title: "AIR Terms"
Description: "This is a code system for terms needed in AIR ImmSoT that don't come from an external standard"

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/air-terms-code"

* ^experimental = false
* ^caseSensitive = false

// Health Worker functions
// updated 29 Feb 24 per IMM-4218
// updated 25 Mar per updated IMM-4218
* #AP "Administering Provider"
* #AP #VC "Vaccinator" 
    "A person who administers vaccinations and has an additional practicing credential, such as a nurse or doctor."
* #AP #VHW "Vaccinating health worker"
    "A person who administers vaccinations but does not have a higher credential such as a nurse or doctor."
* #AP #IP "Immunisation Provider"
* #AP #LMC "Lead Maternity Caregiver"
* #AP #OIS "Outreach Immunisation Services"
* #AP #PV "Pharmacist Vaccinator"
* #AP #V "Vaccinator (NIR)"
* #AP #WCP "Well Child Provider"
* #OP "Ordering Provider"
* #OP #GP "General practitioner"
    "A General Practitioner"

// NIR Indications
* #1 "Influenza, eligible over 65 years"
* #2 "Influenza, eligible under 18 years"
* #3 "Influenza, eligible criteria"
* #4 "Sexual or household contact"
* #5 "Primary course"
* #6 "Booster"
* #7 "Post partum"
* #8 "Low birth weight"
* #9 "HepB carrier mother"
* #10 "At risk for TB"
* #11 "Pre-post splenectomy schedule"
* #12 "At risk, no previous history"
* #13 "At risk, previous PCV history"
* #14 "At risk, previous 23PPV"
* #15 "Pre-emergency"
* #16 "Pregnant"
* #21 "PCV catch up"
* #Pre "Pre-primary course"
* #Stn "Funded, if not otherwise specified"
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
* #96 "HepB high risk, booster or extra dose"
* #TPW "Tetanus-prone wound"
* #5P "Privately funded, primary course"
* #6P "Privately funded, booster"

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
* #RT "Right Thigh"
* #LVG "Left Ventragluteal"
* #RVG "Right Ventragluteal"
* #BU "Buttock" 

// Added 26 March 2024 for IMM-4211
* #WHANGAI "whāngai"
