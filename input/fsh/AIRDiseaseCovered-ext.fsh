Extension: DiseaseCovered
Id: air-disease-covered
Description: "The disease which a vaccine coveres. Needed in ActivityDefinition and ImmunizationRecommendation as the cardinality there is only single."

// set status to draft
* ^status = #draft

* ^url = "http://standards.digital.health.nz/StructureDefinition/disease-covered"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context.type = #element
* ^context.expression = "ActivityDefinition"

* ^context[1].type = #element
* ^context[1].expression = "ImmunizationRecommendation.recommendation"

* value[x] only CodeableConcept
* valueCodeableConcept from air-disease-covered-code
