CodeSystem: AIRFPlannedEventDateType
Id: air-planned-event-date-type
Title: "AIR Planned Event Date Type Code System"
Description: "This code system includes the codes used in AIR to communicate a date associated with a planned event, such as the due date or the earliest date to give. "

* insert StandardMetadata

* ^url = "https://standards.digital.health.nz/ns/air-forecast-status"

* ^experimental = false
* ^caseSensitive = false

* #EARLIEST "Earliest date to give"
* #LATEST "Latest date to give"
* #OVERDUE "Date vaccine overdue"
* #CREATED "Date event created"
* #PRIOR "Date PE becomes pending"
* #LATE "Date PE becomes late"
* #FINALIZED "Date PE updated to a final state"
