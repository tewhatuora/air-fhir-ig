Profile:        AIRImmunizationRecommendation
Parent:         ImmunizationRecommendation
Id:             air-immunization-recommendation
Title:          "AIR Immunization Recommendation"
Description:    "AIR uses this immunizationRecommendation profile to communicate the details of scheduled events. The specification for this profile is available at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3507781730/AIRImmunizationRecommendation+FHIR+API+into+ImmSOT."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-recommendation"
* insert StandardMetadata

* ^purpose = "To communicate. the details of a planned immunisation event. Planned events may be generated algorithmically based on a patient's characteristics and a published schedule or created by a health provider."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Individual Immunisation Plan</div>"

// removed identifier per IMM-3123
* identifier 0..0

* patient only Reference(air-patient)

// removed authority per spec
* authority 0..0

* recommendation.extension contains
    air-recommendation-id named id 1..1 and
    air-disease-covered named disease-covered 1..* and
    air-agvs named antigen-group 1..1 and
    air-scheduled-event named air-scheduled-event 1..1

* recommendation.id 1..1

* recommendation.vaccineCode from air-vaccine-product-code (preferred)

// removed because we have an extension that allows multiple target diseases
* recommendation.targetDisease 0..0

// removed per spec
* recommendation.contraindicatedVaccineCode 0..0

* recommendation.forecastStatus from air-forecast-status-code (preferred)

// additional values will be needed here post-MVP
* recommendation.dateCriterion.code from air-planned-event-date-type-code (preferred)

* recommendation.doseNumber[x] only string

* recommendation.seriesDoses[x] 0..0

// removed for MVP
* recommendation.supportingImmunization 0..0

// removed for MVP
* recommendation.supportingPatientInformation 0..0
