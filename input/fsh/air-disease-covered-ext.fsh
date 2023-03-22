Extension: DiseaseCovered
Id: air-disease-covered
Description: "The disease which a vaccine coveres. Needed in ActivityDefinition and ImmunizationRecommendation as the cardinality there is only single."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-disease-covered"

* ^context.type = #element
* ^context.expression = "ActivityDefinition"

* ^context[1].type = #element
* ^context[1].expression = "ImmunizationRecommendation.recommendation"

* value[x] only CodeableConcept
* valueCodeableConcept from air-disease-covered-code
