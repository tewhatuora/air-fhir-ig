ValueSet: AIRPerformerHealthWorkerFunctionCode
Id: air-performer-health-worker-function-code
Title: "AIR Performer Health Worker Function"
Description: "A value set of codes for the functions performed by the people who are involved in administering immunisations in Aotearoa. Note that the preferred terms are AP, OP, VC, VHW and IP. The other terms in this value set will be deprecated in the future. Note that the following codes are considered as Administering Providers: AP, IP, LMC, OIS, PV, VC, VHW, WCP. The following code is considered an Ordering Provider: GP."

* ^experimental = false

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-performer-health-worker-function-code"

* insert StandardMetadata

* $AIRTerms#AP "Administering Provider"
* $AIRTerms#OP "Ordering Provider"
* $AIRTerms#VC "Vaccinator"
* $AIRTerms#VHW "Vaccinating health worker"
* $AIRTerms#GP "General practitioner"
* $AIRTerms#IP "Immunisation Provider"
* $AIRTerms#LMC "Lead Maternity Caregiver"
* $AIRTerms#OIS "Outreach Immunisation Services"
* $AIRTerms#PV "Pharmacist Vaccinator"
* $AIRTerms#WCP "Well Child Provider"
// Updated 2026-Jun-22 IMM-6930
* $AIRTerms#ATND "Supervisor / Attender"
* $AIRTerms#PPRF "Trainee / Performer"
* $AIRTerms#ENT "data entry person"
