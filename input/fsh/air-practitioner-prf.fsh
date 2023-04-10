Profile: AIRPractitioner
Parent: NzPractitioner
Id: air-practitioner
Title: "AIR Practitioner Profile"
Description: "This profile derived from NZPractitioner implements the requirements of the Aotearoa Immunisation Register (AIR) Immunisation Source of Truth (ImmSoT)."

* insert StandardMetadata

// declare rule to say can't have more than one CPN

* obeys nz-prac-1

// This rule says you must have 1 official NHI
Invariant: nz-prac-1
Expression: "practitioner.identifier.where(system='https://standards.digital.health.nz/ns/nhi-id' or system='https://standards.digital.health.nz/ns/air-vhw-id') and practitioner.identifier.count() = 1"
Severity: #error
Description: "practitioner identifier is limited to a single identifier which must be the CPN from the NHI (identifier system is https://standards.digital.health.nz/ns/nhi-id) or, for Vaccinating Health Workers only, have been assigned by the vaccinator platform (identifier system is https://standards.digital.health.nz/ns/air-vhw-id)."
