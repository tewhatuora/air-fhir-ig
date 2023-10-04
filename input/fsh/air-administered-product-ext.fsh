Extension: AIRAdministeredProduct
Id: air-administered-product
Title: "AIR Administered Product Extension"
Description: "This extension to the AIR Immunization profile pre-adopts the FHIR R5 construct of the same name. In AIR, the (mandatory) vaccineCode element should be used to transmit a CVX or NZVX code for the vaccine, while the (optional) administeredProduct element should be used to transmit an NZMT TPUU code fot he vaccine."
Context: Immunization

* ^url = "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-administered-product"

* insert StandardMetadata 

* value[x] only CodeableConcept
* valueCodeableConcept from air-administered-product-code
 