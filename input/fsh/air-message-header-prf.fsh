Alias: $AllPartiesFlag = http://hl7.org.nz/fhir/StructureDefinition/all-parties-flag

Profile: AIRMessageHeader
Parent: MessageHeader
Id: air-message-header
Title: "AIR Message Header"
Description: "This profile derived from MessageHeader implements extensions to message header required for Immunisation event messaging."

* extension contains
	$AllPartiesFlag named AllPartiesFlag 0..1
	
* extension[AllPartiesFlag] ^short = "If true, indicates that message should be sent to all interested parties"