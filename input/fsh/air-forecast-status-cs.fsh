CodeSystem: AIRForecastStatus
Id: air-forecast-status
Title: "AIR Forecast Status Code System"
Description: "This code system includes the codes used in AIR to communicate a planned event status that are not already included in http://terminology.hl7.org/CodeSystem/immunization-recommendation-status."

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/air-forecast-status"

* ^experimental = false
* ^caseSensitive = false

* #PLANNED "Planned"
* #PRIOR "Pending"
* #DUE "Due"
* #LATE "Late"
* #OVERDUE "Overdue"
