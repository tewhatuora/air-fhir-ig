ValueSet: AIRRelatedPersonRelationshipCode
Id: air-related-person-relationship-code
Title: "AIR Related Person Relationship Code"
Description: "This value set is used to encode the relationship of a related person to the vaccine consumer. It is a subset of the FHIR Patient Relationship Type value set and includes some customised codes and displays for NZ usage."

* ^experimental = false

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-related-person-relationship-code"

* insert StandardMetadata

* $v3RoleCode#MTH
* $v3RoleCode#FTH
* $v3RoleCode#SIS
* $v3RoleCode#BRO
* $v3RoleCode#SON "son"
* $v3RoleCode#DAU "daughter"
* $v3RoleCode#UNCLE
* $v3RoleCode#AUNT
* $v3RoleCode#NEPHEW
* $v3RoleCode#NIECE
* $v3RoleCode#COUSN
* $v3RoleCode#GRFTH
* $v3RoleCode#GRMTH
* $v2ContactRole#E
* $v2ContactRole#O
* $v3RoleCode#SPS
* $v3RoleCode#FTHFOST
* $v3RoleCode#MTHFOST
* $v3RoleCode#STPFTH
* $v3RoleCode#STPMTH

// added 29 feb 2023 for IMM-4211
* $v3RoleCode#GUARD "guardian"
* $v3RoleCode#PRN "parent"

* $AIRTerms#WHANGAI "whāngai"
