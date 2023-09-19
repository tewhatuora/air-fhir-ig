Profile: AIRLocation
Parent: NzLocation
Id: air-location
Title: "AIR Location Profile"
Description: "Ths profile constrains the NZ Location Profile to meet the requirements of AIR as documented at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3445141172/Immunisation+Event+Data+Fields."

* insert StandardMetadata

* obeys nz-loc1
* obeys nz-loc2

* identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id" (exactly)

Invariant: nz-loc1
Description: "if the location identifier has a system, then it must have a value."
Expression: "identifier.system.exists() implies identifier.value.exists()"
Severity: #error
XPath: ""

Invariant: nz-loc2
Description: "if the location identifier has a value, then it must have a system."
Expression: "identifier.value.exists() implies identifier.system.exists()"
Severity: #error
XPath: ""
