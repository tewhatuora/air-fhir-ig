### Overview

The "upsert" operation is a conditional-create operation, which checks whether a single immunisation event with the same primary attributes exists, and if it does, it updates the event with the new details provided. If no corresponding event is found, or multiple are found, then a create operation is performed. If an exact duplicate is found, no change is made and the existing record is returned with a meta tag indicating what happened.

The operation is used by a PMS (Practice Management System) where the AIR Identifier (Immunization.id) for the record is not yet known to the PMS and the record is updated locally.

The method also performs validation checks to ensure that the event is valid before it is saved. Validation includes [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html).

Upon a successful response, AIR will return the AIR Identifier and current version number. The PMS system SHALL persist these values in its data store, so that subsequent updates use the Update operation.

The upsert operation achieves the following:

1. Deduplication where possible,
1. Deterministic update behaviour, and
1. Atomic processing (all-or-nothing).

It performs the following:

1. Check that the authorization token contains the required permissions, if not it returns an error message indicating that the user does not have the required scope to create or update an immunisation record.
1. Check the event data with the [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html). If rejected, it returns an error with an OperationOutcome describing the problem.
1. With the Patient Identifier for the incoming event, compare to all other existing events for that Patient. If an exact duplicate is found, then return the _original_ record with `meta.tag` `exact-duplicate-not-created` and publish a duplicate resolution event via NEMS.
1. Check if an immunisation event with the same primary attributes exists. These include: Patient Identifier, Vaccine Product, Event Date (conditionally exact instant), and conditionally Indications and/or Dose Number.
    * If a single existing immunisation event record is found, then it performs an Update of that record.
    * If no existing immunisation event record is found, then it performs a Create.
    * If multiple event records are found, then it performs a Create and adds Data Quality violation information to the event.
    * See [Duplicate Record Handling](duplicateRecordHandling.html) for detail.
1. Return the created or updated event and any validation issues, identified in the meta sections.
1. Check if the NHI of the existing event matches the NHI of the event being updated. If they do not match, the existing NHI is preserved and the `meta.tag` `patient-identifier-immutable` is returned in the response.

<div>
<img src="assets/images/upsert-flow-digram.png" alt="Upsert Flow" style="max-width:100%; height:auto;"/>
</div>

### Operation 

~~~
POST https://api_endpoint/Immunization/$upsert
~~~

### Request Headers

All headers listed in the [request headers](requestHeaders.html).

### Request Body

Post a full set of immunisation resource details. See below. The FHIR specification for an AIR Immunization resource is the [AIR Immunization Profile](StructureDefinition-air-immunization.html)

#### Sample Request Payload
~~~json
{
      "resource": {
          "resourceType": "Immunization",
          "patient": {
              "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ7541",
              "identifier": {
                  "system": "https://standards.digital.health.nz/ns/nhi-id",
                  "value": "ZZZ7541"
              }
          },
          "occurrenceDateTime": "2023-01-29T00:00:00.000+13:00",
          "location": {
              "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E",
              "identifier": {
                  "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
                  "value": "FZZ835-E"
              }
          },
          "status": "completed",
          "statusReason": {
              "coding": [
                  {
                    "system": "https://standards.digital.health.nz/ns/air-status-reason-terms",
                    "code": "GIVEN"
                  }
              ]
          },
          "vaccineCode": {
              "coding": [
                  {
                      "system": "http://hl7.org/fhir/sid/cvx",
                      "code": "03"
                  }
              ],
              "text": "Priorix"
          }
      }
}
~~~

### Behaviour

With the Patient Identifier for the incoming event, AIR compares to all existing events for that Patient. If an exact match is found, then it does not create a new event, instead returning the _existing_ record marked with `meta.tag` `exact-duplicate-not-created` and a duplicate resolution event is published via NEMS citing both AIR Identifiers (Immunization.id).

See [Handling of Exact Duplicates](#handling-of-exact-duplicates) for an example response.

Following that, AIR attempts to find an existing record that can be linked on NHI, Event Date (occurrence\[x]), Vaccine Code and/or Indication.

* If no corresponding record found, create a new event.
* If single record found, update that event.
* If multiple events found, create a new event, raising a Potential Duplicate data quality violation. See [Partial Duplicate response example](#partial-duplicate-response-example) for an example response.
* Failure to process any event, reject entire request.

For more about duplicates see [Duplicate Record Handling](duplicateRecordHandling.html).

### Response

AIR returns the created or updated Immunization record. If there were any issues with the operation, the response will contain an OperationOutcome resource array. The OperationOutcome resource has an informational issue indicating that the upsert operation failed. The issue array of the OperationOutcome resource would contain additional issues with appropriate severity and code values.

#### Sample Response Payload

~~~json
{   
                "resourceType": "Immunization",
                "id": "c3640160-ad52-4aff-9bf3-fcf454c3962d",
                "meta": {
                    "extension": [
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-source-system",
                            "valueString": "Postman"
                        },
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by",
                            "valueString": "PostmanUser"
                        },
                        {
                            "url": "http://hl7.org/fhir/StructureDefinition/firstCreated",
                            "valueInstant": "2023-10-09T21:34:29.475+13:00"
                        },
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by",
                            "valueString": "PostmanUser"
                        },
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system",
                            "valueString": "Postman"
                        }
                    ],
                    "versionId": "1",
                    "lastUpdated": "2023-10-09T21:46:16.918+13:00",
                    "profile": [
                        "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
                    ]
                },        
                "patient": {
                    "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ7541",
                    "identifier": {
                        "system": "https://standards.digital.health.nz/ns/nhi-id",
                        "value": "ZZZ7541"
                    }
                },
                "occurrenceDateTime": "2023-01-29T00:00:00.000+13:00",
                "location": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E",
                    "identifier": {
                        "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
                        "value": "FZZ835-E"
                    }
                }, 
                "status": "completed",
                "statusReason": {
                    "coding": [
                        {
                          "system": "https://standards.digital.health.nz/ns/air-status-reason-terms",
                          "code": "GIVEN",
                          "display": "Vaccination given"
                        }
                    ]
                },
                "vaccineCode": {
                    "coding": [
                        {
                            "system": "http://hl7.org/fhir/sid/cvx",
                            "version": "1.0.0",
                            "code": "03",
                            "display": "MMR"
                        }
                    ],
                    "text": "Priorix"
                }
            }
        }
}
~~~

#### patient-identifier-immutable in the response

The NHI number is immutable. When the NHI number in the request does not match the NHI of the stored record, then the `meta.tag` "patient-identifier-immutable" is inserted in the response. The updated record is stored with the existing NHI number, not the one provided.

```json
"meta" : {
    ...
    "tag" : [
        {
            "system" : "https://standards.digital.health.nz/ns/air-processing-terms",
            "code" : "patient-identifier-immutable",
            "display" : "Patient identifier not updated - identifier is immutable for this operation"
        }
    ]
}
```

#### Handling of Exact Duplicates

The response upon identifying an exact duplicate is:
* http response code 200
* meta.tag `exact-duplicate-not-created`
* Immunization resource of the _original_ duplicate event in AIR including `resource.id`.

##### exact-duplicate-not-created meta.tag example
~~~json
...
"meta" : {
    ...
    "tag" : [
        {
            "system" : "https://standards.digital.health.nz/ns/air-processing-terms",
            "code" : "exact-duplicate-not-created",
            "display" : "Record already exists"
        }
    ]
} ...
~~~

#### Partial Duplicate response example

~~~json
...
  "meta": {
    "extension": [
// ... other meta extensions ...
      {
        "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment",
        "extension": [
          {
            "url": "dqScore",
            "valueInteger": 100
          },
          {
            "url": "dqLastUpdated",
            "valueDateTime": "2026-10-12T23:38:49.276+00:00"
          },
          {
            "url": "dqStatus",
            "valueString": "I"
          },
          {
            "url": "DQViolations",
            "extension": [
              {
                "url": "DQViolation",
                "extension": [
                  {
                    "url": "violationCode",
                    "valueString": "800"
                  },
                  {
                    "url": "violationType",
                    "valueString": "duplicate"
                  },
                  {
                    "url": "violationWeighting",
                    "valueInteger": 0
                  },
                  {
                    "url": "violationMessage",
                    "valueString": "This Immunization resource has been identified as a duplicate of existing Immunization resources"
                  },
                  {
                    "url": "violationElement",
                    "valueString": "Immunization.where(id in '7b992ec3-9c71-4ae4-9ab2-42a9f75d5f4c')"
                  }
                ]
              }
            ]
          }
        ]
      }
    ], ...
~~~

### Scope/s required

Any FHIR scope that includes system/immunization.c or system/immunization.u, for example system/immunization.cruds or system/immunization.c

### Notes
The Upsert API may be invoked only when a PMS updates a record that was persisted in its local data store prior to the AIR API coming into use. The record would have been sent to the AIR via HL7 messaging, in which case it has yet to be linked to the AIR by the AIR Identifier. Applications that do not persist immunisation event records locally shall not use the Upsert API.

* The PMS shall determine before calling $upsert whether the local record has an AIR Identifier.
* If the record does have an AIR Identifier, then the PMS shall call the Update API instead. See [Update Immunisation Event](immunisationEventUpdate.html).
* If the record does not have an AIR Identifier, then the PMS shall call the Upsert API.
* When an $upsert request is received, AIR attempts to locate an existing immunisation event using linking rules.
* Based on the outcome, AIR creates or updates an event and returns a response with AIR Identifier.
* When the PMS receives a successful response from AIR, then the PMS shall update its local record with the AIR Identifier.
