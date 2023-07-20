Extension: AllPartiesFlag
Id: all-parties-flag
Description: "Indicates that all interested parties should be notified of the event"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/all-parties-flag"

* ^context.type = #element
* ^context.expression = "MessageHeader"

* extension 0..0
* value[x] only boolean
