CodeSystem: AIRProcessingTerms
Id: air-processing-terms
Title: "AIR Processing Terms"
Description: "This Code System contains meta tags that AIR uses to signal processing outcomes"

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/air-processing-terms"

* ^experimental = false
* ^caseSensitive = false

* #patient-identifier-immutable "Patient identifier not updated - identifier is immutable for this operation" "The Patient Identifier (NHI number) submitted in the request differed from the identifier stored on the record. The existing identifier has been preserved and was not updated through this operation."
* #exact-duplicate-not-created "Record already exists" "The submitted immunisation record matches an existing record held in AIR. No new record was created and the existing record has been returned."
