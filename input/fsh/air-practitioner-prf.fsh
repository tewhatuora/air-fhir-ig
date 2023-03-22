Profile: AIRPractitioner
Parent: NzPractitioner
Id: air-practitioner
Title: "AIR Practitioner"
Description: "This profile derived from NZPractitioner implements the requirements of the Aotearoa Immunisation Register (AIR) Immunisation Source of Truth (ImmSoT)."

* insert StandardMetadata

// declare rule to say can't have more than one CPN

* obeys nz-prac-1

// This rule says you must have 1 official NHI
Invariant: nz-prac-1
Expression: "Practitioner.identifier.where(system='https://standards.digital.health.nz/ns/nhi-id') and Practitioner.identifier.count() = 1"
Severity: #error
Description: "Practitioner identifier is limited to a single CPN."
