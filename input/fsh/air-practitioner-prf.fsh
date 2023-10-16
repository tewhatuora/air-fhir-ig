Profile: AIRPractitioner
Parent: NzPractitioner
Id: air-practitioner
Title: "AIR Practitioner Profile"
Description: "This profile derived from NZPractitioner implements the requirements of the Aotearoa Immunisation Register (AIR) Immunisation Source of Truth (ImmSoT)."

* insert StandardMetadata

* obeys nz-prac-1

// Provides a warning if the identifier comes from a system we don't prefer
Invariant: nz-prac-1
Expression: "Practitioner.identifier.where(system='https://standards.digital.health.nz/ns/hpi-person-id' or system='https://standards.digital.health.nz/ns/air-vhw-id' or system='https://standards.digital.health.nz/ns/medical-council-id' or system='https://standards.digital.health.nz/ns/nursing-council-id' or system='https://standards.digital.health.nz/ns/imac-learning-management-id')"
Severity: #warning
Description: "The practitioner identifier SHOULD be either the HPI CPN (https://standards.digital.health.nz/ns/hpi-person-id), the Salesforce Vaccinating Health Worker ID (https://standards.digital.health.nz/ns/air-vhw-id), the NZ Medical Council ID (https://standards.digital.health.nz/ns/medical-council-id), the NZ Nursing Council ID (https://standards.digital.health.nz/ns/nursing-council-id, or the IMAC Learning Management System ID (https://standards.digital.health.nz/ns/imac-learning-management-id)). If another identifier sent to ImmSOT, it will result in a data quality issue and be flagged for follow-up."
