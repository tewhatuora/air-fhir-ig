Profile: AIRImmunization
Parent: Immunization
Id: air-immunization
Title: "AIR Immunization"
Description: "This is the AIR Immunization Profile."

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

// make patient point to AIR Patient profile
* patient only Reference(air-patient)
* obeys nz-pat-1
* obeys nz-pat-1-1
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

/*
// slice performer into person and organization types
* performer ^slicing.discriminator.type = #profile
* performer ^slicing.discriminator.path = "performer.actor.resolve()"
* performer ^slicing.rules = #closed
* performer ^slicing.description = "Slicing pattern for immunization.performer... either a person or an org."
* performer ^slicing.ordered = false

* performer contains
    performerHealthWorker 0..1 and
    performerOrganization 0..1

* performer[performerHealthWorker].actor.targetProfile = "air-practitioner"
* performer[performerHealthWorker].actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id" (exactly)
* performer[performerHealthWorker].function from air-performer-health-worker-function-code (required)
* performer[performerHealthWorker].function ^short = "The person most responsible for the administration of the vaccine into the patient. While the full set of NIR performer codes is still permitted, implementations SHOULD only use the codes IP, VC, or VHW going forward, as all other codes will be deprecated."
* performer[performerHealthWorker].function.coding 1..1

* performer[performerOrganization].actor.targetProfile = "air-organization"
* performer[performerOrganization].actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-organisation-id"
* performer[performerOrganization].function from air-performer-organization-code (required)
* performer[performerOrganization].function ^short = "The organization responsible for sponsoring / performing the vaccination event. This field is only needed when the location.managingOrganization is not populated."
* performer[performerOrganization].function.coding 1..1


* obeys nz-worker-function-1
* obeys nz-worker-function-2
*/

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

Invariant: nz-route-1
Description: "if the route of admin has a system, then it must have a code."
Expression: "route.coding.system.exists() implies route.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-route-2
Description: "if the route of admin has a code, then it must have a system."
Expression: "route.coding.code.exists() implies route.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-site-1
Description: "if the body site has a system, then it must have a code."
Expression: "site.coding.system.exists() implies site.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-site-2
Description: "if the body site has a code, then it must have a system."
Expression: "site.coding.code.exists() implies site.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-status-reason-1
Description: "if the status reason has a system, then it must have a code."
Expression: "statusReason.coding.system.exists() implies statusReason.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-status-reason-2
Description: "if the status reason has a code, then it must have a system."
Expression: "statusReason.coding.code.exists() implies statusReason.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-worker-function-1
Description: "if the performer function has a system, then it must have a code."
Expression: "performer.function.coding.system.exists() implies performer.function.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-worker-function-2
Description: "if the performer function has a code, then it must have a system."
Expression: "performer.function.coding.code.exists() implies performer.function.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-reasonCode-1
Description: "if the reasonCode aka indication has a system, then it must have a code."
Expression: "reasonCode.coding.system.exists() implies reasonCode.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-reasonCode-2
Description: "if the reasonCode aka indicationhas a code, then it must have a system."
Expression: "reasonCode.coding.code.exists() implies reasonCode.coding.system.exists()"
Severity: #error
XPath: ""




// This rule says you must have 1 official NHI
Invariant: nz-pat-1
Expression: "patient.identifier.system.exists() implies (patient.identifier.system='https://standards.digital.health.nz/ns/nhi-id' or patient.identifier.system='https://standards.digital.health.nz/ns/air-vhw-id')"
Severity: #error
Description: "Patient identifier must be either the NHI Common Person Number or the vaccinating health worker id assigned by Salesforce."
XPath: ""

Invariant: nz-pat-1-1
Expression: "patient.identifier.count() = 1"
Severity: #error
Description: "There must be exactly one patient identifier."
XPath: ""

Invariant: nz-pat-2
Description: "if the patient identifier has a system, then it must have a value."
Expression: "patient.identifier.system.exists() implies patient.identifier.value.exists()"
Severity: #error
XPath: ""

Invariant: nz-pat-3
Description: "if the patient identifier has a value, then it must have a system."
Expression: "patient.identifier.value.exists() implies patient.identifier.system.exists()"
Severity: #error
XPath: ""
