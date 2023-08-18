Profile:        AIRImmunizationRecommendation
Parent:         ImmunizationRecommendation
Id:             air-immunization-recommendation
Title:          "David Hay Style Immunization Recommendation"
Description:    "An immunizationRecommendation profile based on the blog posts by David Hay, see https://fhirblog.com/2021/03/26/fhir-enabling-an-immunization-registry/"

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization-recommendation"
* insert StandardMetadata

* ^purpose = "To form the base plan upon which individual immunization recommendations for a patient can be derived."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Individual Immunisation Plan</div>"

* recommendation.extension contains
    air-disease-covered named disease-covered 1..* 


