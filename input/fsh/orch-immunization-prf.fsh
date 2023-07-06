Profile: OrchestrationImmunization
Parent: Immunization
Id: orch-immunization
Title: "Orchestration Service Immunization"
Description: "This is the Immunization Profile for use in outbound messages from the Orchestration Service. It relaxes nearly of the constraints found in the AIR Immunization profile, because those constraints were applied on the way in to ImmSoT and don't need to be validated again on the way out. Relaxing these constraints also allows the easy insertion of _included resources from NHI, HPI, and other services."

* insert StandardMetadata

// insert metadata extension for data quality
* meta.extension contains air-data-quality-assessment named DataQualityAssessment 0..1



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

* site ^short = "The body site of the vaccine administration (SNOMED code)."


// route of admin value set

* route ^short = "The route of administation of the vaccine."


// remove doseQuantity
* doseQuantity 0..0




// remove note
* note 0..0


