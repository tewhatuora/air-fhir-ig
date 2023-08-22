Extension: AIRRelatedPerson
Id: air-related-person
Title: "AIR Related Person"
Description: "This extension is to be used for communicating related person info in an AIR Immunisation Event. It holds the information transmitted in the HL7v2 NK1 segment."

* ^context.type = #element
* ^context.expression = "Immunization"

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person"

* insert StandardMetadata 

* value[x] only Reference(RelatedPerson)





/* * extension contains
    relatedPerson 0..*

* extension[relatedPerson].value[x] only Reference(RelatedPerson) 
 */