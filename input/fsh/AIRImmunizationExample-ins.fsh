Instance: example-AIRImmunization
InstanceOf: air-immunization
Usage: #example
Title: "AIR Immunization v1 Example"
Description: "An example of the AIR Immunization resource showing the irst administration of DTaP-IPV-HepB/Hib, conforming to the v1 service as defined at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3308028001/Immunisation+History ."

* insert StandardMetadata

* status = #completed // this is required by the FHIR artifact

* identifier.value = "0234-3456-6789" // whatever comes from the source system
// TODO add source system maybe in identifier type or just a string extension

* occurrenceDateTime = "2012-12-25"

// using the string version of vaccine name in case no code is available
* extension[VaccineName].valueString = "Infanrix"

// using the reference to vaccine name
* vaccineCode = $NZMT#29455411000116105 // MPUU [generic) for Infanrix Hexa

// using the diluent extension
* extension[Diluent].extension[diluentName].valueString = "Sterile water"
* extension[Diluent].extension[diluentLotNumber].valueString = "DL-98765"
* extension[Diluent].extension[diluentExpiryDate].valueDate = 2023-11-05

// deemed out of scope for v1 so commented out
// * manufacturer = Reference(Organization/12345) // not sure where we're going to get these organizations truth be told.

* lotNumber = "AB123-2-FF"

* location = Reference(NzLocation/F05021-J) // Southland Hospital, Invercargill

* patient = Reference(pat)
* occurrenceDateTime = "2021-01-20"
* vaccineCode = $NZMT#29455411000116105 // MPUU [generic) for Infanrix Hexa
// This is not referenced in V1 of the service, but it might be useful so I'm leaving it in here but commented out for now. 
// * protocolApplied.series = "DTaP-IPV-HepB/Hib"

* protocolApplied.doseNumberPositiveInt = 1
* protocolApplied.targetDisease = $SCT#397428000 "Diphtheria"
* protocolApplied.targetDisease = $SCT#76902006 "Tetanus"
* protocolApplied.targetDisease = $SCT#27836007 "Pertussis"
* protocolApplied.targetDisease = $SCT#398102009 "Poliomyelitis"
* protocolApplied.targetDisease = $SCT#66071002 "Viral Hepatitis type B"
* protocolApplied.targetDisease = $SCT#91428005 "Haemophilus influenzae infection"

* isSubpotent = false

* performer.actor = Reference(NzPractitionerRole/HPI-12345) // to be argued whether to use Prac or PracRole
