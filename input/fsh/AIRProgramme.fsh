
// ======================== Activity Definitions
//One for each vaccine

Instance: adDtap
InstanceOf: AIRImmunizationAction
Description: "Administer DTap vaccine"
Usage: #example

* name = "AdDtap"
* url = "https://standards.digital.health.nz/fhir/StructureDefinition/addtap"
* title = "Administer DTap vaccine"
* status = #draft

* extension[air-disease-covered][0].valueCodeableConcept = $SCT#397428000 "Diphtheria"
* extension[air-disease-covered][1].valueCodeableConcept = $SCT#76902006 "Tetanus"
* extension[air-disease-covered][2].valueCodeableConcept = $SCT#27836007 "Pertussis"
* extension[air-disease-covered][3].valueCodeableConcept = $SCT#398102009 "Poliomyelitis"
* extension[air-disease-covered][4].valueCodeableConcept = $SCT#66071002 "Viral Hepatitis type B"
* extension[air-disease-covered][5].valueCodeableConcept = $SCT#91428005 "Haemophilus influenzae infection"

* productCodeableConcept = $NZMT#29455411000116105 // MPUU [generic) for Infanrix Hexa
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = $SCT#78421000 "Intramuscular route"


Instance: adPcv10
InstanceOf: AIRImmunizationAction
Description: "Administer PCV10 vaccine"
Usage: #example

* name = "AdPcv10"
* url = "https://standards.digital.health.nz/fhir/StructureDefinition/adpcv10"
* title = "Administer PCV10 vaccine"
* status = #draft

* extension[air-disease-covered][0].valueCodeableConcept = $SCT#16814004 "Pneumococcal disease"

* productCodeableConcept = $NZMT#31116301000116107 // MPUU (generic) for Synflorix
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = $SCT#78421000 "Intramuscular route"


Instance: adRv1
InstanceOf: AIRImmunizationAction
Description: "Administer RV1 vaccine"
Usage: #example

* name = "AdRv1"
* url = "https://standards.digital.health.nz/fhir/StructureDefinition/adrv1"
* title = "Administer RV1 vaccine"
* status = #draft

* extension[air-disease-covered][0].valueCodeableConcept = $SCT#18624000 "Rotavirus infection"

* productCodeableConcept = $NZMT#10598231000116107 // MPUU (generic) for Rotarix
* dosage.doseAndRate.doseQuantity = 1.5 'ml'
* dosage.route = $SCT#78421000 "Intramuscular route"

//----
Instance: adMmr
InstanceOf: AIRImmunizationAction
Description: "Administer MMR vaccine"
Usage: #example

* name = "AdMmr"
* url = "https://standards.digital.health.nz/fhir/StructureDefinition/admmr"
* title = "Administer MMR vaccine"
* status = #draft

* extension[air-disease-covered][0].valueCodeableConcept = $SCT#14189004 "Measles"
* extension[air-disease-covered][1].valueCodeableConcept = $SCT#36989005 "Mumps"
* extension[air-disease-covered][2].valueCodeableConcept = $SCT#36653000 "Rubella"

* productCodeableConcept = $NZMT#44016821000116107 // MPUU (generic) for Priorix
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = $SCT#78421000 "Intramuscular route"

Instance: adHib
InstanceOf: AIRImmunizationAction
Description: "Administer Hib vaccine"
Usage: #example

* name = "AdHib"
* url = "https://standards.digital.health.nz/fhir/StructureDefinition/adhib"
* title = "Administer Hib vaccine"
* status = #draft

* extension[air-disease-covered][0].valueCodeableConcept = $SCT#91428005 "Haemophilus influenzae infection"


* productCodeableConcept = $NZMT#10319211000116105 // MPUU (generic) for Hiberix
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = $SCT#78421000 "Intramuscular route"

Instance: adVv
InstanceOf: AIRImmunizationAction
Description: "Administer VV vaccine"
Usage: #example

* name = "AdVv"
* url = "https://standards.digital.health.nz/fhir/StructureDefinition/advv"
* title = "Administer VV vaccine"
* status = #draft

* extension[air-disease-covered][0].valueCodeableConcept = $SCT#38907003 "Varicella"

* productCodeableConcept = $NZMT#20006761000116105 // MPUU (generic) for Varivax
* dosage.doseAndRate.doseQuantity = 0.7 'ml'
* dosage.route = $SCT#78421000 "Intramuscular route"



//===================== Paed plan definition

Instance: pd2
InstanceOf: AIRImmunizationSchedule
Description: "Paediatric plan definition for children 15 months and younger"
Usage: #example

* name = "PdPaediatricPlan"
* status = #draft
* description = "The New Zealand Paediatric Immunization program"
* url = "http://standards.digital.health.nz/fhir/StructureDefinition/PlanDefinition/paediatric"

* goal.description.text = "Ensure child is immunized from childhood illnesses"
* relatedArtifact.type = #derived-from
* relatedArtifact.url = "https://www.health.govt.nz/our-work/immunisation-handbook-2020/national-immunisation-schedule"

//================

//--------- 6 weeks immunisation visit
* action[0].title = "6 week vaccinations"
* action[0].timingAge = 6 'wk'
* action[0].groupingBehavior = #logical-group
* action[0].selectionBehavior = #all 
* action[0].requiredBehavior = #must-unless-documented
* action[0].cardinalityBehavior = #single

// --- 6 week vaccines
* action[0].action[0].title = "DTap administration at 6 weeks"
* action[0].action[0].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/addtap"
* action[0].action[0].extension[air-vacc-sequence].extension[series].valueString = "DTaP-IPV-HepB/Hib"
* action[0].action[0].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 1

* action[0].action[1].title = "PCV10 administration at 6 weeks"
* action[0].action[1].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/adpcv10"
* action[0].action[1].extension[air-vacc-sequence].extension[series].valueString = "PCV10"
* action[0].action[1].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 1

* action[0].action[2].title = "RV1 administration at 6 weeks"
* action[0].action[2].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/adrv1"
* action[0].action[2].extension[air-vacc-sequence].extension[series].valueString = "RV1"
* action[0].action[2].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 1

// -------- 3 months immunisation visit
* action[1].title = "3 month vaccinations"
* action[1].timingAge = 3 'mo'
* action[1].groupingBehavior = #logical-group
* action[1].selectionBehavior = #all 
* action[1].requiredBehavior = #must-unless-documented
* action[1].cardinalityBehavior = #single

//3 month vaccines
* action[1].action[0].title = "DTap administration at 3 months"
* action[1].action[0].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/addtap"
* action[1].action[0].extension[air-vacc-sequence].extension[series].valueString = "DTaP-IPV-HepB/Hib"
* action[1].action[0].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 2

* action[1].action[1].title = "RV1 administration at 3 months"
* action[1].action[1].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/adrv1"
* action[1].action[1].extension[air-vacc-sequence].extension[series].valueString = "RV1"
* action[1].action[1].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 1

// -------- 5 months immunisation visit

* action[2].title = "5 month vaccinations"
* action[2].timingAge = 5 'mo'
* action[2].groupingBehavior = #logical-group
* action[2].selectionBehavior = #all 
* action[2].requiredBehavior = #must-unless-documented
* action[2].cardinalityBehavior = #single

//5 month vaccines
* action[2].action[0].title = "DTap administration at 5 months"
* action[2].action[0].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/addtap"
* action[2].action[0].extension[air-vacc-sequence].extension[series].valueString = "DTaP-IPV-HepB/Hib"
* action[2].action[0].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 3

* action[2].action[1].title = "PCV10 administration at 5 months"
* action[2].action[1].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/adpcv10"
* action[2].action[1].extension[air-vacc-sequence].extension[series].valueString = "PCV10"
* action[2].action[1].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 2

//-------- 12 months immunisation visit
* action[3].title = "12 month vaccinations"
* action[3].timingAge = 12 'mo'
* action[3].groupingBehavior = #logical-group
* action[3].selectionBehavior = #all 
* action[3].requiredBehavior = #must-unless-documented
* action[3].cardinalityBehavior = #single

// 12 month vaccines
* action[3].action[0].title = "PCV10 administration at 12 months"
* action[3].action[0].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/adpcv10"
* action[3].action[0].extension[air-vacc-sequence].extension[series].valueString = "PCV10"
* action[3].action[0].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 3

* action[3].action[0].title = "MMR administration at 12 months"
* action[3].action[0].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/admmr"
* action[3].action[0].extension[air-vacc-sequence].extension[series].valueString = "MMR"
* action[3].action[0].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 1

//-------- 15 months immunisation visit
* action[4].title = "15 month vaccinations"
* action[4].timingAge = 15 'mo'
* action[4].groupingBehavior = #logical-group
* action[4].selectionBehavior = #all 
* action[4].requiredBehavior = #must-unless-documented
* action[4].cardinalityBehavior = #single

//15 month vaccines
* action[4].action[0].title = "MMR administration at 15 months"
* action[4].action[0].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/admmr"
* action[4].action[0].extension[air-vacc-sequence].extension[series].valueString = "MMR"
* action[4].action[0].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 2

* action[4].action[1].title = "Hib administration at 15 months"
* action[4].action[1].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/adhib"
* action[4].action[1].extension[air-vacc-sequence].extension[series].valueString = "HIB"
* action[4].action[1].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 1

* action[4].action[2].title = "VV administration at 15 months"
* action[4].action[2].definitionCanonical = "https://standards.digital.health.nz/fhir/StructureDefinition/advv"
* action[4].action[2].extension[air-vacc-sequence].extension[series].valueString = "VV"
* action[4].action[2].extension[air-vacc-sequence].extension[sequence].valuePositiveInt = 1
