Instance: AirPlannedEventId
InstanceOf: NamingSystem
Usage: #definition
* name = "AirPlannedEventId"
* status = #active
* kind = #identifier
* date = "2026-10-30"
* publisher = "Health New Zealand"
* responsible = "AIR (ImmSOT)"
* description = "Stable identifier for a consumer's planned immunisation event (dose slot). Value = {consumerId}-{scheduleType}-{seriesType}-{antigenGroupCode}-{doseNumber}-{eventType}. Unchanged when AIR cancels and recreates the planned event with the same type. consumerId: AIR's internal consumer ID (an integer), never the NHI. antigenGroupCode: SNOMED code, not display name. scheduleType and seriesType: Values from AIR AGVS extensions. eventType: CPE, PPE, or EE from air-scheduled-event extension. doseNumber: Sequential dose number for the series. The key omits PlannedEvent UUID, schedule version, due date, and date of birth, ensuring stability across recalculations."
* usage = "ImmunizationRecommendation.identifier in CarePlan/$view responses."
* uniqueId[0].type = #uri
* uniqueId[=].value = "https://standards.digital.health.nz/ns/air-planned-event-id"
* uniqueId[=].preferred = true
