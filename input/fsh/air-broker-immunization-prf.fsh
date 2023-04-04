Profile: AIRImmunization
Parent: Immunization
Id: air-immunization
Title: "AIR Immunization"
Description: "This is the AIR Immunization Profile."

* insert StandardMetadata

// insert metadata extension for data quality
* meta.extension contains air-data-quality-score named DQScore 0..1

// bind status reason to local value set
* statusReason from air-status-reason-code (preferred)

// bind the vaccine to the AIR vaccine value set
* vaccineCode from air-vaccine-product-code (preferred)

// make patient point to AIR Patient profile
* patient only Reference(NzPatient)

// add a diluent extension
* extension contains air-diluent named Diluent 0..1

// remove encounter
* encounter 0..0

// occurrence only dateTime 
* occurrence[x] only dateTime

// remove recorded date
* recorded 0..0

// remove primarySource
* primarySource 0..0

// remove reportOrigin
* reportOrigin 0..0

// make location point to AIR Location profile
* location only Reference(NzLocation)

// remove manufacturer
* manufacturer 0..0

// body site value set
* site from air-site-code (preferred)
* site ^short = "The body site of the vaccine administration (SNOMED code)."

// route of admin value set
* route from air-route-code (preferred)
* route ^short = "The route of administation of the vaccine."

// remove doseQuantity
* doseQuantity 0..0

// point performer at local content
* performer.actor only Reference(air-practitioner)
* performer.function from air-vaccinator-function-code (required)
* performer.function ^short = "The person most responsible for the administration of the vaccine into the patient."

// remove note
* note 0..0

// point reasonCode at local value set
* reasonCode from air-indication-code (preferred)

// remove subpotent and subpotent reason code
* isSubpotent 0..0
* subpotentReason 0..0

// remove educational materials reference
* education 0..0

// remove program eligibility
* programEligibility 0..0

// remove funding source
* fundingSource 0..0

// remove reaction
* reaction 0..0

// only one protocolApplied per immunisation
* protocolApplied 0..1
// dose number can only be represented by a number
* protocolApplied.doseNumber[x] only positiveInt

