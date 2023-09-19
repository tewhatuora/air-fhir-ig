CodeSystem: AirConsumerState
Id: air-consumer-state
Title: "AIR Consumer State"
Description: "This is a code system for representing the current state of an AIR Patient (AKA Consumer)."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/air-consumer-state"

* ^experimental = false
* ^caseSensitive = false

* #ACTIVE "Active" "Consumer is active."
* #DECEASED "Deceased" "Consumer is deceased and a deceased date has been confirmed with NHI."
* #OVERSEAS "Overseas" "Consumer has been flagged as being overseas"
* #UNCONFIRMED_DECEASED "Unconfirmed deceased" "Consumer has been flagged as deceased but this has not yet been confirmed with NHI."