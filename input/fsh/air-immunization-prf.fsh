Profile: AIRImmunization
Parent: Immunization
Id: air-immunization
Title: "AIR Immunization"
Description: "This is the AIR Immunization Profile, to be used for immunisation records inbound to ImmSoT. It includes a number of constraints designed to enforce ImmSoT's lean data model approach."

* insert StandardMetadata

// insert metadata extension for data quality
* meta.extension contains air-data-quality-assessment named DataQualityAssessment 0..1

* meta.extension contains air-created-source-system named CreatedSourceSystem 0..1
* meta.extension contains air-created-by named CreatedBy 0..1
* meta.extension contains air-modified-source-system named ModifiedSourceSystem 0..1
* meta.extension contains air-modified-by named ModifiedBy 0..1
* meta.extension contains http://hl7.org/fhir/StructureDefinition/firstCreated named CreatedDate 0..1


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

// add a diluent extension
* extension contains air-diluent named Diluent 0..1

// add a mobile site extension
* extension contains air-mobile-site named MobileSiteId 0..1

// make patient point to AIR Patient profile
// * patient only Reference(air-patient)
* patient ^definition = "The patient should be sent using the logical reference format, specifically an identifier with a system and a value. The identifier must be the NZ NHI number."


// remove encounter
* encounter 0..0

// occurrence only dateTime 
* occurrence[x] only dateTime

// point to AIR-location profile
* location only Reference(air-location)
* location ^short = "The location where the immunisation was administered."
* location ^definition = "The location should be sent using the logical reference format, specifically an identifier with a system and a value. The required identification system is the HPI-F. See the HPI Implementation Guide at https://hpi-ig.hip.digital.health.nz/index.html. "

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

* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id" 
// or "https://standards.digital.health.nz/ns/air-vhw-id"

* performer.function from air-performer-health-worker-function-code

* performer.function.coding 1..1

// performer function coding rules
// if the function has a code, it must have a system and vice versa
* obeys nz-performer-function-1
* obeys nz-performer-function-2

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

// relatedPerson extension to account for Next of Kin aka Caregiver info
* extension contains air-related-person-extension named relatedPersonExtension 0..*

// serologyReport extension for transmitting Hep B serology results
* extension contains air-serology-report-extension named serologyReportExtension 0..1

Invariant: nz-route-1
Description: "If the route of admin has a system, then it must have a code."
Expression: "route.coding.system.exists() implies route.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-route-2
Description: "if the route of admin has a code, then it must have a system."
Expression: "route.coding.code.exists() implies route.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-site-1
Description: "If the body site has a system, then it must have a code."
Expression: "site.coding.system.exists() implies site.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-site-2
Description: "If the body site has a code, then it must have a system."
Expression: "site.coding.code.exists() implies site.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-status-reason-1
Description: "If the status reason has a system, then it must have a code."
Expression: "statusReason.coding.system.exists() implies statusReason.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-status-reason-2
Description: "If the status reason has a code, then it must have a system."
Expression: "statusReason.coding.code.exists() implies statusReason.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-performer-function-1
Description: "If the performer function has a system, then it must have a code."
Expression: "performer.function.coding.system.exists() implies performer.function.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-performer-function-2
Description: "If the performer function has a code, then it must have a system."
Expression: "performer.function.coding.code.exists() implies performer.function.coding.system.exists()"
Severity: #error
XPath: ""

Invariant: nz-reasonCode-1
Description: "If the reasonCode aka indication has a system, then it must have a code."
Expression: "reasonCode.coding.system.exists() implies reasonCode.coding.code.exists()"
Severity: #error
XPath: ""

Invariant: nz-reasonCode-2
Description: "If the reasonCode aka indication has a code, then it must have a system."
Expression: "reasonCode.coding.code.exists() implies reasonCode.coding.system.exists()"
Severity: #error
XPath: ""
