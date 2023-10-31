Extension: DiseaseCovered
Id: air-disease-covered
Title: "AIR Disease Covered"
Description: "The disease which a vaccine covers. Needed in ImmunizationRecommendation as the cardinality there is only single."
Context: ImmunizationRecommendation.recommendation

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-disease-covered"

/* * ^context[0].type = #element
* ^context[1].expression = "ImmunizationRecommendation.recommendation"
 */
* value[x] only CodeableConcept
* valueCodeableConcept from air-disease-covered-code
