Profile: AIROrganization
Parent: NzOrganization
Id: air-organization
Title: "AIR Organization Profile"
Description: "Ths profile constrains the NZ Organization Profile to meet the requirements of AIR as documented at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3445141172/Immunisation+Event+Data+Fields."

* insert StandardMetadata

* obeys nz-org1
* obeys nz-org2

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"

* identifier ^slicing.rules = #open

* identifier contains 
    HPI-O 0..1 and
    NZBN 0..1

* identifier[HPI-O].system = "https://standards.digital.health.nz/ns/hpi-organisation-id" (exactly)
* identifier[NZBN].system = "https://standards.digital.health.nz/ns/hpi-nzbn" (exactly)

Invariant: nz-org1
Description: "if the organization identifier has a system, then it must have a value."
Expression: "identifier.system.exists() implies identifier.value.exists()"
Severity: #error
XPath: ""

Invariant: nz-org2
Description: "if the organization identifier has a value, then it must have a system."
Expression: "identifier.value.exists() implies identifier.system.exists()"
Severity: #error
XPath: ""
