Extension: AIRDiluent 
Id: air-diluent
Title: "Immunization Diluent"
Description: "Immunization Diluent"

* ^url = "https://standards.digital.health.nz/fhir/StructureDefinition/air-diluent"

* insert StandardMetadata 


* value[x] 0..0
* extension contains
    diluentName 1..1
    and diluentLotNumber 0..1
    and diluentExpiryDate 0..1
* extension[diluentName].value[x] only string 
* extension[diluentLotNumber].value[x] only string 
* extension[diluentExpiryDate].value[x] only date 
