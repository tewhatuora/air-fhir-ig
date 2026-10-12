Profile: AIRCarePlan
Parent: CarePlan
Id: air-careplan
Title: "AIR CarePlan Profile"
Description: "This defines how a consumer’s assigned immunisation schedule is represented. Planned events are represented as ImmunizationRecommendation resources, indicating doses that are scheduled based on clinical guidelines and timing. Corresponding Immunization resources are linked to the relevant planned activity in the CarePlan."

* insert StandardMetadata

* id 1..1
* meta 0..1

// removed identifier per IMM-3123 - we applied the same here as we did for the ImmunizationRecomendation
* identifier 0..0

* instantiatesCanonical 0..1
* instantiatesCanonical only Canonical(air-agvs-plan-definition)
* status 1..1 MS
* intent 1..1 MS
* category 0..0
* title 0..1
* description 0..1
* subject 1..1
* subject only Reference(air-patient)
* period 0..1
* created 0..1

* activity 0..1

// Remove both detail and reference
* activity.detail 0..0
* activity.reference 0..0

// Remove unused optional elements
* activity.outcomeCodeableConcept  0..0
* activity.outcomeReference  0..0
* activity.progress  0..0

// Add extensions to link to Immunization and ImmunizationRecommendation
* activity.extension contains
  air-performed-activity-extension named performedActivity 0..1 and
  air-planned-activity-reference-extension named plannedActivityReference 0..1

