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

// remove doseQuantity
* doseQuantity 0..0

// point site at local value set
* site from air-site-of-administration-vs

// point route at local value set
* route from air-route-of-administration-vs

// point performer at local content
* performer.function from air-vaccinator-function-vs
* performer.actor only Reference(NzPractitioner or NzPractitionerRole)

// remove note
* note 0..0

// point reasonCode to local content
* reasonCode from air-reason-code-vs

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

// add reporting system extension
* extension contains air-reporting-system named ReportingSystem 0..1
