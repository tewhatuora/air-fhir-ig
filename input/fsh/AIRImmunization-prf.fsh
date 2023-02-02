Profile: AIRImmunization
Parent: Immunization
Id: air-immunization
Title: "AIR Immunization"
Description: "This is the AIR Immunization Profile."

* insert StandardMetadata

// restrict coding fields on statusReason
* statusReason.coding.display 0..0
* statusReason.coding.userSelected 0..0
* statusReason.coding.text 0..0
// require a SNOMED code for StatusReason
* statusReason.coding.system = "http://snomed.info/sct"

// bind the vaccineCode to the AIR vaccine value set
* vaccineCode from air-vaccine-vs
// restrict coding fields on vaccineCode
* vaccineCode.coding 1..1
* vaccineCode.coding.display 0..0
* vaccineCode.coding.userSelected 0..0

// make patient point to NZ Base Patient
* patient only Reference(NzPatient)
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"

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
// restrict location identifier to ESAM
* location.identifier.system = "http://hl7.org.nz/fhir/StructureDefinition/esam-id"
// restrict location managingOrganization to HPI-F
* location.managingOrganization.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"

// remove manufacturer
* manufacturer 0..0

// remove doseQuantity
* doseQuantity 0..0

// point site at local value set
* site from air-site-of-administration-vs
// restrict coding fields on site
* site.coding.display 0..0
* site.coding.userSelected 0..0
* site.coding.text 0..0

// point route at local value set
* route from air-route-of-administration-vs
// restrict coding fields on route
* route.coding.display 0..0
* route.coding.userSelected 0..0
* route.coding.text 0..0

// point performer at local content
* performer.function from air-vaccinator-function-vs
* performer.actor only Reference(NzPractitioner or NzPractitionerRole)
// restrict coding fields on performer.function
* performer.function.coding.display 0..0
* performer.function.coding.userSelected 0..0
* performer.function.coding.text 0..0

// remove note
* note 0..0

// point reasonCode to local content
* reasonCode from air-reason-code-vs
// restrict coding fields on reasonCode
* reasonCode.coding.display 0..0
* reasonCode.coding.userSelected 0..0
* reasonCode.coding.text 0..0

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
