Profile: AIRImmunization
Parent: Immunization
Id: air-immunization
Title: "AIR Immunization"
Description: "This is the AIR Immunization Profile."

* insert StandardMetadata

// bind the vaccine to the AIR vaccine value set
* vaccineCode from air-vaccine-vs

// make patient point to NZ Base Patient
* patient only Reference(NzPatient)

// add a diluent extension for use by ISM
* extension contains air-diluent named Diluent 0..1

// remove encounter
* encounter 0..0

// remove recorded date
* recorded 0..0

// remove primarySource
* primarySource 0..0

// remove reportOrigin
* reportOrigin 0..0

// make location point to NZ Base location
* location only Reference(NzLocation)

// remove manufacturer
* manufacturer 0..0

// remove site
// what value set do we want to use for body site after we bring it back in scope?
* site 0..0

// remove route
// what value set do we want to use for body site after we bring it back in scope?
* route 0..0

// remove doseQuantity
* doseQuantity 0..0

// point performer at local content
// * performer.function from air-vaccinator-function-code
// * performer.actor only Reference(NzPractitioner or NzPractitionerRole)

// remove note
* note 0..0

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
