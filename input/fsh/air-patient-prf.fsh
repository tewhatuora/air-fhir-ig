Profile: AIRPatient
Parent: NzPatient
Id: air-patient
Title: "AIR Patient Profile"
Description: "This profile derived from NZPatient implements the requirements of the Aotearoa Immunisation Register (AIR) Immunisation Source of Truth (ImmSoT)."

* insert StandardMetadata

* extension contains air-consumer-nir-opt-off named NIROptOff 0..1
* extension contains air-consumer-state named ConsumerState 1..1