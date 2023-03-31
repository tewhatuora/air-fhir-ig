Profile: AIRPatient
Parent: NzPatient
Id: air-patient
Title: "AIR Patient"
Description: "This profile derived from NZPatient implements the requirements of the Aotearoa Immunisation Register (AIR) Immunisation Source of Truth (ImmSoT)."

* insert StandardMetadata

// declare rule to say can't have more than one 'official' (meaning live) NHI - include in the resource
// the rule is down at the bottom
* obeys nz-pat-1
* obeys nz-pat-2
* obeys nz-pat-3


// This rule says you must have 1 official NHI
Invariant: nz-pat-1
Expression: "Patient.identifier.where(system='https://standards.digital.health.nz/ns/nhi-id') and Patient.identifier.count() = 1"
Severity: #error
Description: "Patient identifier is limited to a single NHI."

Invariant: nz-pat-2
Description: "if the patient identifier has a system, then it must have a value."
Expression: "Patient.identifier.system.exists() implies Patient.identifier.value.exists()"
Severity: #error
XPath: ""

Invariant: nz-pat-3
Description: "if the patient identifier has a value, then it must have a system."
Expression: "Patient.identifier.value.exists() implies Patient.identifier.system.exists()"
Severity: #error
XPath: ""
