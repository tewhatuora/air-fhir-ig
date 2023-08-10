Alias: $ImmunisationNotificationAction = http://hl7.org.nz/fhir/StructureDefinition/air-immunisation-notification-action

Profile: AIRMessageHeader
Parent: MessageHeader
Id: air-message-header
Title: "AIR Message Header"
Description: "This profile derived from MessageHeader implements extensions to message header required for Immunisation event messaging."

* extension contains
	$ImmunisationNotificationAction named ImmunisationNotificationAction 0..1
	
* extension[ImmunisationNotificationAction] ^short = "Indicates to which parties the Immunisation Notification message should be sent"