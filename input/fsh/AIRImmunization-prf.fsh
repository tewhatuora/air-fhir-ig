Profile: AIRImmunization
Parent: Immunization
Id: air-immunization
Title: "AIR Immunization"
Description: "This is the AIR Immunization Profile."

// set status to draft
* ^status = #draft

// fix the value of status to completed
* status = #completed

// remove statusReason, since it's mostly or only used for things not done and those are out of scope
* statusReason 0..0

// bind the vaccine to the AIR vaccine value set
* vaccineCode from AIRVaccineVS

// add a field to capture a string version of the vaccine name
* extension contains air-vaccine-name named VaccineName 0..1

// add a field to capture a string name of the vaccine programme from NIR
* extension contains air-programme-name named ProgrammeName 0..1

// make patient point to NZ Base Patient
* patient only Reference(NzPatient)

// add a simple string for showing patient name if a referenceable object (e.g. NHI) is not available or as a belt and braces to check
* patient.extension contains air-patient-name named PatientName 0..*

// add a date of birth field again either if there's not an NHI patient available or as a double-check
* patient.extension contains air-patient-dob named PatientDOB 0..1

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

// remove site
// what value set do we want to use for body site after we bring it back in scope?
* site 0..0

// remove route
// what value set do we want to use for body site after we bring it back in scope?
* route 0..0

// remove doseQuantity
* doseQuantity 0..0

// point performer at local content
* performer.function from AIRVaccinatorFunctionVS
* performer.actor only Reference(NzPractitioner or NzPractitionerRole)

// remove note
* note 0..0

// remove reason for vax
* reasonCode 0..0
* reasonReference 0..0

// remove subpotent reason code
* subpotentReason 0..0

// remove educational materials reference
* education 0..0

// remove program eligibility
* programEligibility 0..0

// remove funding source
* fundingSource 0..0

// remove reaction
* reaction 0..0
