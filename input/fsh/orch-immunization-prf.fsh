Profile: OrchestrationImmunization
Parent: Immunization
Id: orch-immunization
Title: "Orchestration Service Immunization"
Description: "This is the Immunization Profile for use in outbound messages from the Orchestration Service. It relaxes many of the constraints found in the AIR Immunization profile, and that allows the inclusion of _included resources from NHI, HPI, and other services."

* insert StandardMetadata

// insert metadata extension for data quality
* meta.extension contains air-data-quality-assessment named DataQualityAssessment 0..1

// bind status reason to local value set
* statusReason from air-status-reason-code (preferred)
* statusReason.coding 1..1
* obeys nz-status-reason-1
* obeys nz-status-reason-2

// bind the vaccine to the AIR vaccine value set
* vaccineCode from air-vaccine-product-code (preferred)
* vaccineCode.coding 1..1
* vaccineCode.coding.code 1..1
* vaccineCode.coding.system 1..1

* obeys nz-pat-2
* obeys nz-pat-3

// add a diluent extension
* extension contains air-diluent named Diluent 0..1

// remove encounter
* encounter 0..0

// occurrence only dateTime 
* occurrence[x] only dateTime

// add AgeGiven extension
* extension contains air-age-given named AgeGiven 0..1

// remove recorded date
* recorded 0..0

// remove primarySource
* primarySource 0..0

// remove reportOrigin
* reportOrigin 0..0

// remove manufacturer
* manufacturer 0..0

// body site value set
* site from air-site-code (preferred)
* site ^short = "The body site of the vaccine administration (SNOMED code)."
* site.coding 1..1
* obeys nz-site-1
* obeys nz-site-2

// route of admin value set
* route from air-route-code (preferred)
* route ^short = "The route of administation of the vaccine."
* route.coding 1..1
* obeys nz-route-1
* obeys nz-route-2

// remove doseQuantity
* doseQuantity 0..0

* obeys nz-worker-function-1
* obeys nz-worker-function-2


// remove note
* note 0..0

// point reasonCode at local value set
* reasonCode from air-indication-code (preferred)
* obeys nz-reasonCode-1
* obeys nz-reasonCode-2

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
