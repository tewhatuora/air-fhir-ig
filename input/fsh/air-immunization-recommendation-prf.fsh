Profile:        AIRImmunizationRecommendation
Parent:         ImmunizationRecommendation
Id:             air-immunization-recommendation
Title:          "AIR Immunization Recommendation"
Description:    "AIR uses this immunizationRecommendation profile to communicate the details of scheduled events."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-recommendation"
* insert StandardMetadata

* ^purpose = "To communicate details of a planned immunisation event. Planned events may be generated algorithmically based on a patient's characteristics, a published schedule and their immunisation history."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Individual Immunisation Plan</div>"

* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains 
    plannedEvent 1..1 and
    plannedEventRecord 0..1
* identifier[plannedEvent].system = "https://standards.digital.health.nz/ns/air-planned-event-id"
* identifier[plannedEvent].use = #official
* identifier[plannedEvent].value 1..1
* identifier[plannedEventRecord].system = "https://standards.digital.health.nz/ns/air-planned-event-record-id"
* identifier[plannedEventRecord].use = #temp
* identifier[plannedEventRecord].value 1..1

* patient only Reference(air-patient)

// removed authority per spec
* authority 0..0

* recommendation 1..1

* recommendation.extension contains
    air-recommendation-id named id 1..1 and
    air-disease-covered named disease-covered 1..* and
    air-agvs named antigen-group 1..1 and
    air-scheduled-event named air-scheduled-event 1..1

* recommendation.id 0..1

* recommendation.vaccineCode from air-vaccine-product-code (preferred)

// removed because we have an extension that allows multiple target diseases
* recommendation.targetDisease 0..0

// removed per spec
* recommendation.contraindicatedVaccineCode 0..0

* recommendation.forecastStatus from air-forecast-status-code (preferred)

* recommendation.forecastReason from air-indication-code (preferred)
* recommendation.forecastReason ^short = "Vaccine recommendation indication and alternative indications"
* recommendation.forecastReason ^definition = "Array containing vaccine recommendation indication and alternative indications. Primary indication will be returned as the first element in the array, followed by any alternative indications."

// additional values will be needed here post-MVP
* recommendation.dateCriterion.code from air-planned-event-date-type-code (preferred)

* recommendation.doseNumber[x] only string

* recommendation.seriesDoses[x] 0..0

// removed for MVP
* recommendation.supportingImmunization 0..0

// removed for MVP
* recommendation.supportingPatientInformation 0..0
