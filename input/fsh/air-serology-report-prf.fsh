Profile: AIRSerologyReportProfile
Parent: Observation
Id: air-serology-report-profile
Title: "AIR Serology Report Profile"
Description: "This profile on the FHIR r4 Observation resource serves to exchange serology report information in support of the legacy NIR data flow that attaches serology info to an existing immunization record and re-sends it. It is cut down substantially from the base Observation resource."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report-profile"

// remove fields that aren't used
* identifier 0..0
* basedOn 0..0
* partOf 0..0
* category 0..0
* subject 0..0
* focus 0..0
* encounter 0..0
* issued 0..0
* dataAbsentReason 0..0
* note 0..0
* bodySite 0..0

* interpretation from air-serology-protection-code (required)

* code.coding.system = $SCT (exactly)
* code.coding.code = #278969009 (exactly)
