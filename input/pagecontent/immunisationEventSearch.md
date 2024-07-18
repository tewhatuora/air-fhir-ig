### Overview

The "search" operation is used to search patient immunisation events. This method takes a patient NHI and optional parameters of target disease, exclude specified status reason, or exclude specified immunisation status, and returns back the FHIR bundle which is a collection of immunisation event resources.

The search API performs the following steps:

1. Checks that the authorization token contains the required permissions
   * Returns an error message indicating that the user does not have the required scope to search immunisation events if the authorization token does not contain the required permissions.

1. Search in the NHI table for the NHI provided in the search request and returns all the NHIs (live and dormant) that have the same consumer id matching the consumer id assigned to the NHI submitted in the request.
   * If the provided NHI is not found, the service returns an error message

1. Searches in the Immunisation table for the latest version of the immunisation events for all the NHIs obtained in step #2 above.

1. If a target disease is provided, only immunisations for that disease will be returned.

1. If one or more immuisation status reason codes is provided, only immunisations which do not contain those codes will be returned.

1. If one or more immunisation status codes is provided, only immunisations which do not contain those codes will be returned.

1. Returns the latest version of the immunisation events as a FHIR bundle.

### Operation

POST https://api_endpoint/v2/fhir/Immunization/_search

### Request Headers

See [request headers](requestHeaders.html).

### Request Body

POST a payload with the following parameters
* Patient Identifier (NHI Number) (Mandatory)
* Target disease (SNOMED code from [AIR Disease Covered Value Set](ValueSet-air-disease-covered-code.html) (Optional)
* Exclude status reason (one or more system|code (or just code) from  [AIR Status Reason Code Value Set](ValueSet-air-status-reason-code.html) (Optional)
* Exclude immunisation status (one or more of: entered-in-error, completed, not-done) (Optional)
~~~
patient: "ZZZ7541"
target-disease: "http://snomed.info/sct|14189004,http://snomed.info/sct|66071002"
status-reason:not-in: "https://standards.digital.health.nz/ns/air-status-reason-terms|GIVNOS,RESCHO,|HSTGIVN"
status:not-in: "entered-in-error"
~~~

### Behaviour

* Patient record/NHI is validated
* Immunisation records that belong to all the NHIs (live and dormant) that have the same consumer id matching the consumer id assigned to the NHI submitted in the request will be returned.
* If a target disease is provided, only immunisations for that disease are returned.
* If one or more status reasons are provided, only immunisations which do NOT contain any of those status reasons are returned.
* If one or more statuses are provided, only immunisations which do NOT contain any of those statuses are returned.
* If ImmSOT is unable to map a vaccine to the target disease provided (e.g. invalid disease code), no immunisations will be returned.
* If admin scope is also present, then include the full data quality result with the response.
* If the NHI in the Search request or any linked NHIs (live or dormant) is suppressed return an empty result, with redacted metadata.

### Responses
HTTP/1.1 200 OK
Content-Type: application/fhir+json

#### Search returns results

~~~
{
    "resourceType": "Bundle",
    "id": "f05dedabdc684b0fbae2",
    "meta": {
        "lastUpdated": "2023-09-14T01:59:12.375+00:00"
    },
    "type": "searchset",
    "total": 2,
    "link": [
        {
            "relation": "self",
            "url": "https://localhost:8443/v2/fhir/Immunization/_search"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://localhost:8443/v2/fhir/Immunization/bb14c00e-83b7-494b-98aa-6b9295d2ea3a",
            "resource": {
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
                        }
                    ],
                    "versionId": "3",
                    "lastUpdated": "2023-09-14T01:54:39.727+00:00",
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
                                        "code": "MTH"
                                    }
                                ]
                            }
                        ],
                        "name": [
                            {
                                "family": "Doe2",
                                "given": [
                                    "John2 Jon2"
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
                                        "code": "IND",
                                        "display": "Indeterminate"
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
                        "valueString": "FZZ835-E_MOB0003"
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
                                "system": "https://standards.digital.health.nz/ns/air-terms-code",
                                "code": "5",
                                "display": "Primary course"
                            }
                        ]
                    },
                    {
                        "coding": [
                            {
                                "system": "https://standards.digital.health.nz/ns/air-terms-code",
                                "code": "5P",
                                "display": "Privately funded, primary course"
                            }
                        ]
                    }
                ],
                "protocolApplied": [
                    {
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
                        ],
                        "doseNumberPositiveInt": 1
                    }
                ]
            }
        },
        {
            "fullUrl": "https://localhost:8443/v2/fhir/Immunization/e5aba937-14a9-40fa-80cd-7e6c4d1305e1",
            "resource": {
                "resourceType": "Immunization",
                "id": "e5aba937-14a9-40fa-80cd-7e6c4d1305e1",
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
                            "valueInstant": "2023-09-14T01:26:46.626+00:00"
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
                    "lastUpdated": "2023-09-14T01:26:46.626+00:00",
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
                                        "code": "IND",
                                        "display": "Indeterminate"
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
                                "valueInteger": 0
                            },
                            {
                                "url": "days",
                                "valueInteger": 7
                            },
                            {
                                "url": "daysSinceBirth",
                                "valueInteger": 8773
                            },
                            {
                                "url": "precision",
                                "valueString": "DAY"
                            }
                        ]
                    },
                    {
                        "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-serology-report-extension",
                        "valueReference": {
                            "reference": "#2"
                        }
                    },
                    {
                        "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-mobile-site",
                        "valueString": "FZZ835-E_MOB0001"
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
                },
                "patient": {
                    "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ7541",
                    "identifier": {
                        "system": "https://standards.digital.health.nz/ns/nhi-id",
                        "value": "ZZZ7541"
                    }
                },
                "occurrenceDateTime": "2023-02-09T00:00:00.000+00:00",
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
                                "system": "https://standards.digital.health.nz/ns/air-terms-code",
                                "code": "5",
                                "display": "Primary course"
                            }
                        ]
                    },
                    {
                        "coding": [
                            {
                                "system": "https://standards.digital.health.nz/ns/air-terms-code",
                                "code": "5P",
                                "display": "Privately funded, primary course"
                            }
                        ]
                    }
                ],
                "protocolApplied": [
                    {
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
                        ],
                        "doseNumberPositiveInt": 1
                    }
                ]
            }
        }
    ]
}
~~~

#### Search returns results, including data quality information

~~~
{
    "resourceType": "Bundle",
    "id": "cf863f82029f4576a51b",
    "meta": {
        "lastUpdated": "2024-03-13T20:20:03.064+00:00"
    },
    "type": "searchset",
    "total": 1,
    "link": [
        {
            "relation": "self",
            "url": "https://localhost:42553/fhir/R4/Immunization/_search"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://localhost:42553/fhir/R4/Immunization/71320f5f-b9b4-41cb-bb73-bf3a2fe4298e",
            "resource": {
                "resourceType": "Immunization",
                "id": "71320f5f-b9b4-41cb-bb73-bf3a2fe4298e",
                "meta": {
                    "extension": [
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-source-system",
                            "valueString": "SS123"
                        },
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by",
                            "valueString": "111"
                        },
                        {
                            "url": "http://hl7.org/fhir/StructureDefinition/firstCreated",
                            "valueInstant": "2024-03-13T20:20:00.345+00:00"
                        },
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by",
                            "valueString": "111"
                        },
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system",
                            "valueString": "SS123"
                        },
                        {
                            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-data-quality-assessment",
                            "extension": [
                                {
                                    "url": "dqScore",
                                    "valueInteger": 100
                                },
                                {
                                    "url": "dqLastUpdated",
                                    "valueDateTime": "2024-03-13T20:20:00.739+00:00"
                                },
                                {
                                    "url": "dqStatus",
                                    "valueString": "P"
                                }
                            ]
                        }
                    ],
                    "versionId": "1",
                    "lastUpdated": "2024-03-13T20:20:00.345+00:00",
                    "profile": [
                        "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
                    ]
                },
                "extension": [
                    {
                        "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent",
                        "extension": [
                            {
                                "url": "diluentLotNumber",
                                "valueString": "123456"
                            },
                            {
                                "url": "diluentExpiryDate",
                                "valueDate": "2024-04-13"
                            }
                        ]
                    },
                    {
                        "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given",
                        "extension": [
                            {
                                "url": "years",
                                "valueInteger": 38
                            },
                            {
                                "url": "months",
                                "valueInteger": 10
                            },
                            {
                                "url": "days",
                                "valueInteger": 7
                            },
                            {
                                "url": "daysSinceBirth",
                                "valueInteger": 14191
                            },
                            {
                                "url": "precision",
                                "valueString": "DAY"
                            }
                        ]
                    }
                ],
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
                            "code": "03",
                            "display": "MMR"
                        }
                    ],
                    "text": "ngā mihi Nui"
                },
                "patient": {
                    "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/CGC2720",
                    "identifier": {
                        "system": "https://standards.digital.health.nz/ns/nhi-id",
                        "value": "CGC2720"
                    }
                },
                "occurrenceDateTime": "2024-03-13T20:19:58.423+00:00",
                "location": {
                    "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E",
                    "identifier": {
                        "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
                        "value": "FZZ835-E"
                    }
                },
                "lotNumber": "ThatsALot",
                "protocolApplied": [
                    {
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
                        ],
                        "doseNumberPositiveInt": 98
                    }
                ]
            }
        }
    ]
}

~~~

#### Response for suppressed consumer
~~~
{
    "resourceType": "Bundle",
    "id": "e50e23a268644c39a54d",
    "meta": {
        "security": [
            {
                "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
                "code": "REDACTED",
                "display": "redacted"
            }
        ]
    },
    "type": "searchset",
    "total": 0,
    "link": [
        {
            "relation": "self",
            "url": "https://localhost:8443/v2/fhir/Immunization/_search"
        }
    ]
}
~~~

### Scope/s required
Any FHIR scope that includes system/immunization.s , for example  
system/immunization.cruds and/or system/immunization.s  

To Include data quality results  

Also have  

air-admin/Immunization.cruds and/or air-admin/Immunization.s
