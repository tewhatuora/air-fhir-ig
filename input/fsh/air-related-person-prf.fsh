Profile: AIRRelatedPersonPrf
Parent: RelatedPerson
Id: air-related-person-prf
Title: "AIR Related Person Profile"
Description: "This profile of the FHIR R4 RelatedPerson resource includes only the fields used in AIR. The AIR use of this profile specifically includes the use cases covered by the NK1 segment in NIR HL7v2 messaging."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-prf"

// identifier put back in per IMM-3674
// * identifier 0..0

* relationship from air-related-person-relationship

* gender 0..0

* birthDate 0..0

* photo 0..0

* period 0..0

* communication 0..0

* address only http://hl7.org.nz/fhir/StructureDefinition/NzAddress
