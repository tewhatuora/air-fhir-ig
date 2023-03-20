ValueSet: AIRReasonCodeVS
Id: air-reason-code-vs
Title: "AIR Reason Code Value Set"
Description: "Codes that are used for an Immunization ReasonCode. Started with values from ISD/ISM reason code table and NIR Task Type (aka Indication)."

* insert StandardMetadata

// NIR Indication codes
* include codes from system air-reason-code-cs

// SNOMED codes used by ISD/ISM

* $SCT#161651000210107 "Publicly funded vaccination given for 65 years of age or older"
* $SCT#161641000210109 "Publicly funded vaccination given due to medical condition included in criteria list"
* $SCT#161631000210101 "Publicly funded vaccination given due to pregnancy"
* $SCT#161801000210105 "Publicly funded vaccination given for child four years of age or under due to history of hospitalisation with respiratory condition"
* $SCT#161811000210107 "Privately funded vaccination given"
* $SCT#161791000210106 "Publicly funded vaccination given to Māori and Pacific people aged 55 to 64 years of age"

// The following two codes have been assigned but are not yet published by SNOMED
// As of 10 Jan 2023
// * $SCT#231731000210103 "Child Aged 3-12"
// * $SCT#231741000210106 "Serious mental health or addiction"