Profile: AIRCarePlan
Parent: CarePlan
Id: air-careplan
Title: "AIR CarePlan Profile"
Description: "The FHIR CarePlan resource is used as a structured representation of a consumer’s assigned immunisation schedule, supporting the coordination, tracking, and delivery of vaccinations across various antigen groups. Within the immunisation domain, each CarePlan defines a specific Antigen Group Vaccination (AGV) schedule for an individual and organizes all related vaccination activities into a coherent and accessible format.              In this context, the CarePlan serves as a central framework that brings together planned immunisation events and their corresponding recorded vaccine administrations. Planned events are represented using ImmunizationRecommendation resources, indicating doses that are scheduled based on clinical guidelines and timing. When a vaccine dose is administered, the corresponding Immunization resource is linked back to the relevant planned activity in the CarePlan. This approach ensures that each vaccination event is traceable and that care delivery is aligned with national immunisation protocols.              Each CarePlan acts as a living record of a consumer's immunisation journey for a particular antigen group, capturing past, present, and future planned doses. The activities within the CarePlan are typically ordered by due date, offering a clear and chronological view of the vaccination schedule. This helps healthcare providers monitor compliance, identify overdue or upcoming vaccinations, and coordinate follow-up actions.              Additionally, the CarePlan supports automation and interoperability. When a consumer is onboarded into the immunisation system, relevant AGV schedules are automatically assigned, and CarePlans are created to reflect the full scope of required vaccinations.This profile on the FHIR R4 CarePlan resource adds two extensions from the R5+ CarePlan to more easily represent Immunization and ImmunizationRecommendation links, and to be better aligned with the future direction of FHIR."

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

