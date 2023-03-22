ValueSet: AIRSiteCode
Id: air-site-code
Title: "AIR Body Site Value Set"
Description: "Body sites value set for AIR immunisations"

* ^experimental = false

// * include codes from system http://terminology.hl7.org/CodeSystem/v2-0163

// the below list taken from NIR File Specification version 4.5 24 Sept 2020

/* 
* $v2Site#LD "Left Deltoid"
* $v2Site#LVL "Left Vastus Lateralis"
* $v2Site#RD "Right Deltoid"
* $v2Site#RVL "Right Vastus Lateralis"
* $v2Site#OTH "Other"
* $v2Site#LA "Left Arm"
* $v2Site#RA "Right Arm"
* $v2Site#LUA "Left Upper Arm"
* $v2Site#RUA "Right Upper Arm"
* $v2Site#LG "Left Gluteus Medius"
* $v2Site#RG "Right Gluteus Medius"
* $v2Site#LT "Left Thigh"
* $v2Site#LVG "Left Ventragluteal"
* $v2Site#RVG "Right Ventragluteal"
* $v2Site#BU "Buttock" 
*/

// The below list taken from ISD and ISM Codesets on https://mohits.atlassian.net/wiki/spaces/NIS/pages/3365175358/ISD+and+ISM+Codesets
// Note that this FHIR artifact requires the use of a correct SNOMED name although in some cases that's not what's displayed in the app.

* $SCT#16217701000119102 "Structure of left deltoid muscle"
* $SCT#1217007000 "Structure of left vastus lateralis muscle"
* $SCT#1217006009 "Structure of right vastus lateralis muscle"
* $SCT#16217661000119109 "Structure of left deltoid muscle"
* $SCT#719631004 "Structure of body of left scapula"
* $SCT#719632006 "Structure of body of right scapula"
* $SCT#66480008 "Left forearm"
* $SCT#64262003 "Right forearm"
* $SCT#368208006 "Left upper arm"
* $SCT#368209003 "Right upper arm"
