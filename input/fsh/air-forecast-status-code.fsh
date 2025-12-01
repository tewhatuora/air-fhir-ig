ValueSet: AIRForecastStatusCode
Id: air-forecast-status-code
Title: "AIR Forecast Status"
Description: "This value set includes the codes used in AIR to communicate the status of a planned event. "

* ^experimental = false

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/air-forecast-status-code"

* insert StandardMetadata

* $imm-rec-status#due "Due"
* $imm-rec-status#overdue "Overdue"

* include codes from system air-forecast-status
