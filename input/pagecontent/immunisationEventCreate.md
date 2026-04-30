### Overview

The "create" operation is used to create a new immunisation event. This method performs validation checks to ensure that the event is valid before it is created.  

The create operation performs the following:
1. Check that the authorization token contains the required permission, if not it returns an error message indicating that the user does not have the required scope to create an immunisation record
1. Check the event data with the [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html)
1. Create the first version of the event with the details provided
1. Saves the new version of the event to the database.
1. Returns the event and any validation errors in an operationOutcome.

### Operation 

POST https://api_endpoint/v2/fhir/Immunization

### Request Headers

All the headers listed in the request headers [here](requestHeaders.html)

### Request Body

Post a full set of immunisation record details. See below. The FHIR specification for an AIR Immunization resource is at [AIR Immunization Profile](StructureDefinition-air-immunization.html)

#### Sample Request Payload
~~~
{
    "resourceType": "Immunization",
    "patient": {
        "identifier": [
            {
                "system": "https://standards.digital.health.nz/ns/nhi-id",
                "value": "ZZZ7541"
            }
        ]
    },
    "occurrenceDateTime": "2023-08-29",
    "vaccineCode": {
        "text": "Priorix",
        "coding": [
            {
                "system": "http://hl7.org/fhir/sid/cvx",
                "code": "03",
                "version": "1.0.0"
            }
        ]
    },
    "protocolApplied": [
        {
            "doseNumberString": "1"
        }
    ],
    "lotNumber": "555123",
    "expirationDate": "2024-01-31",
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
                            "code": "FTH"
                        }
                    ]
                }
            ],
            "name": [
                {
                    "family": "Doe",
                    "given": [
                        "John",
                        "Jon"
                    ]
                }
            ],
            "telecom": [
                {
                    "system": "phone",
                    "value": "041234567",
                    "use": "home"
                },
                {
                    "system": "phone",
                    "value": "091234567",
                    "use": "work"
                },
                {
                    "system": "email",
                    "value": "jodoe@moh.govt.nz",
                    "use": "home"
                }
            ],
            "address": [
                {
                    "extension": [
                        {
                            "url": "http://hl7.org.nz/fhir/StructureDefinition/suburb",
                            "valueString": "Johnsonville"
                        }
                    ],
                    "use": "home",
                    "type": "physical",
                    "line": [
                        "123 Main St",
                        "Neverland"
                    ],
                    "city": "Wellington",
                    "postalCode": "6001"
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
            "valueString": "FZZ835-E_MOB0001"
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
    "route": {
        "coding": [
            {
                "system": "http://snomed.info/sct",
                "code": "78421000",
                "version": "1.2"
            }
        ]
    },
    "site": {
        "coding": [
            {
                "system": "http://snomed.info/sct",
                "code": "16217701000119102",
                "version": "1.1"
            }
        ]
    },
    "location": {
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
    "performer": [
        {
            "actor": {
                "identifier": {
                    "system": "https://standards.digital.health.nz/ns/nursing-council-id",
                    "value": "477616"
                }
            },
            "function": {
                "coding": [
                    {
                        "system": "https://standards.digital.health.nz/ns/air-terms-code",
                        "code": "VC",
                        "version": "1.0.0"
                    }
                ]
            }
        }
    ]
}
~~~

### Behaviour

* immunisation record is validated (validation rules that can lead to rejection of the submitted Immunisation Event are listed [here](rejectionRules.html), and rules that result in data quality warnings are listed [here](dataQualityRules.html))
* If all the attributes / items in the immunisation record are valid, a new immunisation record is added to the repository, attached to the provided NHI, with the details populated from the request.

### Response
	
Returns the created Immunization record. If there were any issues with the create, the response will contain an OperationOutcome resource array. The OperationOutcome resource has an informational issue indicating that the create operation failed. The issue array of the OperationOutcome resource would contain additional issues with appropriate severity and code values.

#### Sample Response Payload, Immunisation Event created successfully

~~~
{
    "resourceType": "Immunization",
    "id": "bb14c00e-83b7-494b-98aa-6b9295d2ea3a",
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
                "valueInstant": "2023-09-14T01:32:28.986+00:00"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by",
                "valueString": "PostmanUser"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system",
                "valueString": "Postman"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment",
                "extension": [
                    {
                        "url": "dqScore",
                        "valueInteger": 84
                    },
                    {
                        "url": "dqLastUpdated",
                        "valueDateTime": "2023-09-14T01:32:29.038+00:00"
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
                                        "valueString": "430"
                                    },
                                    {
                                        "url": "violationType",
                                        "valueString": "DataQuality"
                                    },
                                    {
                                        "url": "violationMessage",
                                        "valueString": "One or more health worker is unrecognised. An immunisation event should have a health worker identification number that passes the checksum criteria when the system is https://standards.digital.health.nz/ns/hpi-person-id, or it should have a health worker identification number and the system https://standards.digital.health.nz/ns/air-vhw-id."
                                    },
                                    {
                                        "url": "violationElement",
                                        "valueString": "Immunization.performer[0].actor"
                                    },
                                    {
                                        "url": "violationWeighting",
                                        "valueInteger": 2
                                    }
                                ]
                            },
                            {
                                "url": "DQViolation",
                                "extension": [
                                    {
                                        "url": "violationCode",
                                        "valueString": "150"
                                    },
                                    {
                                        "url": "violationType",
                                        "valueString": "DataQuality"
                                    },
                                    {
                                        "url": "violationMessage",
                                        "valueString": "One or more indication code is unrecognised. An indication code should be part of the air-indication-code value set."
                                    },
                                    {
                                        "url": "violationElement",
                                        "valueString": "Immunization.reasonCode[0]"
                                    },
                                    {
                                        "url": "violationWeighting",
                                        "valueInteger": 2
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        ],
        "versionId": "1",
        "lastUpdated": "2023-09-14T01:32:28.986+00:00",
        "profile": [
            "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
        ]
    },
    "contained": [
        {
            "resourceType": "RelatedPerson",
            "id": "1",
            "patient": {
                "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ7541",
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
                            "code": "FTH"
                        }
                    ]
                }
            ],
            "name": [
                {
                    "family": "Doe",
                    "given": [
                        "John Jon"
                    ]
                }
            ],
            "telecom": [
                {
                    "system": "phone",
                    "value": "041234567",
                    "use": "home"
                },
                {
                    "system": "phone",
                    "value": "091234567",
                    "use": "work"
                },
                {
                    "system": "email",
                    "value": "jodoe@moh.govt.nz",
                    "use": "home"
                }
            ],
            "address": [
                {
                    "extension": [
                        {
                            "url": "http://hl7.org.nz/fhir/StructureDefinition/suburb",
                            "valueString": "Johnsonville"
                        }
                    ],
                    "use": "home",
                    "type": "physical",
                    "line": [
                        "123 Main St",
                        "Neverland"
                    ],
                    "city": "Wellington",
                    "postalCode": "6001"
                }
            ]
        },
        {
            "resourceType": "Observation",
            "id": "2",
            "status": "preliminary",
            "code": {
                "coding": [
                    {
                        "system": "http://snomed.info/sct",
                        "code": "278969009",
                        "display": "Hepatitis B status"
                    }
                ]
            },
            "effectiveDateTime": "2023-01-01T01:12:34.000+00:00",
            "interpretation": [
                {
                    "coding": [
                        {
                            "system": "https://standards.digital.health.nz/ns/air-serology-protection-terms",
                            "code": "IND"
                        }
                    ]
                }
            ]
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
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given",
            "extension": [
                {
                    "url": "years",
                    "valueInteger": 24
                },
                {
                    "url": "months",
                    "valueInteger": 6
                },
                {
                    "url": "days",
                    "valueInteger": 27
                },
                {
                    "url": "daysSinceBirth",
                    "valueInteger": 8974
                },
                {
                    "url": "precision",
                    "valueString": "DAY"
                }
            ]
        },
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-mobile-site",
            "valueString": "FZZ835-E_MOB0001"
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
                        "code": "10443641000116108",
                        "display": "M-M-R-II"
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
    },
    "patient": {
        "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ7541",
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/nhi-id",
            "value": "ZZZ7541"
        }
    },
    "occurrenceDateTime": "2023-08-29T00:00:00.000+00:00",
    "location": {
        "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E",
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
            "value": "FZZ835-E"
        }
    },
    "lotNumber": "555123",
    "expirationDate": "2024-01-31",
    "site": {
        "coding": [
            {
                "system": "http://snomed.info/sct",
                "version": "1.1",
                "code": "16217701000119102",
                "display": "Structure of left deltoid muscle"
            }
        ]
    },
    "route": {
        "coding": [
            {
                "system": "http://snomed.info/sct",
                "version": "1.2",
                "code": "78421000",
                "display": "Intramuscular route"
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
                        "code": "VC",
                        "display": "Vaccinator"
                    }
                ]
            },
            "actor": {
                "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/477616",
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
                    "system": "http://snomed.info",
                    "code": "359953009"
                }
            ]
        },
        {
            "coding": [
                {
                    "system": "http://snomed.info",
                    "version": "1",
                    "code": "359953009"
                }
            ]
        }
    ],
    "protocolApplied": [
        {
            "doseNumberString": "1",
            "targetDisease": [
                {
                    "coding": [
                        {
                            "system": "http://snomed.info/sct",
                            "code": "14189004",
                            "display": "Measles"
                        }
                    ]
                },
                {
                    "coding": [
                        {
                            "system": "http://snomed.info/sct",
                            "code": "36989005",
                            "display": "Mumps"
                        }
                    ]
                },
                {
                    "coding": [
                        {
                            "system": "http://snomed.info/sct",
                            "code": "36653000",
                            "display": "Rubella"
                        }
                    ]
                }
            ]
        }
    ]
}
~~~


### Scope/s required

Any FHIR scope that includes system/immunization.c , for example system/immunization.cruds and/or system/immunization.c

### Notes
* The API will validate that there are no more than two identifiers received in the request payload for patient references
* Return a reference to the Facility in the response if there is an identifier for a facility (i.e the system is "https://standards.digital.health.nz/ns/hpi-facility-id") 
For example if the identifier we have for Facility is as following
~~~
  {
      "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
      "value": "FZZ958-K"
  }
~~~

Then the "reference" should be "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ958-K"

A full example for a location payload is below

~~~
"location": { 
  "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ958-K",
  "identifier": {
      "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
      "value": "FZZ958-K"
  }     
},
~~~
* The operation may return data quality violations based on the [data quality rules](dataQualityRules.html) 

* The record can also be identified by ImmSOT as duplicate, see the details of this [here](duplicateRecordHandling.html)
