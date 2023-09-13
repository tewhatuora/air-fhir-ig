Extension: AIRMobileSite
Id: air-mobile-site
Title: "Immunization Facility Mobile Site"
Description: "Immunization Facility Mobile Site"

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-mobile-site"

* ^context.type = #element
* ^context.expression = "Immunization"

* insert StandardMetadata 

* value[x] only string
* valueString 1..1