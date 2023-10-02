Profile:        AIRImmunizationRecommendation
Parent:         ImmunizationRecommendation
Id:             air-immunization-recommendation
Title:          "AIR Immunization Recommendation"
Description:    "AIR uses this immunizationRecommendation profile to communicate the details of planned events. The specification for this profile is available at https://mohits.atlassian.net/wiki/spaces/NIS/pages/3507781730/AIRImmunizationRecommendation+FHIR+API+into+ImmSOT."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-recommendation"
* insert StandardMetadata

* ^purpose = "To communicate. the details of a planned immunisation event. Planned events may be generated algorithmically based on a patient's characteristics and a published schedule or created by a health provider."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Individual Immunisation Plan</div>"

* identifier.system = "https://standards.digital.health.nz/ns/air-planned-immunisation-event-id" (exactly)

* patient only Reference(air-patient)

* recommendation.extension contains
    air-planned-event-identifier named event-identifier 1..1 and
    air-disease-covered named disease-covered 1..* and
    air-antigen-group named antigen-group 1..1 and
    air-planned-event-type-ext named planned-event-type 1..1 and
    air-planned-event-identifier named related-planned-event-identifier 0..1 and
    air-planned-event-identifier named provider-planned-event-identifier 0..1


* recommendation.vaccineCode from air-vaccine-product-code (preferred)

// removed because we have an extension that allows multiple target diseases
* recommendation.targetDisease 0..0

// removed per spec
* recommendation.contraindicatedVaccineCode 0..0

* recommendation.forecastStatus from air-forecast-status-code (preferred)

// additional values will be needed here post-MVP
* recommendation.dateCriterion.code = $SCT#789539003

* recommendation.doseNumber[x] only positiveInt

* recommendation.seriesDoses[x] only positiveInt

// removed for MVP
* recommendation.supportingImmunization 0..0

// removed for MVP
* recommendation.supportingPatientInformation 0..0
