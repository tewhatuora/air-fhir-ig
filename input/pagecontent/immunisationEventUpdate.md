### Overview

The "update" operation is used to update an existing immunisation event. This method checks if the immunisation event with the given ID exists, and if it does, it updates the event with the new details provided. The method also performs validation checks to ensure that the updated event is valid before it is saved. Validation includes [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html).

The update operation performs the following:
1. Check if the immunisation event with the given ID exists. If it does not exist, returns an error with a message indicating that the event does not exist.
1. Check if the version of the existing event in the request header If-Match matches the version of the event being updated. If the versions do not match, it returns an error with a message indicating that the received version in the request payload does not match the existing version.
1. Check if the NHI of the existing event matches the NHI of the event being updated. If they do not match, it returns an error message indicating that the user does not have the required scope to update the NHI. Note: in the event that an Immunisation Event is uploaded to ImmSOT with an incorrect NHI, it must have its Status changed to "Entered in Error", and then the correct Event should be uploaded.
1. Check the event data with the [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html)
1. Create a new version of the event with the updated details and a new version number.
1. Save the new version of the event to the database.
1. Return the updated event and any validation issues identified in the meta sections.
1. If in the request, dqIgnore meta extension value is set as true, then the update operation won’t consider data-quality check, thus the response won’t contain data-quality score and relevant information.

### Operation

PUT https://api_endpoint/v2/fhir/Immunization/:id

### Request Headers

All the headers listed [here](requestHeaders.html) in addition to “If-Match” header with the value of the version of the immunisation record being updated.

### Requests

#### Update Immunisation- Excludes updating NHI
##### Request Body
Post a full set of immunisation record details. See Below for a sample. The AIR Immunization FHIR Profile is [here](StructureDefinition-air-immunization.html).

~~~
{
    "resourceType": "Immunization",
    "id": "bb14c00e-83b7-494b-98aa-6b9295d2ea3a",
    "meta": {
        "versionId": "1",
        "lastUpdated": "2023-03-08T03:26:00.970+00:00",
        "profile": [
            "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
        ]
    },
    "location": {
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
            "value": "FZZ835-E"
        }
    },
    "contained": [
        {
            "resourceType": "RelatedPerson",
            "id": "1",
            "patient": {
                "identifier": {
                    "system": "https://standards.digital.health.nz/ns/nhi-id",
                    "value": "ZZZ7541"
                }
            },
            "relationship": [
                {
                    "coding": [
                        {
                            "system": "http://terminology.hl7.org/CodeSystem/v3-RoleCode",
                            "code": "MTH"
                        }
                    ]
                }
            ],
            "name": [
                {
                    "family": "Doe2",
                    "given": [
                        "John2",
                        "Jon2"
                    ]
                }
            ],
            "telecom": [
                {
                    "system": "phone",
                    "value": "041111111",
                    "use": "home"
                },
                {
                    "system": "phone",
                    "value": "092222222",
                    "use": "work"
                },
                {
                    "system": "email",
                    "value": "jo2doe2@moh.govt.nz",
                    "use": "home"
                }
            ],
            "address": [
                {
                    "extension": [
                        {
                            "url": "http://hl7.org.nz/fhir/StructureDefinition/suburb",
                            "valueString": "Ngaio"
                        }
                    ],
                    "use": "home",
                    "type": "physical",
                    "line": [
                        "789 Update St",
                        "Nah"
                    ],
                    "city": "Auckland",
                    "postalCode": "5001"
                }
            ]
        },
        {
            "resourceType": "Observation",
            "id": "2",
            "meta": {
                "profile": [
                    "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report-profile"
                ]
            },
            "status": "preliminary",
            "code": {
                "coding": [
                    {
                        "system": "http://snomed.info/sct",
                        "code": "278969009"
                    }
                ]
            },
            "interpretation": [
                {
                    "coding": [
                        {
                            "system": "https://standards.digital.health.nz/ns/air-serology-protection-terms",
                            "code": "IND"
                        }
                    ]
                }
            ],
            "effectiveDateTime": "2023-01-01T13:12:34+12:00"
        }        
    ],
    "extension": [
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent",
            "extension": [
                {
                    "url": "diluentLotNumber",
                    "valueString": "33332222"
                },
                {
                    "url": "diluentExpiryDate",
                    "valueDate": "2026-01-01"
                }
            ]
        },
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-extension",
            "valueReference": {
                "reference": "#1"
            }
        },
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-mobile-site",
            "valueString": "FZZ835-E_MOB0002"
        },
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report-extension",
            "valueReference": {
                "reference": "#2"
            }
        },
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-administered-product",
            "valueCodeableConcept": {
                "coding": [
                    {
                        "system": "http://nzmt.org.nz",
                        "code": "10443641000116108"
                    }
                ],
                "text": "M-M-R-II"
            }
        }      
    ],
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
                "version": "1.0.0",
                "code": "03"
            }
        ],
        "text": "Priorix"
    },
    "patient": {
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/nhi-id",
            "value": "ZZZ7541"
        }
    },
    "occurrenceDateTime": "2023-08-29T00:00:00.000+00:00",
    "lotNumber": "555123",
    "expirationDate": "2024-01-31",
    "site": {
        "coding": [
            {
                "system": "http://snomed.info/sct",
                "version": "1.1",
                "code": "16217701000119102"
            }
        ]
    },
    "route": {
        "coding": [
            {
                "system": "http://snomed.info/sct",
                "version": "1.2",
                "code": "78421000"
            }
        ]
    },
    "performer": [
        {
            "function": {
                "coding": [
                    {
                        "system": "https://standards.digital.health.nz/ns/air-terms-code",
                        "version": "1.0.0",
                        "code": "VC"
                    }
                ]
            },
            "actor": {
                "identifier": {
                    "system": "https://standards.digital.health.nz/ns/nursing-council-id",
                    "value": "477616"
                }
            }
        }
    ],
    "reasonCode": [
        {
            "coding": [
                {
                    "system": "https://standards.digital.health.nz/ns/air-terms-code",
                    "code": "Stn"
                }
            ]
        }
    ],
    "protocolApplied": [
        {
            "doseNumberPositiveInt": 1
        }
    ]
}
~~~
##### Behaviour
* immunisation record is validated
* If all the attributes / items in the immunisation record are valid, a new immunisation record with an updated version is added with the details populated in the request.
* Some fields such as the NHI will be checked to verify that they have not changed from the previous version of the record.

##### Response
Returns the updated immunisation record. Data quality issues will be identified and sent as part of the response in the meta section of the resource, see the response sample payload below.

If there were any issues with the update, the response will contain an OperationOutcome resource array. The OperationOutcome resource has an informational issue indicating that the update operation failed. The issue array of the OperationOutcome resource would contain additional issues with appropriate severity and code values. See [here](rejectionRules.html) for a list of the rules that must be adhered to for an Immunisation Event to be uploaded to ImmSOT.

##### Scope/s Required

Any FHIR scope that includes system/immunization.u , for example system/immunization.cruds and/or system/immunization.u 
