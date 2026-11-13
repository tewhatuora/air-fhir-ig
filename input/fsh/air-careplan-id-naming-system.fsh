Instance: AirCarePlanId
InstanceOf: NamingSystem
Usage: #definition
* name = "AirCarePlanId"
* status = #active
* kind = #identifier
* date = "2026-10-30"
* publisher = "Health New Zealand"
* responsible = "AIR (ImmSOT)"
* description = "Stable identifier for a consumer's immunisation schedule (CarePlan). Value = {consumerId}-{scheduleType}-{seriesType}-{antigenGroupCode}. The identifier remains stable even when AIR recalculates the schedule. consumerId: AIR's internal consumer ID (an integer), never the NHI. antigenGroupCode: SNOMED code, not display name. scheduleType and seriesType: Values from AIR AGVS extensions."
* usage = "CarePlan.identifier in CarePlan/$view responses."
* uniqueId[0].type = #uri
* uniqueId[=].value = "https://standards.digital.health.nz/ns/air-careplan-id"
* uniqueId[=].preferred = true
