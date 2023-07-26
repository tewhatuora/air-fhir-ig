Extension: AIRAgeGiven
Id: air-age-given
Title: "AIR Age Given Extension"
Description: "This extension calculates the patient age when a vaccination was administered. Although this could be calculated by the client based on patient date of birth, it is provided as a convenience."

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given"

* ^context.type = #element
* ^context.expression = "Immunization"

* insert StandardMetadata 

* value[x] 0..0
* extension contains
    years 0..1
    and months 0..1
    and days 0..1
    and daysSinceBirth 0..1
    and precision 0..1

* extension[years].value[x] only integer
* extension[months].value[x] only integer
* extension[days].value[x] only integer
* extension[daysSinceBirth].value[x] only integer
* extension[precision].value[x] only string
