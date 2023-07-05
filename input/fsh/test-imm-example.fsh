/*
Instance: test-imm
InstanceOf: air-immunization
Usage: #example
Title: "test-imm"
Description: "playing around with performer"
* status = #completed
* vaccineCode = $CVX#03 "MMR"
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"
* occurrenceDateTime = "2023-03-01T16:45:46+13:00"
* performer(performerHealthWorker).function = $AIRTerms#VC "Vaccinator"
* performer(performerHealthWorker).actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer(performerHealthWorker).actor.identifier.value = "90ZZLP"
*/
