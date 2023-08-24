
Instance: imm-example-1
InstanceOf: air-immunization
Usage: #example
Title: "Immunization Example 1"
Description: "A simple example immunization, to be used as a starting point in learning, testing, and building more complex examples."
* status = #completed
* vaccineCode = $CVX#03 "MMR"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"
* occurrenceDateTime = "2023-03-01T16:45:46+13:00"
* performer[practitioner].function = $AIRTerms#VC "Vaccinator"
* performer[practitioner].actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer[practitioner].actor.identifier.value = "90ZZLP"
