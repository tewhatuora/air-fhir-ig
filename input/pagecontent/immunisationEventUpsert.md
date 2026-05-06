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
4. Return the created or updated event and any validation issues identified in the meta sections.

<div>
<img src="assets/images/upsert-flow-digram.png" alt="Upsert Flow" style="max-width:100%; height:auto;"/>
</div>

### Operation 

POST https://api_endpoint/v2/fhir/Immunization/$upsert

### Request Headers

All the headers listed in the request headers [here](requestHeaders.html)

### Request Body

Post a full set of immunisation resource details. See below. The FHIR specification for an AIR Immunization resource is at [AIR Immunization Profile](StructureDefinition-air-immunization.html)

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

For Immunisation Event in the request attempt to find an matching existing Immunisation Event that matches on NHI, Occurrence Date, Vaccine Code and Indication

* If no match found, create a new event
* If single match found, update event
* If multiple events found, create a new event (duplicate will be raised).
* Failure to process any event, reject entire request

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


### Scope/s required

Any FHIR scope that includes system/immunization.c or system/immunization.u, for example system/immunization.cruds or system/immunization.c

### Notes
The API is invoked only when a PMS updates a record.

* PMS determines whether the local record has an AIR ID
* If the record has AIR ID, PMS calls Update API
* If no AIR ID exists, PMS calls the Upsert API
* ImmSot attempts to locate an existing immunisation event using matching rules
* Based on match outcome, ImmSot creates or updates an event and returns a response with AIR ID
* PMS updates its local record with the AIR ID