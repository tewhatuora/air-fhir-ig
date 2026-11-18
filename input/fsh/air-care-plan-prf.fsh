Profile: AIRCarePlan
Parent: CarePlan
Id: air-careplan
Title: "AIR CarePlan Profile"
Description: "This profile defines how a consumer's assigned immunisation schedule is represented in CarePlan/$view responses. Planned events are represented as ImmunizationRecommendation resources, indicating doses that are scheduled based on clinical guidelines and timing. Corresponding Immunization resources are linked to the relevant planned activity in the CarePlan via the performedActivity extension. Each CarePlan represents one antigen group schedule."

* insert StandardMetadata

* id 1..1
* meta 0..1
* contained 0..0

* identifier 1..* MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains careplanId 1..1
* identifier[careplanId].system = "https://standards.digital.health.nz/ns/air-careplan-id"
* identifier[careplanId].use = #official
* identifier[careplanId].value 1..1 MS
* identifier[careplanId] ^short = "Stable identifier = {consumerId}-{scheduleType}-{antigenGroupCode}. Never contains NHI."

* instantiatesUri 0..1
* instantiatesUri ^short = "Schedule definition URL (differs per environment)"

* status 1..1 MS
* intent = #plan
* category 1..1
* category = $SCT#734163000 "Care plan"

* title 0..1
* description 0..1
* subject 1..1 MS
* subject only Reference(air-patient)
* subject ^short = "NHI API URL plus NHI identifier"

* period 0..1
* created 0..1

* activity 0..* MS
* activity ^short = "One per active scheduled event (CPE, PPE, or EE)"

// Remove both detail and reference
* activity.detail 0..0
* activity.reference 0..0

// Remove unused optional elements
* activity.outcomeCodeableConcept  0..0
* activity.outcomeReference  0..0
* activity.progress  0..0

// Add extensions to link to Immunization and ImmunizationRecommendation
* activity.extension contains
  air-planned-activity-reference-extension named plannedActivityReference 1..1 MS and
  air-performed-activity-extension named performedActivity 0..* MS
* activity.extension[plannedActivityReference] ^short = "Reference to ImmunizationRecommendation (urn:uuid fullUrl)"
* activity.extension[performedActivity] ^short = "References to matched Immunizations (absolute fullUrl). Used only for planned events (CPE, PPE)."

