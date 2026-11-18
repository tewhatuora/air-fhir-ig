Instance: AirPlannedEventRecordId
InstanceOf: NamingSystem
Usage: #definition
* name = "AirPlannedEventRecordId"
* status = #active
* kind = #identifier
* date = "2026-10-30"
* publisher = "Health New Zealand"
* responsible = "AIR (ImmSOT)"
* description = "Temporary identifier for a planned immunisation event record, assigned by AIR. Used to track changes in the PlannedEvent table across database operations. Not stable across recalculations or record lifecycle changes. This identifier is assigned by AIR to the PlannedEvent database record and does not survive recalculation or lifecycle state changes. Use the air-planned-event-id (official identifier) for stable references across time."
* usage = "ImmunizationRecommendation.identifier (use=temp) in CarePlan/$view responses. For internal system tracking only."
* uniqueId[0].type = #uri
* uniqueId[=].value = "https://standards.digital.health.nz/ns/air-planned-event-record-id"
* uniqueId[=].preferred = true
