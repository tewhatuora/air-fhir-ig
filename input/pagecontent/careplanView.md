
## View Consumer Planned Events

The ‘$view’ API on the 'Careplan' profile used to view all the planned events contained within a Consumers vaccination schedule.

* The request generates a bundle of CarePlan FHIR Resources that contain all planned activities ( i.e Planned Events and Expected Events) represented in an Immunization Recommendation FHIR Resource and their matching preformed activities represented in one or more Immunization FHIR Resources. All reflect a point-in-time list of Immunisation Planned Events and Expected Events across all Antigen Group Vaccination Schedules that have been assigned to that Consumer and are Active at the time of making the request.

* By default, the API will return a point-in-time view of all Active (i.e. not Cancelled) Planned Events and Expected Events, past, present and future, that are assigned to the specified Consumer. The matching Consumers vaccination records will also be returned.

* Each CarePlan Resource presents one consumer AG schedule.

* Each CarePlan activity references one planned event dose (IR) and any matched immunisation events (IEs).

* Planned Events will be ordered by due date ascending.

* If the Consumer with the NHI in the Search request is not on-boarded in ImmSOT then the consumer will be on-boarded , AGVS Schedules will be assigned and planned events will be created then the API logic will be executed and the planned events will be returned.

* If the NHI in the request or any linked NHIs (Live or Dormant) is suppressed an empty result will be returned, with a redacted code in the meta data.

* If a dormant NHI is used in the request the same results will be return as if the live NHI was used.

### $view API Sequence Diagram – Normal Success Scenarios

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
      "url": "https://air.api-dev.digital.health.nz/fhir/R4/CarePlan?_include=*&patient=ZCZ1947"
    }
  ],
  "entry": [
    {
      "fullUrl": "https://air.api-dev.digital.health.nz/fhir/R4/CarePlan/AGVSRotavirus-ZCZ1947",
      "resource": {
        "resourceType": "CarePlan",
        "id": "AGVS-Rotavirus-ZCZ1947",
        "meta": {
          "versionId": "1"
        },
        "text": {
          "status": "extensions",
          "div": ""
        },
        "instantiatesUri": [
          "https://air.api-dev.digital.health.nz/fhir/R4/AGVS-Rotavirus"
        ],
        "status": "active",
        "intent": "plan",
        "title": "Rotavirus Immunisation Schedule for Joe Bloggs",
        "description": "This schedule shows the Rotavirus vaccination schedule per the NZ National Immunisation Schedule (NIS) for Joe Bloggs (NHI ZCZ1947) as at May 15, 2024...",
        "subject": {
          "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZCZ1947",
          "identifier": {
            "system": "https://standards.digital.health.nz/ns/nhi-id",
            "value": "ZCZ1947"
          }
        },
        "created": "2024-05-15",
        "activity": [
          {
            "extension": [
              {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-performed-activity",
                "valueReference": {
                  "reference": "RV-ZCZ1947-1"
                }
              },
              {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-activity-reference",
                "valueReference": {
                  "reference": "AGVS-RV-ZCZ1947-1"
                }
              }
            ]
          }
        ]
      },
      "search": {
        "mode": "match"
      }
    },
    {
      "fullUrl": "https://air.api-dev.digital.health.nz/fhir/R4/Immunization/RV-ZCZ1947-1",
      "resource": {
        "resourceType": "Immunization",
        "id": "RV-ZCZ1947-1"
        // rest of the Immunization resource
      }
    },
    {
      "fullUrl": "https://air.api-dev.digital.health.nz/fhir/R4/ImmunizationRecommendation/AGVS-RV-ZCZ1947-1",
      "resource": {
        "resourceType": "ImmunizationRecommendation",
        "id": "AGVS-RV-ZCZ1947-1"
        // rest of the ImmunizationRecommendation resource
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

### $view API Sequence Diagram – Redacted Success Scenario

<div style="width: 100%; height: auto;">
  {% include careplan-view-suppressed-sequence-diagram.svg %}
</div>

#### Redacted Success Response

Response code is HTTP/1.1 200 Ok

ImmSOT will return a success response with an empty result and will add an additional metadata security attribute with the value “REDACTED” as below.
Consuming client applications can use this metadata tag to differentiate between an empty response (i.e ImmSOT does not have the data)
and an empty result because the consumer immunisation information is suppressed.

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


### $view API Sequence Diagram – Failure Scenario

<div style="width: 100%; height: auto;">
 {% include careplan-view-failure-sequence-diagram.svg %}
</div>


#### Example Failure Response
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