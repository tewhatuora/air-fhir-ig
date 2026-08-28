### Overview

The "upsert" operation is a conditional-create operation, which checks whether a single immunisation event with the same primary attributes exists, and if it does, it updates the event with the new details provided. If no corresponding event is found, or multiple are found, then a create operation is performed.

It is used by a PMS (Practice Management System) where the AIR Identifier (Immunization.id) for the record is not yet known to the PMS and it is updated locally.

The method also performs validation checks to ensure that the event is valid before it is saved. Validation includes [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html).

Upon a successful response, AIR will return the AIR Identifier and current version number. The PMS system shall persist these values in its data store.

The upsert operation achieves the following:

1. Deduplication where possible
1. Deterministic update behaviour, and
1. Atomic processing (all-or-nothing)

It performs the following:

1. Check that the authorization token contains the required permission, if not it returns an error message indicating that the user does not have the required scope to create or update an immunisation record.
2. Check the event data with the [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html). If rejected, it returns an error with an OperationOutcome describing the problem.
3. Check if an immunisation event with the same primary attributes exists. These include: Patient Identifier, Vaccine Product, Event Date (conditionally exact instant), and conditionally Indications and/or Dose Number.
    * If a single existing immunisation event record is found, then it performs an Update of that record.
    * If no existing immunisation event record is found, then it performs a Create.
    * If multiple event records are found, then it performs a Create and adds Data Quality violation information to the event.
4. Return the created or updated event and any validation issues, identified in the meta sections.
5. Check if the NHI of the existing event matches the NHI of the event being updated. If they do not match, the existing NHI is preserved and the `meta.tag` "patient-identifier-immutable" is returned in the response.

<div>
<img src="assets/images/upsert-flow-digram.png" alt="Upsert Flow" style="max-width:100%; height:auto;"/>
</div>

### Operation 

```HTTP
POST https://api_endpoint/v2/fhir/Immunization/$upsert
```

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
                            "system": "http://snomed.info/sct",
                            "code": "127785005",
                            "display": "Administration of substance to produce immunity, either active or passive"
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

### Behaviour

For the Immunisation Event in the request attempt to find an existing Immunisation Event that can be linked on NHI, Occurrence Date, Vaccine Code and Indication.

* If no corresponding record found, create a new event.
* If single record found, update that event.
* If multiple events found, create a new event, raising a Potential Duplicate data quality violation.
* Failure to process any event, reject entire request.

### Response

Returns the created or updated Immunization record. If there were any issues with the create, the response will contain an OperationOutcome resource array. The OperationOutcome resource has an informational issue indicating that the upsert operation failed. The issue array of the OperationOutcome resource would contain additional issues with appropriate severity and code values.

#### Sample Response Payload,

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
                        "https://fhir-ig.digital.health.nz/air/StructureDefinition/air-immunization"
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
                            "system": "http://snomed.info/sct",
                            "code": "127785005",
                            "display": "Administration of substance to produce immunity, either active or passive"
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

##### patient-identifier-immutable in the response

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
