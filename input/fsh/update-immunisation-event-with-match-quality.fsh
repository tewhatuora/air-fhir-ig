Alias: $air-status-reason-terms = https://standards.digital.health.nz/ns/air-status-reason-terms
Alias: $cvx = http://hl7.org/fhir/sid/cvx
Alias: $air-terms-code = https://standards.digital.health.nz/ns/air-terms-code
Alias: $sct = http://snomed.info/sct
Alias: $v3-RoleCode = http://terminology.hl7.org/CodeSystem/v3-RoleCode

Instance: immunisation-update-response-message-match-quality
Description: "Example immunisation update response with match quality"
InstanceOf: Immunization
Usage: #example
* meta.extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-source-system"
* meta.extension[=].valueString = "HSAPP0010"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by"
* meta.extension[=].valueString = "user"
* meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/firstCreated"
* meta.extension[=].valueInstant = "2026-03-31T01:29:49.597+00:00"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by"
* meta.extension[=].valueString = "user"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system"
* meta.extension[=].valueString = "HSAPP0010"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment"
* meta.extension[=].extension[0].url = "dqScore"
* meta.extension[=].extension[=].valueInteger = 100
* meta.extension[=].extension[+].url = "dqLastUpdated"
* meta.extension[=].extension[=].valueDateTime = "2026-03-31T01:32:08.270+00:00"
* meta.extension[=].extension[+].url = "dqStatus"
* meta.extension[=].extension[=].valueString = "P"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match"
* meta.extension[=].extension.url = "match"
* meta.extension[=].extension.extension[0].url = "plannedEventId"
* meta.extension[=].extension.extension[=].valueString = "00513eb7-7d2a-495a-b3aa-c361b3f923a2"
* meta.extension[=].extension.extension[+].url = "matchedDate"
* meta.extension[=].extension.extension[=].valueDateTime = "2026-03-31T01:32:08.369+00:00"
* meta.extension[=].extension.extension[+].url = "matchedBy"
* meta.extension[=].extension.extension[=].valueString = "user"
* meta.extension[=].extension.extension[+].url = "matchedReason"
* meta.extension[=].extension.extension[=].valueCoding = #302 "Automatically matched by dose and indication"
* meta.versionId = "2"
* meta.lastUpdated = "2026-03-31T01:32:08.126+00:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* contained = 45c49168-bef8-4c22-8f37-fc13ec494594
* extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-extension"
* extension[=].valueReference = Reference(45c49168-bef8-4c22-8f37-fc13ec494594)
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"
* extension[=].extension[0].url = "years"
* extension[=].extension[=].valueInteger = 0
* extension[=].extension[+].url = "months"
* extension[=].extension[=].valueInteger = 1
* extension[=].extension[+].url = "days"
* extension[=].extension[=].valueInteger = 14
* extension[=].extension[+].url = "daysSinceBirth"
* extension[=].extension[=].valueInteger = 45
* extension[=].extension[+].url = "precision"
* extension[=].extension[=].valueString = "DAY"
* status = #completed
* statusReason = $air-status-reason-terms#GIVEN "Vaccination given"
* vaccineCode = $cvx#119 "RV1"
* vaccineCode.text = "RV1"
* patient = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZGY9681)
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZGY9681"
* occurrenceDateTime = "2024-03-02T00:00:00+00:00"
* location = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E)
* location.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* location.identifier.value = "FZZ835-E"
* lotNumber = "RV1-001"
* expirationDate = "2026-01-31"
* route = $air-terms-code#PO "Oral"
* performer.function = $air-terms-code#VC "Vaccinator"
* performer.actor = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/92ZZRR)
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer.actor.identifier.value = "92ZZRR"
* reasonCode = $air-terms-code#6W "6 weeks"
* protocolApplied.targetDisease = $sct#18624000 "Rotavirus"
* protocolApplied.doseNumberPositiveInt = 1

Instance: 45c49168-bef8-4c22-8f37-fc13ec494594
InstanceOf: RelatedPerson
Usage: #inline
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-prf"
* patient = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZGY9681)
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZGY9681"
* relationship = $v3-RoleCode#MTH
* name.family = "Compliance"
* name.given = "Air Test"
* telecom[0].system = #phone
* telecom[=].value = "047771234"
* telecom[=].use = #home
* telecom[+].system = #phone
* telecom[=].value = "0217771234"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "air@compliance.govt.nz"
* telecom[=].use = #home
* address.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* address.extension.valueString = "Thorndon"
* address.use = #home
* address.type = #physical
* address.line[0] = "3E 163 Thorndon Quay"
* address.line[+] = "Thorndon"
* address.city = "Wellington"
* address.postalCode = "6011"