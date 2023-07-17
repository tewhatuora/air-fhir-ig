ValueSet: AIRSiteCode
Id: air-site-code
Title: "AIR Body Site Value Set"
Description: "Body sites value set for AIR immunisations"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code"

* ^experimental = false

// from http://terminology.hl7.org/CodeSystem/v2-0163
// the below list taken from NIR File Specification version 4.5 24 Sept 2020

* $AIRTerms#LD "Left Deltoid"
* $AIRTerms#LVL "Left Vastus Lateralis"
* $AIRTerms#RD "Right Deltoid"
* $AIRTerms#RVL "Right Vastus Lateralis"
* $AIRTerms#OTH "Other"
* $AIRTerms#LA "Left Arm"
* $AIRTerms#RA "Right Arm"
* $AIRTerms#LUA "Left Upper Arm"
* $AIRTerms#RUA "Right Upper Arm"
* $AIRTerms#LG "Left Gluteus Medius"
* $AIRTerms#RG "Right Gluteus Medius"
* $AIRTerms#LT "Left Thigh"
* $AIRTerms#RT "Right Thigh"
* $AIRTerms#LVG "Left Ventragluteal"
* $AIRTerms#RVG "Right Ventragluteal"
* $AIRTerms#BU "Buttock" 

// The below list taken from ISD and ISM Codesets on https://mohits.atlassian.net/wiki/spaces/NIS/pages/3365175358/ISD+and+ISM+Codesets
// Note that this FHIR artifact requires the use of a correct SNOMED name although in some cases that's not what's displayed in the app.

* $SCT#16217701000119102 "Structure of left deltoid muscle"
* $SCT#1217007000 "Structure of left vastus lateralis muscle"
* $SCT#1217006009 "Structure of right vastus lateralis muscle"
* $SCT#16217661000119109 "Structure of right deltoid muscle"
* $SCT#719631004 "Structure of body of left scapula"
* $SCT#719632006 "Structure of body of right scapula"
* $SCT#66480008 "Left forearm"
* $SCT#64262003 "Right forearm"
* $SCT#368208006 "Left upper arm"
* $SCT#368209003 "Right upper arm"
* $SCT#74964007 "Other"
