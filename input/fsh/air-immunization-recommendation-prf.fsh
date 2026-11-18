Profile:        AIRImmunizationRecommendation
Parent:         ImmunizationRecommendation
Id:             air-immunization-recommendation
Title:          "AIR Immunization Recommendation"
Description:    "AIR uses this ImmunizationRecommendation profile to communicate details of scheduled immunisation events in CarePlan/$view responses. Each recommendation represents one dose slot within a schedule."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-recommendation"
* insert StandardMetadata

* ^purpose = "To communicate details of a planned immunisation event. Planned events may be generated algorithmically based on a patient's characteristics, a published schedule and their immunisation history."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Individual Immunisation Plan</div>"

* identifier 1..*
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #closed
* identifier contains 
    plannedEvent 1..1 MS and
    plannedEventRecord 0..1
* identifier[plannedEvent].system = "https://standards.digital.health.nz/ns/air-planned-event-id"
* identifier[plannedEvent].use = #official
* identifier[plannedEvent].value 1..1 MS
* identifier[plannedEvent] ^short = "Stable identifier = {consumerId}-{scheduleType}-{seriesType}-{antigenGroupCode}-{doseNumber}-{eventType}. Unchanged when AIR cancels and recreates event of same type."
* identifier[plannedEventRecord].system = "https://standards.digital.health.nz/ns/air-planned-event-record-id"
* identifier[plannedEventRecord].use = #temp
* identifier[plannedEventRecord].value 1..1

* patient 1..1 MS
* patient only Reference(air-patient)
* patient ^short = "NHI identifier"

// removed authority per spec
* authority 0..0

* date 1..1 MS
* date ^short = "When the plan was calculated"

* recommendation 1..1

* recommendation.extension contains
    air-recommendation-id named id 1..1 and
    air-disease-covered named disease-covered 1..* and
    air-agvs named antigen-group 1..1 MS and
    air-scheduled-event named air-scheduled-event 1..1 MS

* recommendation.id 0..1
* recommendation.id ^short = "Not used; identifier carries the stable key"

* recommendation.vaccineCode from air-vaccine-product-code (preferred)

// removed because we have an extension that allows multiple target diseases
* recommendation.targetDisease 0..0

// removed per spec
* recommendation.contraindicatedVaccineCode 0..0

* recommendation.forecastStatus 1..1 MS
* recommendation.forecastStatus from air-forecast-status-code (preferred)
* recommendation.forecastStatus ^short = "Value set depends on event type: air-planned-event-status (CPE/PPE) or air-expected-event-status (EE)"

* recommendation.forecastReason from air-indication-code (preferred)
* recommendation.forecastReason ^short = "Vaccine recommendation indication and alternative indications"
* recommendation.forecastReason ^definition = "Array containing vaccine recommendation indication and alternative indications. Primary indication will be returned as the first element in the array, followed by any alternative indications."

// additional values will be needed here post-MVP
* recommendation.dateCriterion.code from air-planned-event-date-type-code (preferred)

* recommendation.doseNumber[x] 1..1 MS
* recommendation.doseNumber[x] only string

* recommendation.seriesDoses[x] 0..0

// removed for MVP
* recommendation.supportingImmunization 0..0

// removed for MVP
* recommendation.supportingPatientInformation 0..0
