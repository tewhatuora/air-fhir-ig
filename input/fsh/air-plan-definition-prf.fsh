Profile: AIRAGVSPlanDefinition
Id : air-agvs-plan-definition
Parent: PlanDefinition
Title: "Immunization Schedule Plan Definition"
Description: "Defines an immunization schedule with a series of doses, including custom extensions."

* insert StandardMetadata

// Core attributes for PlanDefinition
* id 1..1 MS
* name 1..1 MS
* version 1..1 MS
* status 1..1 MS
* effectivePeriod.start 1..1 MS
* effectivePeriod.end 1..1 MS

// Add Extension for AGVS metadata (schedule, trigger, antigen group)

* extension contains air-schedule-type-extension named schedule-type-extension 1..1
* extension contains air-series-type-extension named series-type-extension 1..1
* extension contains air-trigger-extension named trigger-extension 1..1
* extension contains air-antigen-group-extension named antigen-group-extension 0..1


// Actions (doses)
* action 1..*
* action.definitionCanonical 1..1
* action.definitionCanonical only Canonical(AIRDoseDefinition)

// Profile for ActivityDefinition ( Dose Recommendation)
Profile: AIRDoseDefinition
Id : air-dose-definition
Parent: ActivityDefinition
Title: "Immunization Dose Recommendation"
Description: "Defines a dose recommendation in an immunization schedule."

// Core attributes for ActivityDefinition (Dose)
* id 1..1 MS
* status 1..1 MS
* kind = #ImmunizationRecommendation (exactly)
* code 1..1

// TimingAge (generic - supports any timing)
* timingAge.system 1..1 MS
* timingAge.code 1..1 MS
* timingAge.value 1..1 MS

// Timing extension for generic timing (ISO8601 format)
* extension contains air-timingAge-ISO8601-extension named _timingAge 0..1


// Profile for Extension: Schedule Type Extension
Extension: air-schedule-type-extension
Parent: http://hl7.org/fhir/StructureDefinition/Extension
Title: "Schedule Type Extension"
Description: "Describes the schedule type used in AGVS."

* url 1..1 MS
* valueCoding.system 1..1 MS
* valueCoding.code 1..1 MS


// Profile for Extension: ISO8601 format
Extension: air-timingAge-ISO8601-extension
Parent: Extension
Title: "AIR Series Type Extension"
Description: "Describes the series type used in AGVS."
// Timing extension for generic timing (ISO8601 format)
* url 1..1 MS
* valueString 1..1 MS


// Profile for Extension: Series Type Extension
Extension: air-series-type-extension
Parent: Extension
Title: "AIR Series Type Extension"
Description: "Describes the series type used in AGVS."

* url 1..1 MS
* valueCoding.system 1..1 MS
* valueCoding.code 1..1 MS

// Profile for Extension: Trigger Extension
Extension: air-trigger-extension
Parent: Extension
Title: "AIR Trigger Extension"
Description: "Describes the trigger type used in AGVS."

* url 1..1 MS
* valueCoding.system 1..1 MS
* valueCoding.code 1..1 MS

// Profile for Extension: Antigen Group Extension
Extension: air-antigen-group-extension
Parent: Extension
Title: "AIR Antigen Group Extension"
Description: "Describes the antigen group used in AGVS."

* url 1..1 MS
* valueCoding.system 1..1 MS
* valueCoding.code 1..1 MS
* valueCoding.display 1..1 MS
