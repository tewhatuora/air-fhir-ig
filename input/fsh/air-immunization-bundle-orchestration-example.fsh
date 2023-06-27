Instance: AIRBundleOrchestrationExample
InstanceOf: Bundle
Title: "AIR Orchestration Service Immunisation Bundle Example"
Description: "This is an example of a how multiple immunisation records will be returned from the Orchestration Service, which receives a payload from ImmSoT and adds a MessageHeader resource and additional data from the NHI, HPI and other services. "
Usage: #example
* type = #message
* link.relation = "self"
* link.url = "https://standards.digital.health.nz/fhir/air/Immunization?_include=*&patient=ZAA0792"

* entry[0].resource = OrchestrationBundleMessageHeader
* entry[=].fullUrl = "https://standards.digital.health.nz/fhir/air/MH1234"

* entry[+].resource = ImmSoTImmunizationExampleForOrchBundle-1
* entry[=].search.mode = #match
* entry[=].fullUrl = "https://standards.digital.health.nz/fhir/air/imm-example-for-bundle-orch-1"

* entry[+].resource = ImmSoTImmunizationExampleForOrchBundle-2
* entry[=].search.mode = #match
* entry[=].fullUrl = "https://standards.digital.health.nz/fhir/air/imm-example-for-bundle-orch-2"

* entry[+].resource = ZAA0792 // Patient NHI Patient
* entry[=].search.mode = #include
* entry[=].fullUrl = "https://nhi-ig.hip.digital.health.nz/patient/ZAA0792"

* entry[+].resource = 1112139 // Location ESAM Location
* entry[=].search.mode = #include
* entry[=].fullUrl = "https://esamServiceURL/1112139"

* entry[+].resource =  FZZ958-K // Location HPI Location
* entry[=].search.mode = #include
* entry[=].fullUrl = "https://hpi-ig.hip.digital.health.nz/location/FZZ958-K"

* entry[+].resource = GZZ956-B // Organization HPI Organization
* entry[=].search.mode = #include
* entry[=].fullUrl = "https://hpi-ig.hip.digital.health.nz/organization/GZZ956-B"


Instance: OrchestrationBundleMessageHeader
InstanceOf: MessageHeader
Usage: #example
Title: "Orchestration Bundle MessageHeader"
Description: "This is an example of the MessageHeader resource that will be included in Immunisation bundle payloads sent by the Orchestration service to the Broker Service."

* meta.tag.code = #N
* meta.tag.system = "http://terminology.hl7.org/CodeSystem/v2-0103"
* source.endpoint = "https://digital.health.nz/orchestrationService"

// In my mind, this identifies who is sending this bundle
// but HL wants to keep the original PMS EDI message info in here
// if we need all that, I guess it's an extension
// the big question... where do we maintain state???
// the EDI system is http://hl7.org.nz/fhir/StructureDefinition/edi-address
* sender.identifier.system = "https://standards.digital.health.nz/healthlink.net/endpoint"
* sender.identifier.value = "broker-service"

* destination.name = "HealthLink"
* destination.endpoint = "Broker"
* destination.receiver = Reference(https://healthlink.net/healthlink-broker-service)

* eventCoding = http://terminology.hl7.org/CodeSystem/v2-0003#V04

* contained[0].resourceType = "Organization"
* contained[=].id = "https://healthlink.net/immsot-orchestration-service"
* contained[=].identifier.system = "http://hl7.org.nz/fhir/StructureDefinition/edi-address"
* contained[=].identifier.value = "fhirorch"


Instance: ImmSoTImmunizationExampleForOrchBundle-1
InstanceOf: Immunization
Usage: #example
Title: "AIR Immunization Example 1"
Description: "An example of an AIR v2 immunization resource, using an ESAM identifier for the location. "

* id = "imm-example-for-bundle-orch-1"
* meta.versionId = "null"
* meta.lastUpdated = "2023-03-01T16:45:46.781+13:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"

* extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"

* status = #completed

* statusReason.coding = http://snomed.info/sct#127785005

* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#03
* vaccineCode.text = "Measles, Mumps, Rubella"

* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"

* occurrenceDateTime = "2023-03-01T16:45:46+13:00"

* location.identifier.use = #official
* location.identifier.system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* location.identifier.value = "1112139"

* site.coding = http://snomed.info/sct#16217701000119102

* route.coding = http://snomed.info/sct#54471007

* performer.function = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer.actor.identifier.value = "90ZZLP"
* performer.actor.identifier.assigner = Reference(https://standards.digital.health.nz/ns/hpi-organisation-id/G00001-G)

* reasonCode = http://snomed.info/sct#161651000210107

* protocolApplied.doseNumberPositiveInt = 1

Instance: ImmSoTImmunizationExampleForOrchBundle-2
InstanceOf: Immunization
Usage: #example
Title: "AIR Immunization Example 2"
Description: "An example of an AIR v2 immunization resource, with an HPI-O location specified."

* id = "imm-example-for-bundle-orch-2"
* meta.versionId = "null"
* meta.lastUpdated = "2023-03-01T16:45:46.781+13:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"

* extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension.extension[0].url = "diluentLotNumber"
* extension.extension[=].valueString = "33332222"
* extension.extension[+].url = "diluentExpiryDate"
* extension.extension[=].valueDate = "2026-01-01"

* status = #completed

* statusReason.coding = http://snomed.info/sct#127785005

* vaccineCode.coding = http://hl7.org/fhir/sid/cvx#03
* vaccineCode.text = "Measles, Mumps, Rubella"

* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZAA0792"

* occurrenceDateTime = "2023-03-01T16:45:46+13:00"

* location.identifier[0].use = #official
* location.identifier[=].system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* location.identifier[=].value = "FZZ958-K"

* site.coding = http://snomed.info/sct#16217701000119102

* route.coding = http://snomed.info/sct#54471007

* performer.function = https://standards.digital.health.nz/fhir/air/StructureDefinition/air-terms#VC
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* performer.actor.identifier.value = "90ZZLP"
* performer.actor.identifier.assigner = Reference(https://standards.digital.health.nz/ns/hpi-organisation-id/G00001-G)

* reasonCode = http://snomed.info/sct#161651000210107

* protocolApplied.doseNumberPositiveInt = 1


Instance: ZAA0792
InstanceOf: Patient
Usage: #example
Title: "Immunization Patient 1"
Description: "Sample patient from NHI examples. Based on the patient reference in the ImmSoT immunisation, this info is retrieved from NHI by the Orchestration service and added to the bundle."

* meta.versionId = "3368251"
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/NhiPatient"
* extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-ethnicity"
* extension[=].valueCodeableConcept.coding.version = "2.0"
* extension[=].valueCodeableConcept.coding = $ethnic-group-level-4-code#11111 "New Zealand European"
* extension[=].valueCodeableConcept.text = "New Zealand European"
* extension[+].extension.url = "status"
* extension[=].extension.valueCodeableConcept.coding.version = "1.0.0"
* extension[=].extension.valueCodeableConcept.coding = $nz-citizenship-status-code#unknown "The citizenship status is unknown"
* extension[=].extension.valueCodeableConcept.text = "The citizenship status is unknown"
* extension[=].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-citizenship"
* extension[+].extension[0].url = "source"
* extension[=].extension[=].valueCodeableConcept.coding.version = "1.0.0"
* extension[=].extension[=].valueCodeableConcept.coding = $information-source-code#HL7 "HL7 applied"
* extension[=].extension[=].valueCodeableConcept.text = "HL7 applied"
* extension[=].extension[+].url = "status"
* extension[=].extension[=].valueCodeableConcept.coding.version = "1.0.0"
* extension[=].extension[=].valueCodeableConcept.coding = $nz-residency-code#yes "Permanent Resident"
* extension[=].extension[=].valueCodeableConcept.text = "Permanent Resident"
* extension[=].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-residency"
* identifier[0].use = #official
* identifier[=].system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier[=].value = "ZAA0792"
* identifier[=].assigner = Reference(Organization/G00001-G)
* identifier[+].use = #old
* identifier[=].system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier[=].value = "ZAA0806"
* identifier[=].assigner = Reference(Organization/G00001-G)
* name.id = "5"
* name.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-preferred"
* name.extension.valueBoolean = true
* name.family = "NEWMUM"
* name.given = "BABY OF TESTING"
* gender = #female
* birthDate = "2015-09-09"
* birthDate.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/information-source"
* birthDate.extension.valueCodeableConcept.coding.version = "1.0.0"
* birthDate.extension.valueCodeableConcept.coding = $information-source-code#HL7 "HL7 applied"
* birthDate.extension.valueCodeableConcept.text = "HL7 applied"
* address[0].id = "17"
* address[=].extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/not-validated-address-reason"
* address[=].extension[=].valueCodeableConcept.coding.version = "1.1"
* address[=].extension[=].valueCodeableConcept.coding = $address-not-validated-reason-code#OSEA "Overseas Address"
* address[=].extension[=].valueCodeableConcept.text = "Overseas Address"
* address[=].extension[+].url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* address[=].extension[=].valueString = "Moutsamoudou"
* address[=].use = #home
* address[=].type = #physical
* address[=].line = "Rue Mtsangani"
* address[=].city = "Bandrele "
* address[=].postalCode = "0606"
* address[+].id = "18"
* address[=].extension[0].url = "http://hl7.org.nz/fhir/StructureDefinition/nz-address-id"
* address[=].extension[=].valueString = "3571798"
* address[=].extension[+].url = "http://hl7.org.nz/fhir/StructureDefinition/domicile-code"
* address[=].extension[=].valueCodeableConcept = $domicile-code#0504 "Auckland Harbourside"
* address[=].extension[=].valueCodeableConcept.text = "Auckland Harbourside"
* address[=].extension[+].url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* address[=].extension[=].valueString = "Auckland Central"
* address[=].use = #home
* address[=].type = #postal
* address[=].line = "147 Quay Street"
* address[=].city = "Auckland"
* address[=].postalCode = "1010"
* address[=].country = "NZ"


Instance: 1112139
InstanceOf: Location
Usage: #example
Title: "Example ESAM location 1112139"
Description: "This is an example of a location that is identified by its ESAM ID. It is provided by ImmSoT as a stand-alone resource to facilitate the inclusion of Managing Organization data."
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-location"
* identifier[0].use = #official
* identifier[=].system = "https://hl7.org.nz/fhir/StructureDefinition/esam-id"
* identifier[=].value = "1112139"
* managingOrganization = Reference(GZZ956-B)


Instance: FZZ958-K
InstanceOf: Location
Usage: #example
Title: "Example HPI Location FZZ958-K"
Description: "This is an example of a location that is identified by its HPI-F id. Based on the location reference in the ImmSoT immunization, this info is retrieved from HPI by the Orchestration service and added to the bundle."

* meta.versionId = "10803"
* meta.lastUpdated = "2022-11-09T12:00:14.000+13:00"
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/HPILocation"
* extension.url = "http://hl7.org.nz/fhir/StructureDefinition/established"
* extension.valuePeriod.start = "1980-12-12"
* identifier[0].use = #official
* identifier[=].system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* identifier[=].value = "FZZ958-K"
* identifier[=].assigner = Reference(Organization/G00001-G)
* identifier[+].use = #official
* identifier[=].system = "https://standards.digital.health.nz/ns/nzhis-facility-id"
* identifier[=].value = "9987"
* identifier[=].assigner = Reference(Organization/G00001-G)
* status = #active
* name = "Medical Centre Flat-Unit"
* alias = "Medical Centre Flat-Unit"
* alias.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/alias-type"
* alias.extension.valueCodeableConcept.coding.version = "1.0.0"
* alias.extension.valueCodeableConcept.coding = $alias-type-code#current "Current unverified or unofficial name"
* alias.extension.valueCodeableConcept.text = "Current unverified or unofficial name"
* type.coding.version = "1.0"
* type.coding = $location-type-code#gpenrol "Enrolling GP Practice"
* telecom[0].system = #phone
* telecom[=].value = "021 555558"
* telecom[=].use = #temp
* telecom[=].rank = 1
* telecom[=].period.start = "1980-12-12"
* telecom[+].system = #phone
* telecom[=].value = "021 464646"
* telecom[=].use = #work
* telecom[=].rank = 1
* telecom[=].period.start = "1980-12-12"
* address.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* address.extension.valueString = "Wellington 6011"
* address.use = #work
* address.type = #physical
* address.text = "2C/123 Molesworth Street, Thorndon, Wellington 6011"
* address.line[0] = "Thorndon"
* address.line[+] = "2C/123 Molesworth Street"
* managingOrganization = Reference(Organization/GZZ956-B) "Flat-Unit Address Org"

Instance: GZZ956-B
InstanceOf: Organization
Usage: #example
Title: "Immunization Organization 1"
Description: "Sample Organization from HPI Organization examples. Based on the managingOrganization reference in the ImmSoT immunization.location, this info is retrieved from HPI by the Orchestration service and added to the bundle."

* meta.versionId = "8910"
* meta.lastUpdated = "2022-04-05T15:04:16.000+12:00"
* meta.profile = "http://hl7.org.nz/fhir/StructureDefinition/HPIOrganization"
* extension.url = "http://hl7.org.nz/fhir/StructureDefinition/established"
* extension.valuePeriod.start = "2018-05-20"
* identifier[0].use = #official
* identifier[=].system = "https://standards.digital.health.nz/ns/hpi-organisation-id"
* identifier[=].value = "GZZ956-B"
* identifier[=].assigner = Reference(Organization/G00001-G)
* identifier[+].use = #official
* identifier[=].system = "https://standards.digital.health.nz/ns/hpi-nzbn"
* identifier[=].value = "9999999999041"
* identifier[=].assigner = Reference(Organization/MBIE)
* active = true
* type.coding.version = "1.1"
* type.coding = $organisation-type-code#999 "Other"
* name = "Flat-Unit Address Org"
* alias = "Flat-Unit Address Org"
* alias.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/alias-type"
* alias.extension.valueCodeableConcept.coding.version = "1.0.0"
* alias.extension.valueCodeableConcept.coding = $alias-type-code#legal "Legal"
* alias.extension.valueCodeableConcept.text = "Legal"
* telecom.system = #phone
* telecom.value = "021 101010"
* telecom.use = #work
* telecom.rank = 1
* telecom.period.start = "1970-01-01"
