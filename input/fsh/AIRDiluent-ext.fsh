Extension: AIRDiluent 
Id: air-diluent
Title: "Immunization Diluent"
Description: "Immunization Diluent"

* ^url = "https://standards.digital.health.nz/fhir/StructureDefinition/air-diluent"

// set status to draft
* ^status = #draft

* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* value[x] 0..0
* extension contains
  diluentLotNumber 0..1
    and diluentExpiryDate 0..1
* extension[diluentLotNumber].value[x] only string 
* extension[diluentExpiryDate].value[x] only date 
