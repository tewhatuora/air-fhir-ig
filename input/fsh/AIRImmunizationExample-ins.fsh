Instance: example-AIRImmunization
InstanceOf: air-immunization
Usage: #example
Title: "AIR Immunization v2.0 Example"
Description: "An example of the AIR Immunization resource showing the irst administration of DTaP-IPV-HepB/Hib, conforming to the Imms service data spec as defined at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3445141172/Immunisation+Record+Data+Fields."

* identifier.value = "0234-3456-6789" // whatever comes from the source system

// metadata fields

* vaccineCode = $NZVX#210307

* patient = Reference(pat)

* status = #completed // must be one of completed, not-done, or entered-in-error

// statusReasons are brought into ImmSoT from source systems
// according to mapping table available at 
// https://mohits.atlassian.net/wiki/spaces/NIS/pages/3360064739/Immunisation+Sync+data+Mapping
* statusReason.coding[0].code = #127785005


// this is the vaccine product that was administered
// Note that even though this is a codeableConcept datatype it is acceptable 
// to only populate the .text element, meaning you can store free text if needed
* vaccineCode.coding[0].system = $NZVX
* vaccineCode.coding[0].code = #210307 
* vaccineCode.text = "Infanrix Hexa"

// here's a reference to a contained patient instance
// which is down at the bottom of the FSH
* patient = Reference(PatientJoeBloggs)

// this is when the vaccine was administered
* occurrenceDateTime = "2012-12-25"

* location = Reference(NzLocation/F05021-J) // Southland Hospital, Invercargill

* expirationDate = "2013-12-31"

* site = $SCT#78421000 // Intramuscular route
* route = $SCT#16217701000119102 // Left deltoid

* performer.actor = Reference(NzPractitionerRole/HPI-12345) // to be argued whether to use Prac or PracRole

// TODO: the following code doesn't make clinical sense in the context of the example. Fix that.
// The correct indication code is 6W, 'Six weeks' to be added after I make a codesystem for indication codes.
* reasonCode = $SCT#164641000210109 // Eligible medical condition

// * protocolApplied.series = "DTaP-IPV-HepB/Hib"

* protocolApplied.doseNumberPositiveInt = 1
* protocolApplied.targetDisease = $SCT#397428000 "Diphtheria"
* protocolApplied.targetDisease = $SCT#76902006 "Tetanus"
* protocolApplied.targetDisease = $SCT#27836007 "Pertussis"
* protocolApplied.targetDisease = $SCT#398102009 "Poliomyelitis"
* protocolApplied.targetDisease = $SCT#66071002 "Viral Hepatitis type B"
* protocolApplied.targetDisease = $SCT#91428005 "Haemophilus influenzae infection"
