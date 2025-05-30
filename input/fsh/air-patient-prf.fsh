Profile: AIRPatient
Parent: NzPatient
Id: air-patient
Title: "AIR Patient Profile"
Description: "This profile derived from NZPatient implements the requirements of the Aotearoa Immunisation Register (AIR) Immunisation Source of Truth (ImmSoT)."

* insert StandardMetadata

* meta.extension contains air-modified-source-system named ModifiedSourceSystem 0..1
* meta.extension contains air-modified-by named ModifiedBy 0..1

* extension contains air-consumer-nir-opt-off named NIROptOff 0..1
* extension contains air-consumer-state named ConsumerState 1..1
* extension contains air-consumer-sub-status named ConsumerSubStatus 0..1
