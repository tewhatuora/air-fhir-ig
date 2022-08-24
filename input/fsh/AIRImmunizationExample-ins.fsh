Instance: example-AIRImmunization
InstanceOf: air-immunization
Usage: #example
Title: "AIR Immunization v1 Example"
Description: "An example of the AIR Immunization resource showing a single vaccine administration, conforming to the history cache version as defined at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3360064739/Immunisation+Sync+data+Mapping ."

// metadata fields

* id = "history-cache-id" // local id for internal use only
* meta.lastUpdated = "2022-08-22T13:28:17+12:00"

// record identifier from the source system
* identifier.use = #official
* identifier.value = "0234-3456-6789" // whatever comes from the source system
* identifier.system = "CIR" // this should be a URI

* status = #completed // must be one of completed, not-done, or entered-in-error

// statusReasons are brought into ImmSoT from source systems
// according to mapping table available at 
// https://mohits.atlassian.net/wiki/spaces/NIS/pages/3360064739/Immunisation+Sync+data+Mapping
* statusReason.coding[0].system = $SCT
* statusReason.coding[0].code = #127785005
* statusReason.coding[0].display = "Administration of substance to produce immunity, either active or passive"
* statusReason.text = "Vaccine Administered"

// this is the vaccine product that was administered
// Note that even though this is a codeableConcept datatype it is acceptable 
// to only populate the .text element, meaning you can store free text if needed
* vaccineCode.coding[0].system = $NZVX
* vaccineCode.coding[0].code = #210307 
* vaccineCode.coding[0].display = "Diphtheria, tetanus, acellular pertussis, inactivated polio vaccine, hepatitis B, haemophilus influenzae type b"
* vaccineCode.text = "Infanrix Hexa"

// here's a reference to a contained patient instance
// which is down at the bottom of the FSH
* patient = Reference(PatientJoeBloggs)

// this is when the vaccine was administered
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


// this is the facility where the vaccine was administered
* location.type = "NzLocation"
* location.identifier.value = "F05021-J"
* location.display = "Southland Hospital, Invercargill"

// this is an alternate syntax for location reference
// * location = Reference(NzLocation/F05021-J) // Southland Hospital, Invercargill

// * performer.actor.system = "https://build.fhir.org/ig/HL7NZ/hpi/"
* performer.actor = Reference(DoctorMarcusWelby)

// reason code taken out of scope24 August
// * reasonCode.coding[0].code = #STD
// * reasonCode.text = "Standard"

// This is not referenced in V1 of the service, but it might be useful so I'm leaving it in here but commented out for now. 
// * protocolApplied.series = "DTaP-IPV-HepB/Hib"
// * protocolApplied.doseNumberPositiveInt = 1
// * protocolApplied.targetDisease = $SCT#397428000 "Diphtheria"
// * protocolApplied.targetDisease = $SCT#76902006 "Tetanus"
// * protocolApplied.targetDisease = $SCT#27836007 "Pertussis"
// * protocolApplied.targetDisease = $SCT#398102009 "Poliomyelitis"
// * protocolApplied.targetDisease = $SCT#66071002 "Viral Hepatitis type B"
// * protocolApplied.targetDisease = $SCT#91428005 "Haemophilus influenzae infection"

// commented out for v1
// * isSubpotent = false



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
