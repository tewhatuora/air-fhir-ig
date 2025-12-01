
CodeSystem: Hl7v2_result_1_0
Id: Hl7v2-result
Title: "Hl7v2 Result Code"
Description: "Hl7v2 Result Code"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
* ^url = "https://standards.digital.health.nz/ns/hl7v2-result"
* ^version = "1.0"
* ^status = #draft
* ^experimental = false
* ^date = "2023-05-24T00:00:00+13:00"
* ^publisher = "New Zealand Ministry of Health"
* ^purpose = "NES event type"
* ^caseSensitive = false
* ^versionNeeded = false
* ^content = #complete
* ^count = 3
* #ACCEPTED "accepted"
* #DECLINED "declined"
* #ERROR "error"


ValueSet : Hl7v2_result
Id: hl7v2-result-1.0-code
Title: "Hl7v2_resultResult Code"
Description: "Hl7v2_result Result Code"
* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/hl7v2-result"
* ^version = "1.0"
* codes from system https://standards.digital.health.nz/ns/hl7v2-result

