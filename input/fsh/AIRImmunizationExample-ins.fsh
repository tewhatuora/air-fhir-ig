Instance: example-AIRImmunization
InstanceOf: air-immunization
Usage: #example
Title: "AIR Immunization v1 Example"
Description: "An example of the AIR Immunization resource showing the first administration of DTaP-IPV-HepB/Hib, conforming to the v1 service as defined at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3308028001/Immunisation+History ."

// metadata fields

* id = "history-cache-id"

// the lastUpdated property is not working due to a SUSHI problem, see
// this thread in Github: https://github.com/FHIR/sushi/issues/1126
// * meta.lastUpdated = "21-08-2022"

* identifier.use = #official
* identifier.value = "0234-3456-6789" // whatever comes from the source system
// use system here instead... ???
* identifier.system = "CIR"

* status = #completed // a value here is required by the FHIR artifact

* statusReason.coding[0].system = $SCT
* statusReason.coding[0].code = #127785005
* statusReason.coding[0].display = "Administration of substance to produce immunity, either active or passive"
* statusReason.text = "Vaccine Administered"

// using the reference to vaccine name
* vaccineCode.coding[0].system = $NZVX
* vaccineCode.coding[0].code = #210307 
* vaccineCode.coding[0].display = "Diphtheria, tetanus, acellular pertussis, inactivated polio vaccine, hepatitis B, haemophilus influenzae type b"
* vaccineCode.text = "Infanrix Hexa"

// here's a reference to a contained patient instance
// which is down at the bottom of the FSH
* patient = Reference(PatientJoeBloggs)

* occurrenceDateTime = "2012-12-25"

// using the diluent extension
// out of scope for version 1
// * extension[Diluent].extension[diluentName].valueString = "Sterile water"
// * extension[Diluent].extension[diluentLotNumber].valueString = "DL-98765"
// * extension[Diluent].extension[diluentExpiryDate].valueDate = 2023-11-05

// deemed out of scope for v1 so commented out
// * manufacturer = Reference(Organization/12345) // not sure where we're going to get these organizations truth be told.

// Out of scope for version 1
// * lotNumber = "AB123-2-FF"

* location.type = "NzLocation"
* location.identifier.value = "F05021-J"
* location.display = "Southland Hospital, Invercargill"

// * location = Reference(NzLocation/F05021-J) // Southland Hospital, Invercargill

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

// * performer.actor.system = "https://build.fhir.org/ig/HL7NZ/hpi/"
* performer.actor = Reference(DoctorMarcusWelby)

// Contained performer reference

Instance: DoctorMarcusWelby
InstanceOf: NzPractitioner
Usage: #inline

* identifier.value = "HPI-12345"
* name.text = "Dr Marcus Welby, a fictitious provider"

// Contained patient reference

Instance: PatientJoeBloggs
InstanceOf: NzPatient
Usage: #inline

// * identifier.system = https://standards.digital.health.nz/ns/nhi-id
* identifier.value = "VUY1111"
* name.given = "Joseph M"
* name.family = "Bloggs"
* birthDate.value = 1918-11-11
