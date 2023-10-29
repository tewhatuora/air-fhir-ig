Instance: ir1
InstanceOf: AIRImmunizationRecommendation
Description: "Based on the David Hay approach. An IR generated for a new born. Birth date 2021-01-01."
Usage: #example

* patient = Reference(pat)
* date = "2021-01-20"



//the recommendation for the 6 week DTaP-IPV-HepB/Hib vaccine
* recommendation[0].id = "12345-asdf"
* recommendation[0].extension[air-recommendation-id].valueString = "12345"
* recommendation[0].forecastStatus = $forecastStatus#due
* recommendation[0].vaccineCode =  $NZMT#29455411000116105 "DTaP-IPV-HepB/Hib" // MPUU [generic) for Infanrix Hexa 
* recommendation[0].series = "DTaP-IPV-HepB/Hib"
* recommendation[0].doseNumberPositiveInt = 1
* recommendation[0].dateCriterion.value = "2021-01-14"      //age 6 weeks

//the 'disease covered' extensions for the Infanrix vaccine
* recommendation[0].extension[air-disease-covered][0].valueCodeableConcept = $SCT#397428000 "Diphtheria"
* recommendation[0].extension[air-disease-covered][1].valueCodeableConcept = $SCT#76902006 "Tetanus"
* recommendation[0].extension[air-disease-covered][2].valueCodeableConcept = $SCT#27836007 "Pertussis"
* recommendation[0].extension[air-disease-covered][3].valueCodeableConcept = $SCT#398102009 "Poliomyelitis"
* recommendation[0].extension[air-disease-covered][4].valueCodeableConcept = $SCT#66071002 "Viral Hepatitis type B"
* recommendation[0].extension[air-disease-covered][5].valueCodeableConcept = $SCT#91428005 "Haemophilus influenzae infection"

// the antigen group for the Infanrix vaccine
* recommendation[0].extension[antigen-group][0].valueString = "DTaP-IPV-HepB-Hib"

// the planned event type for the Infanrix vaccine
* recommendation[0].extension[pe-type][0].valueCodeableConcept = $AIRPEType#CPE


/*


//the recommendation for the 6 week PVC10
* recommendation[1].extension[id].valueString = "67890"
* recommendation[1].forecastStatus = $forecastStatus#due
* recommendation[1].vaccineCode =  $NZMT#31116301000116107 "PCV10" // MPUU (generic) for Synflorix
* recommendation[1].series = "pcv10"
* recommendation[1].doseNumberPositiveInt = 1
* recommendation[1].dateCriterion.value = "2021-01-14"      //age 6 weeks

//the 'disease covered' extensions for the Synflorix vaccine
* recommendation[1].extension[air-disease-covered][0].valueCodeableConcept = $SCT#16814004 "Pneumococcal disease"

// the antigen group for the Synflorix vaccine
* recommendation[1].extension[antigen-group][0].valueString = "PCV"

// the planned event type for the Synflorix vaccine
* recommendation[1].extension[planned-event-type][0].valueCodeableConcept = $AIRPEType#CPE


*/