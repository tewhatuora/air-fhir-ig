### Overview

The "read" operation is used to read an immunisation event. This method takes an immunisation event id and returns back the FHIR resource for the immunization event.

The read operation performs the following:
1. Check if the immunisation event with the given ID exists. If it does not exist, returns an error with a message indicating that the event does not exist.

1. Checks that the authorization token contains the required permission. If not, it returns an error message indicating that the user does not have the required scope to read an immunisation event

1. Return the latest version of the event as a FHIR [AIR-Immunization](StructureDefinition-air-immunization.html) resource

### Operation

~~~
GET https://api_endpoint/v2/fhir/Immunization/id
~~~

### Request Headers

All the headers listed in the [request headers](requestHeaders.html).

### Request Body

N/A

### Behaviour

* Immunisation record is located by the ID provided in the request.

* The latest version of the Immunisation Event is returned.

* If the NHI in the request or any linked NHIs (live or dormant) is suppressed an empty result is returned, with metadata indicating the information is redacted.

### Responses

#### Sample Response Payload, Immunisation Event Found and Returned Successfully

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
                "display": "Intramuscular"
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
            "doseNumberString": "1"
        }
    ]
}
~~~

#### Response, Redacted Information

~~~
{
   "resourceType": "Immunization",
   "id": "bb14c00e-83b7-494b-98aa-6b9295d2ea3a",
    "meta": {
    "security": [
      {
        "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationValue",
        "code": "REDACTED",
        "display": "redacted"
      }
    ],
  }
}
~~~

### Scope/s required

Any FHIR scope that includes system/immunization.r , for example system/immunization.cruds and/or system/immunization.r
