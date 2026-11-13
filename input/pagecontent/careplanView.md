**NOTE: THIS PAGE DESCRIBES FEATURES UNDERGOING DEVELOPMENT, SO IS PROVIDED FOR INFORMATION ONLY.**

### Overview

The '$view' interaction is used to obtain a point-in-time view of a consumer’s planned events, expected events and matching immunisation events. This method takes a consumer’s NHI identifier and returns the FHIR resources for the care plan and associated objects.

* The request generates a bundle of CarePlan FHIR Resources that contain all planned activities (i.e. Planned Events and Expected Events) represented in an Immunization Recommendation FHIR Resource and their matching preformed activities, represented in one or more Immunization FHIR Resources. All reflect a point-in-time list of Immunisation Planned Events and Expected Events across all Antigen Group Vaccination Schedules that have been assigned to that Consumer and are Active at the time of making the request.

* By default, the API will return a point-in-time view of all Active (i.e. not Cancelled) Planned Events and Expected Events, past, present and future, that are assigned to the specified Consumer. Matching vaccination records also will be returned.

* Each CarePlan Resource presents one consumer AG schedule.

* Each CarePlan activity references one planned event dose (IR) and any matched immunisation events (IEs).

* Planned Events will be ordered by due date ascending.

* If the Consumer with the NHI in the Search request is not on-boarded in ImmSOT then the consumer will be on-boarded, AGVS Schedules will be assigned and planned events will be created. Then the API logic will be executed and the planned events will be returned.

* If access is restricted to the NHI in the request or any linked NHIs (Live or Dormant), then an empty result will be returned, with a redacted code in the meta data.

* If a dormant NHI is used in the request the same results will be return as if the live NHI was used.

### Normal Success Scenarios
#### $view API Sequence Diagram

<div style="width: 100%; height: auto;">
  {% include careplan-view-success-sequence-diagram.svg %}
</div>

#### Normal Success Response Example

Response code is HTTP/1.1 200 Ok

```json
{
  "resourceType": "Bundle",
  "id": "AIRBundleCarePlanExample",
  "type": "searchset",
  "link": [
    {
      "relation": "self",
      "url": "https://air.api-dev.digital.health.nz/fhir/R4/CarePlan/$view?_include=*&nhi=ZET7992"
    }
  ],
  "entry": [
    {
      "fullUrl": "urn:uuid:585856eb-d1be-405f-813c-4ecac6c6149d",
      "resource": {
        "resourceType": "CarePlan",
        "identifier": [
          {
            "system": "https://standards.digital.health.nz/ns/air-careplan-id",
            "use": "official",
            "value": "482913-DELAYED-PRIMARY-1119254000"
          }
        ],
        "instantiatesUri": [
          "https://air.api-dev.digital.health.nz/fhir/R4/AGVS-Delay-3-6M-P-PCV13"
        ],
        "status": "active",
        "intent": "plan",
        "title": "PCV13 Immunisation Schedule for NJoe Bloggs",
        "description": "PCV13",
        "subject": {
          "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZET7992",
          "identifier": {
            "system": "https://standards.digital.health.nz/ns/nhi-id",
            "value": "ZET7992"
          }
        },
        "period": {
          "start": "2023-11-11T13:00:00+13:00"
        },
        "created": "2023-12-30T13:00:00+13:00",
        "activity": [
          {
            "extension": [
              {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-activity-reference",
                "valueReference": {
                  "reference": "urn:uuid:55f29c25-9f99-4687-ba3f-a70e28a547df"
                }
              },
              {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-performed-activity",
                "valueReference": {
                  "reference": "https://air.api-dev.digital.health.nz/fhir/R4/Immunization/4c8a08da-24b6-46ce-ae72-add6234e4605"
                }
              }
            ]
          },
          {
            "extension": [
              {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-activity-reference",
                "valueReference": {
                  "reference": "urn:uuid:216aa073-a929-4565-986a-5b1e8391f294"
                }
              }
            ]
          }
        ]
        // ... rest of CarePlan resource
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "urn:uuid:55f29c25-9f99-4687-ba3f-a70e28a547df",
      "resource": {
        "resourceType": "ImmunizationRecommendation",
        "identifier": [
          {
            "system": "https://standards.digital.health.nz/ns/air-planned-event-id",
            "use": "official",
            "value": "482913-DELAYED-PRIMARY-1119254000-1-CPE"
          },
          {
            "system": "https://standards.digital.health.nz/ns/air-planned-event-record-id",
            "use": "temp",
            "value": "6839f1aa-bd5e-40a4-89f0-f193e0e92bd3"
          }
        ],
        "patient": {
          "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZET7992",
          "identifier": {
            "system": "https://standards.digital.health.nz/ns/nhi-id",
            "value": "ZET7992"
          }
        },
        "recommendation": [
          {
            // exactly one: dose 1, GIVEN, due 2019-04-08
            "extension": [
              // air-recommendation-id, air-disease-covered, air-agvs, air-scheduled-event extensions
            ]
          }
        ]
        // ... rest of ImmunizationRecommendation resource
      },
      "search": {
        "mode": "include"
      }
    },
    {
      "fullUrl": "https://air.api-dev.digital.health.nz/fhir/R4/Immunization/4c8a08da-24b6-46ce-ae72-add6234e4605",
      "resource": {
        "resourceType": "Immunization",
        "id": "4c8a08da-24b6-46ce-ae72-add6234e4605"
        // ... rest of Immunization resource
      }
    }
  ]
}
```  
#### Empty Success Response Example 
Response code is HTTP/1.1 200 Ok

```json
{
  "resourceType": "Bundle",
  "type": "searchset",  
  "entry": [
    // No entries are returned in this case ...
  ]
}

```

#### $view API Sequence Diagram – Redacted Success Scenario

<div style="width: 100%; height: auto;">
  {% include careplan-view-suppressed-sequence-diagram.svg %}
</div>

##### Redacted Success Response

Response code is HTTP/1.1 200 Ok

ImmSOT will return a success response with an empty result and will add an additional metadata security attribute with the value “REDACTED” as below.
Consuming client applications can use this metadata tag to differentiate between an empty response (i.e ImmSOT does not have the data)
and an empty result because access to the consumer immunisation information is restricted.

```json
{
  "resourceType": "Bundle",
  "type": "searchset",
  "meta": {
    "security": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code": "REDACTED",
        "display": "redacted"
      }
    ],
    // No other meta information should be provided...
  },
  "entry": [
    // No entries are returned in this case ...
  ]
}
```  


#### $view API Sequence Diagram – Failure Scenario

<div style="width: 100%; height: auto;">
 {% include careplan-view-failure-sequence-diagram.svg %}
</div>


##### Example Failure Response
Response code is HTTP/1.1 404 Not Found
```json 
{
"resourceType": "OperationOutcome",
"issue": [
{
"severity": "error",
"code": "not-found",
"diagnostics": "Consumer not found"
}
]
}
```
