Instance: AIRBundleCarePlanExample
InstanceOf: Bundle
Usage: #example
* type = #searchset
* link.relation = "self"
* link.url = "https://localhost:8443/fhir/R4/CarePlan/$view?_include=*&nhi=ZET7992"
* entry[0].fullUrl = "https://localhost:8443/fhir/R4/CarePlan/AGVS-Delay-3-6M-P-PCV13-1.0"
* entry[=].resource = AGVS-Delay-3-6M-P-PCV13-1.0
* entry[+].fullUrl = "https://localhost:8443/fhir/R4/ImmunizationRecommendation/AGVS-Delay-3-6M-P-PCV13-1.0-Dose1"
* entry[=].resource = AGVS-Delay-3-6M-P-PCV13-1.0-Dose1
* entry[+].fullUrl = "https://localhost:8443/fhir/R4/ImmunizationRecommendation/AGVS-Delay-3-6M-P-PCV13-1.0-Dose2"
* entry[=].resource = AGVS-Delay-3-6M-P-PCV13-1.0-Dose2
* entry[+].fullUrl = "https://localhost:8443/fhir/R4/Immunization/63e060f0-a878-4a8c-a432-6712d15b1266"
* entry[=].resource = 63e060f0-a878-4a8c-a432-6712d15b1266

Instance: AGVS-Delay-3-6M-P-PCV13-1.0
InstanceOf: CarePlan
Usage: #inline
* instantiatesCanonical = "https://localhost:8443/fhir/R4/AIRAGVSPlanDefinition/Delay-3-6M-P-PCV13-1.0"
* status = #active
* intent = #plan
* title = "PCV13 Immunisation Schedule for NHI ZET7992"
* description = "PCV13"
* subject = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZET7992)
* subject.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* subject.identifier.value = "ZET7992"
* period.start = "2023-11-11T13:00:00+13:00"
* created = "2023-12-30T13:00:00+13:00"
* activity[0].extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-activity-reference"
* activity[=].extension.valueReference = Reference(AGVS-Delay-3-6M-P-PCV13-1.0-Dose2)
* activity[+].extension.url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-performed-activity"
* activity[=].extension.valueReference = Reference(63e060f0-a878-4a8c-a432-6712d15b1266)

Instance: AGVS-Delay-3-6M-P-PCV13-1.0-Dose1
InstanceOf: ImmunizationRecommendation
Usage: #inline
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-recommendation"
* patient = Reference(Patient/ZET7992)
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZET7992"
* date = "2025-08-05T17:00:56+12:00"
* recommendation.id = "8d133802-f22f-49f8-9a38-565c494a7630"
* recommendation.extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-scheduled-event"
* recommendation.extension[=].extension.url = "type"
* recommendation.extension[=].extension.valueCoding = $AIRPEType#CPE
* recommendation.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-agvs"
* recommendation.extension[=].extension[0].url = "schedule-type"
* recommendation.extension[=].extension[=].valueCoding = $AIRAGVSType#DELAYED
* recommendation.extension[=].extension[+].url = "series-type"
* recommendation.extension[=].extension[=].valueCoding = $AIRSeriesType#PRIMARY
* recommendation.extension[=].extension[+].url = "antigen-group"
* recommendation.extension[=].extension[=].valueCoding = $SCT#1119254000 "PCV13"
* recommendation.extension[=].extension[+].url = "version"
* recommendation.extension[=].extension[=].valueString = "1.0"
* recommendation.vaccineCode = $CVX#133 "PCV13"
* recommendation.forecastStatus = $air-imm-rec-status#GIVEN
* recommendation.forecastReason = $AIRTerms#Stn "Funded, if not otherwise specified"
* recommendation.dateCriterion.code = $SCT#789539003 "Date immunization due"
* recommendation.dateCriterion.value = "2024-01-27"
* recommendation.series = "Delay 3-6M_P_PCV13_1.0"
* recommendation.doseNumberPositiveInt = 1

Instance: AGVS-Delay-3-6M-P-PCV13-1.0-Dose2
InstanceOf: ImmunizationRecommendation
Usage: #inline
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-recommendation"
* patient = Reference(Patient/ZET7992)
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZET7992"
* date = "2025-08-05T17:00:56+12:00"
* recommendation[0].id = "21cdd4fc-8fad-417f-aa36-e2916a77ce4c"
* recommendation[=].extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-scheduled-event"
* recommendation[=].extension[=].extension.url = "type"
* recommendation[=].extension[=].extension.valueCoding = $AIRPEType#CPE
* recommendation[=].extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-agvs"
* recommendation[=].extension[=].extension[0].url = "schedule-type"
* recommendation[=].extension[=].extension[=].valueCoding = $AIRAGVSType#DELAYED
* recommendation[=].extension[=].extension[+].url = "series-type"
* recommendation[=].extension[=].extension[=].valueCoding = $AIRSeriesType#PRIMARY
* recommendation[=].extension[=].extension[+].url = "antigen-group"
* recommendation[=].extension[=].extension[=].valueCoding = $SCT#1119254000 "PCV13"
* recommendation[=].extension[=].extension[+].url = "version"
* recommendation[=].extension[=].extension[=].valueString = "1.0"
* recommendation[=].vaccineCode = $CVX#133 "PCV13"
* recommendation[=].forecastStatus = $air-imm-rec-status#OVERDUE
* recommendation[=].forecastReason = $AIRTerms#Stn "Funded, if not otherwise specified"
* recommendation[=].dateCriterion.code = $SCT#789539003 "Date immunization due"
* recommendation[=].dateCriterion.value = "2024-03-23"
* recommendation[=].series = "Delay 3-6M_P_PCV13_1.0"
* recommendation[=].doseNumberPositiveInt = 2
* recommendation[+].id = "bf16e22b-a03a-4b3f-8d29-7d0c9b747f9f"
* recommendation[=].extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-scheduled-event"
* recommendation[=].extension[=].extension.url = "type"
* recommendation[=].extension[=].extension.valueCoding = $AIRPEType#EE
* recommendation[=].extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-agvs"
* recommendation[=].extension[=].extension[0].url = "schedule-type"
* recommendation[=].extension[=].extension[=].valueCoding = $AIRAGVSType#DELAYED
* recommendation[=].extension[=].extension[+].url = "series-type"
* recommendation[=].extension[=].extension[=].valueCoding = $AIRSeriesType#PRIMARY
* recommendation[=].extension[=].extension[+].url = "antigen-group"
* recommendation[=].extension[=].extension[=].valueCoding = $SCT#1119254000 "PCV13"
* recommendation[=].extension[=].extension[+].url = "version"
* recommendation[=].extension[=].extension[=].valueString = "1.0"
* recommendation[=].vaccineCode = $CVX#133 "PCV13"
* recommendation[=].forecastStatus = $air-imm-rec-status#ACTIVE
* recommendation[=].forecastReason = $AIRTerms#Stn "Funded, if not otherwise specified"
* recommendation[=].dateCriterion.code = $SCT#789539003 "Date immunization due"
* recommendation[=].dateCriterion.value = "2024-03-25"
* recommendation[=].series = "Delay 3-6M_P_PCV13_1.0"
* recommendation[=].doseNumberPositiveInt = 2

Instance: 63e060f0-a878-4a8c-a432-6712d15b1266
InstanceOf: Immunization
Usage: #inline
* meta.extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-source-system"
* meta.extension[=].valueString = "PipelinePostman"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by"
* meta.extension[=].valueString = "PipelinePostmanUser"
* meta.extension[+].url = "http://hl7.org/fhir/StructureDefinition/firstCreated"
* meta.extension[=].valueInstant = "2025-08-04T15:12:41.892+12:00"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by"
* meta.extension[=].valueString = "PipelinePostmanUser"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system"
* meta.extension[=].valueString = "PipelinePostman"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment"
* meta.extension[=].extension[0].url = "dqScore"
* meta.extension[=].extension[=].valueInteger = 100
* meta.extension[=].extension[+].url = "dqLastUpdated"
* meta.extension[=].extension[=].valueDateTime = "2025-08-04T15:12:42.729+12:00"
* meta.extension[=].extension[+].url = "dqStatus"
* meta.extension[=].extension[=].valueString = "P"
* meta.extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match"
* meta.extension[=].extension.url = "match"
* meta.extension[=].extension.extension[0].url = "plannedEventId"
* meta.extension[=].extension.extension[=].valueString = "8d133802-f22f-49f8-9a38-565c494a7630"
* meta.extension[=].extension.extension[+].url = "matchedDate"
* meta.extension[=].extension.extension[=].valueDateTime = "2025-08-04T15:12:43.304+12:00"
* meta.extension[=].extension.extension[+].url = "matchedBy"
* meta.extension[=].extension.extension[=].valueString = "PipelinePostmanUser"
* meta.extension[=].extension.extension[+].url = "matchedReason"
* meta.extension[=].extension.extension[=].valueCoding = #303 "Automatically matched by dose and alternative indication"
* meta.versionId = "1"
* meta.lastUpdated = "2025-08-04T15:12:41.892+12:00"
* meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
* contained[0].resourceType = "RelatedPerson"
* contained[=].id = "09c86dd5-64e9-414e-b97e-f6c2c1a4e65f"
* contained[=].meta.profile = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-prf"
* contained[=].patient.reference = "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZET7992"
* contained[=].patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* contained[=].patient.identifier.value = "ZET7992"
* contained[=].relationship = $v3RoleCode#FTH
* contained[=].name.family = "Doe"
* contained[=].name.given = "John Jon"
* contained[=].telecom[0].system = #phone
* contained[=].telecom[=].value = "041234567"
* contained[=].telecom[=].use = #home
* contained[=].telecom[+].system = #phone
* contained[=].telecom[=].value = "091234567"
* contained[=].telecom[=].use = #work
* contained[=].telecom[+].system = #email
* contained[=].telecom[=].value = "jodoe@moh.govt.nz"
* contained[=].telecom[=].use = #home
* contained[=].address.extension.url = "http://hl7.org.nz/fhir/StructureDefinition/suburb"
* contained[=].address.extension.valueString = "Johnsonville"
* contained[=].address.use = #home
* contained[=].address.type = #physical
* contained[=].address.line[0] = "123 Main St"
* contained[=].address.line[+] = "Neverland"
* contained[=].address.city = "Wellington"
* contained[=].address.postalCode = "6001"
* contained[+].resourceType = "Observation"
* contained[=].id = "045e4457-4b8d-4ae7-bbef-655f48576558"
* contained[=].status = #preliminary
* contained[=].code = $SCT#278969009 "Hepatitis B status"
* contained[=].effectiveDateTime = "2023-01-01T14:12:34.000+13:00"
* contained[=].interpretation = $serProt#IND "Indeterminate"
* extension[0].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent"
* extension[=].extension[0].url = "diluentLotNumber"
* extension[=].extension[=].valueString = "33332222"
* extension[=].extension[+].url = "diluentExpiryDate"
* extension[=].extension[=].valueDate = "2026-01-01"
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-extension"
* extension[=].valueReference = Reference(09c86dd5-64e9-414e-b97e-f6c2c1a4e65f)
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report-extension"
* extension[=].valueReference = Reference(045e4457-4b8d-4ae7-bbef-655f48576558)
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"
* extension[=].extension[0].url = "years"
* extension[=].extension[=].valueInteger = 0
* extension[=].extension[+].url = "months"
* extension[=].extension[=].valueInteger = 3
* extension[=].extension[+].url = "days"
* extension[=].extension[=].valueInteger = 30
* extension[=].extension[+].url = "daysSinceBirth"
* extension[=].extension[=].valueInteger = 121
* extension[=].extension[+].url = "precision"
* extension[=].extension[=].valueString = "DAY"
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-mobile-site"
* extension[=].valueString = "FZZ835-E_MOB0001"
* extension[+].url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-administered-product"
* extension[=].valueCodeableConcept = $NZMT#10443641000116108 "M-M-R-II"
* extension[=].valueCodeableConcept.text = "M-M-R-II"
* status = #completed
* statusReason = $AIRSR#GIVEN "Vaccination given"
* vaccineCode = $CVX#133 "PCV13"
* vaccineCode.text = "PCV"
* patient = Reference(https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZET7992)
* patient.identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* patient.identifier.value = "ZET7992"
* occurrenceDateTime = "2024-01-30"
* location = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E)
* location.identifier.system = "https://standards.digital.health.nz/ns/hpi-facility-id"
* location.identifier.value = "FZZ835-E"
* lotNumber = "555123"
* expirationDate = "2027-01-31"
* site.coding.version = "1.1"
* site.coding = $SCT#16217701000119102 "Structure of left deltoid muscle"
* route.coding.version = "1.2"
* route.coding = $SCT#78421000 "Intramuscular"
* performer.function.coding.version = "1.0.0"
* performer.function.coding = $AIRTerms#VC "Vaccinator"
* performer.actor = Reference(https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/477616)
* performer.actor.identifier.system = "https://standards.digital.health.nz/ns/nursing-council-id"
* performer.actor.identifier.value = "477616"
* reasonCode = $AIRTerms#5 "Primary course"
* protocolApplied.targetDisease = $SCT#16814004 "Pneumococcal"
* protocolApplied.doseNumberPositiveInt = 1