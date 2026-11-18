Profile: AIRCarePlanViewBundle
Parent: Bundle
Id: air-careplan-view-bundle
Title: "AIR CarePlan View Bundle"
Description: "Bundle profile for CarePlan/$view responses. Contains the consumer's immunisation schedule (CarePlan), scheduled events (ImmunizationRecommendation), and matched immunizations (Immunization)."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-careplan-view-bundle"

* type = #collection

* timestamp 1..1 MS
* timestamp ^short = "When the plan was calculated"

* total 0..0

* link 0..1
* link ^short = "Self link only"
* link.relation 1..1
* link.relation = "self"
* link.url 1..1

* entry 0..*
* entry ^short = "CarePlan, ImmunizationRecommendation, and Immunization resources"

* entry.fullUrl 1..1 MS
* entry.fullUrl ^short = "urn:uuid or absolute URL"

* entry.search 0..0
* entry.request 0..0
* entry.response 0..0

* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry contains
    carePlan 0..* and
    recommendation 0..* and
    immunization 0..*

* entry[carePlan].resource only AIRCarePlan
* entry[carePlan] ^short = "Consumer's assigned immunisation schedules (one per antigen group)"

* entry[recommendation].resource only AIRImmunizationRecommendation
* entry[recommendation] ^short = "Scheduled immunisation events"

* entry[immunization].resource only AIRImmunization
* entry[immunization] ^short = "Matched immunisations"

* meta.security 0..*
* meta.security ^short = "Contains REDACTED (v3-ObservationValue) only when consumer information is suppressed"
