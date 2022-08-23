Profile:        AIRImmunizationRecommendation
Parent:         ImmunizationRecommendation
Id:             air-immunization-recommendation
Title:          "NZ Base Immunization Recommendation"
Description:    "An immunizationRecommendation derived from the NZ Base immunization PlanDefinition and applied to an invividual."

* ^url = "http://standards.digital.health.nz/fhir/StructureDefinition/paediatric-immunization-plan"
* insert StandardMetadata

* ^purpose = "To form the base plan upon which individual immunization recommendations for a patient can be derived."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Individual Immunisation Plan</div>"

* recommendation.extension contains
    air-disease-covered named disease-covered 1..* 


Instance: ir1
InstanceOf: AIRImmunizationRecommendation
Description: "An IR generated for a new born. Birth date 2021-01-01"
Usage: #example

* patient = Reference(pat)
* date = "2021-01-20"


//the recommendation for the 6 week DTaP-IPV-HepB/Hib vaccine
* recommendation[0].forecastStatus = $forecastStatus#due
* recommendation[0].vaccineCode =  $NZMT#29455411000116105 "DTaP-IPV-HepB/Hib" // MPUU [generic) for Infanrix Hexa 
* recommendation[0].series = "DTaP-IPV-HepB/Hib"
* recommendation[0].doseNumberPositiveInt = 1
* recommendation[0].dateCriterion.code = http://loinc.org#30980-7   "Date vaccine due"
* recommendation[0].dateCriterion.value = "2021-01-14"      //age 6 weeks

//the 'disease covered' extensions for the Infanrix vaccine
* recommendation[0].extension[air-disease-covered][0].valueCodeableConcept = $SCT#397428000 "Diphtheria"
* recommendation[0].extension[air-disease-covered][1].valueCodeableConcept = $SCT#76902006 "Tetanus"
* recommendation[0].extension[air-disease-covered][2].valueCodeableConcept = $SCT#27836007 "Pertussis"
* recommendation[0].extension[air-disease-covered][3].valueCodeableConcept = $SCT#398102009 "Poliomyelitis"
* recommendation[0].extension[air-disease-covered][4].valueCodeableConcept = $SCT#66071002 "Viral Hepatitis type B"
* recommendation[0].extension[air-disease-covered][5].valueCodeableConcept = $SCT#91428005 "Haemophilus influenzae infection"

//the recommendation for the 6 week PVC10
* recommendation[1].forecastStatus = $forecastStatus#due
* recommendation[1].vaccineCode =  $NZMT#31116301000116107 "PCV10" // MPUU (generic) for Synflorix
* recommendation[1].series = "pcv10"
* recommendation[1].doseNumberPositiveInt = 1
* recommendation[1].dateCriterion.code = http://loinc.org#30980-7   "Date vaccine due"
* recommendation[1].dateCriterion.value = "2021-01-14"      //age 6 weeks

//the 'disease covered' extensions for the Synflorix vaccine
* recommendation[1].extension[air-disease-covered][0].valueCodeableConcept = $SCT#16814004 "Pneumococcal disease"