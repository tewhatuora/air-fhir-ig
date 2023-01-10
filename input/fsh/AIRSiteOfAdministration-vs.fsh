ValueSet: AIRSiteOfAdministrationVS
Id: air-site-of-administration-vs
Title: "AIR Site of Administration Value Set"
Description: "Codes for Routes of Administration for use by the immunization programme"

* insert StandardMetadata

// Eventually it may make sense to trim this list down to only the ones we use. But then again, if we integrate across the sector we may need to be a bit more inclusive.

* include codes from system http://terminology.hl7.org/CodeSystem/v2-0162

// SNOMED Codes referenced by ISD/ISM on
// https://mohits.atlassian.net/wiki/spaces/NIS/pages/3365175358/ISD+and+ISM+Codesets#Vaccine-Code

* $SCT#16217701000119102 "Structure of left deltoid muscle"
* $SCT#1217007000 "Structure of left vastus lateralis muscle"
* $SCT#16217661000119109 "Structure of right deltoid muscle"
* $SCT#719631004 "Structure of body of left scapula"
* $SCT#719632006 "Structure of body of right scapula"
* $SCT#66480008 "Structure of left forearm"
* $SCT#64262003 "Structure of right forearm"
* $SCT#368208006 "Left upper arm structure"
* $SCT#368209003 "Right upper arm structure"
