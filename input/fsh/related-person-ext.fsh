Extension: AIRRelatedPerson
Id: air-related-person
Title: "AIR Related Person"
Description: "This extension is to be used for communicating related person info in an AIR Immunisation Event. It holds the information transmitted in the HL7v2 NK1 segment."
Context: "Immunization"

* insert StandardMetadata 

* value[x] 0..0
* extension contains
    relatedPerson 0..*

* extension[relatedPerson].value[x] only Reference(RelatedPerson) 
