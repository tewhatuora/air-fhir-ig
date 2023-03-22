Profile:        AIRImmunizationSchedule
Parent:         PlanDefinition
Id:             air-immunization-schedule
Title:          "NZ Base Immunisation Schedule"
Description:    "The PlanDefinition that defines the New Zealand Base Immunisation Schedule (along with associated ActionDefinitions). Based on the 2020 Imms Handbook which can be found here: https://standards.digital.health.nz/fhir/StructureDefinition/"

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-schedule"
* insert StandardMetadata

* ^purpose = "To form the base plan upon which individual immunization recommendations for a patient can be derived."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Immunization plan</div>"

* action.extension contains
    air-vacc-sequence named vacc-sequence 0..1 