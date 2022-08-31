Profile:        AIRImmunizationAction
Parent:         ActivityDefinition
Id:             air-immunization-action
Title:          "NZ Base Immunization Vaccine Administration"
Description:    "The ActivityDefinition used by the New Zealand NZ Base immunization plan to describe a vaccine administration."

* ^url = "http://standards.digital.health.nz/fhir/StructureDefinition/immunization-action"

* insert StandardMetadata

* ^purpose = "To form the base plan upon which individual immunization recommendations for a patient can be derived."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Immunization activity</div>"

* extension contains
    air-disease-covered named diseaseCovered 0..*