CodeSystem: AIRStatusReasonTerms
Id: air-status-reason-terms
Title: "AIR Status Reason Terms Code System"
Description: "This AIR code system includes the terms used in NIR HL7v2 messages to populate the RXA-18 field and and in FHIR payloads to populate immunization.statusReason."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/air-status-reason-terms"

* ^experimental = false
* ^caseSensitive = false

// NIR Status Reason Codes

// AEFI codes removed per IMM-2617
/*
* #AEFIOT "Other AFEI or concern"
* #AEFISA "Serious and/or Severe AEFI - other - indicating contraindication"
* #AEFISO "Serious and/or Severe AEFI - indicating caution"
* #AEFISX "Serious and/or Severe AEFI anaphylax is indication contradiction"
*/

* #ALTGIVN "Alternative vaccination"
* #CIS "Change in Schedule"
* #CPI "Provider Instruction"
* #DMC "Permanent contraindication"
* #DPC "Declined by parent/guardian"
* #DIC "Declined by individual"
* #DNI "Immune"
* #GIVNOS "Overseas vaccination"

* #RESCHO "Parental/individual choice to reschedule"
* #RESREF "Referred elsewhere for immunisation eg specialist"
* #RESTC "Temporary contraindication"

// GIVEN and HSTGIVN added per IMM-2617

* #GIVEN "Vaccination given"
* #HSTGIVN "Historic vaccination"

// Serology related codes removed per IMM-2617
// see air-serology-protection-terms 
