ValueSet: AIRForecastStatus
Id: air-forecast-status-code
Title: "AIR Forecast Status"
Description: "This value set includes the codes used in AIR to communicate the status of a planned event. "

* ^experimental = false

* insert StandardMetadata

* $imm-rec-status#due "Due"
* $imm-rec-status#overdue "Overdue"

* include codes from system air-forecast-status
