### Overview

The "update" operation is used to update an existing immunisation event. This method checks if the immunisation event with the given ID exists, and if it does, it updates the event with the new details provided. The method also performs validation checks to ensure that the updated event is valid before it is saved. Validation includes [Rejection Rules](rejectionRules.html) and [Data Quality Rules](dataQualityRules.html).

The update operation performs the following:
1. Check if the immunisation event with the given ID exists. If it does not exist, returns an error with a message indicating that the event does not exist.
1. Check if the version of the existing event in the request header If-Match matches the version of the event being updated. If the versions do not match, it returns an error with a message indicating that the received version in the request payload does not match the existing version.
1. Check if the NHI of the existing event matches the NHI of the event being updated. If they do not match, the existing NHI is preserved and the meta.tag "identifier-not-updated" is returned in the response.
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

```json
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
            "doseNumberString": "1"
        }
    ]
}
```
##### Behaviour
* immunisation record is validated
* If all the attributes / items in the immunisation record are valid, a new immunisation record with an updated version is added with the details populated in the request.
* Some fields such as the NHI will be checked to verify that they have not changed from the previous version of the record.

##### Response
Returns the updated immunisation record. Data quality issues will be identified and sent as part of the response in the meta section of the resource, see the response sample payload below.

If there were any issues with the update, the response will contain an OperationOutcome resource array. The OperationOutcome resource has an informational issue indicating that the update operation failed. The issue array of the OperationOutcome resource would contain additional issues with appropriate severity and code values. See [here](rejectionRules.html) for a list of the rules that must be adhered to for an Immunisation Event to be uploaded to ImmSOT.

```json
{
    "resourceType": "Immunization",
    "id": "dfc05e81-991c-4f0f-a4ae-0d718b83c936",
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
                "valueInstant": "2026-03-30T02:14:27.076+00:00"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by",
                "valueString": "111"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system",
                "valueString": "HSAPP9999"
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
                        "valueDateTime": "2026-03-30T02:14:29.053+00:00"
                    },
                    {
                        "url": "dqStatus",
                        "valueString": "P"
                    }
                ]
            }
        ],
        "versionId": "2",
        "lastUpdated": "2026-03-30T02:14:28.886+00:00",
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
                    "valueDate": "2026-04-30"
                }
            ]
        },
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given",
            "extension": [
                {
                    "url": "years",
                    "valueInteger": 56
                },
                {
                    "url": "months",
                    "valueInteger": 2
                },
                {
                    "url": "days",
                    "valueInteger": 29
                },
                {
                    "url": "daysSinceBirth",
                    "valueInteger": 20542
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
                "version": "1.0.0",
                "code": "03"
            }
        ],
        "text": "Priorix"
    },
    "patient": {
        "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZZZ1233",
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/nhi-id",
            "value": "ZZZ1233"
        }
    },
    "occurrenceDateTime": "2026-03-30T02:14:19.927+00:00",
    "location": {
        "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E",
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
            "value": "FZZ835-E"
        }
    },
    "lotNumber": "555123",
    "protocolApplied": [
        {
            "doseNumberPositiveInt": 1
        }
    ]
}
```

##### identifier-not-updated in the response

The NHI number is immutable, the `meta.tag` "identifier-not-updated" is inserted in the response when the NHI number in the request does not match the NHI of the stored record. The updated record is stored with the existing NHI number not the one provided.

```json
"meta" : {
    ...
    "tag" : [
        {
            "system" : "https://standards.digital.health.nz/ns/air-processing-terms",
            "code" : "identifier-not-updated",
            "display" : "Patient identifier not updated - identifier is immutable for this operation"
        }
    ]
}
```

##### Match Quality in response

Response including Match quality
```json
{
    "resourceType": "Immunization",
    "id": "8dd74894-07be-4cf2-842f-33dbc95c46b1",
    "meta": {
        "extension": [
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-source-system",
                "valueString": "HSAPP0010"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-created-by",
                "valueString": "user"
            },
            {
                "url": "http://hl7.org/fhir/StructureDefinition/firstCreated",
                "valueInstant": "2026-03-31T01:29:49.597+00:00"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-by",
                "valueString": "user"
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-modified-source-system",
                "valueString": "HSAPP0010"
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
                        "valueDateTime": "2026-03-31T01:32:08.270+00:00"
                    },
                    {
                        "url": "dqStatus",
                        "valueString": "P"
                    }
                ]
            },
            {
                "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-planned-event-match",
                "extension": [
                    {
                        "url": "match",
                        "extension": [
                            {
                                "url": "plannedEventId",
                                "valueString": "00513eb7-7d2a-495a-b3aa-c361b3f923a2"
                            },
                            {
                                "url": "matchedDate",
                                "valueDateTime": "2026-03-31T01:32:08.369+00:00"
                            },
                            {
                                "url": "matchedBy",
                                "valueString": "user"
                            },
                            {
                                "url": "matchedReason",
                                "valueCoding": {
                                    "code": "302",
                                    "display": "Automatically matched by dose and indication"
                                }
                            }
                        ]
                    }
                ]
            }
        ],
        "versionId": "2",
        "lastUpdated": "2026-03-31T01:32:08.126+00:00",
        "profile": [
            "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization"
        ]
    },
    "contained": [
        {
            "resourceType": "RelatedPerson",
            "id": "45c49168-bef8-4c22-8f37-fc13ec494594",
            "meta": {
                "profile": [
                    "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-prf"
                ]
            },
            "patient": {
                "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZGY9681",
                "identifier": {
                    "system": "https://standards.digital.health.nz/ns/nhi-id",
                    "value": "ZGY9681"
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
                    "family": "Compliance",
                    "given": [
                        "Air Test"
                    ]
                }
            ],
            "telecom": [
                {
                    "system": "phone",
                    "value": "047771234",
                    "use": "home"
                },
                {
                    "system": "phone",
                    "value": "0217771234",
                    "use": "work"
                },
                {
                    "system": "email",
                    "value": "air@compliance.govt.nz",
                    "use": "home"
                }
            ],
            "address": [
                {
                    "extension": [
                        {
                            "url": "http://hl7.org.nz/fhir/StructureDefinition/suburb",
                            "valueString": "Thorndon"
                        }
                    ],
                    "use": "home",
                    "type": "physical",
                    "line": [
                        "3E 163 Thorndon Quay",
                        "Thorndon"
                    ],
                    "city": "Wellington",
                    "postalCode": "6011"
                }
            ]
        }
    ],
    "extension": [
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-related-person-extension",
            "valueReference": {
                "reference": "#45c49168-bef8-4c22-8f37-fc13ec494594"
            }
        },
        {
            "url": "https://standards.digital.health.nz/fhir/air/StructureDefinition/air-age-given",
            "extension": [
                {
                    "url": "years",
                    "valueInteger": 0
                },
                {
                    "url": "months",
                    "valueInteger": 1
                },
                {
                    "url": "days",
                    "valueInteger": 14
                },
                {
                    "url": "daysSinceBirth",
                    "valueInteger": 45
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
                "code": "119",
                "display": "RV1"
            }
        ],
        "text": "RV1"
    },
    "patient": {
        "reference": "https://api.hip.digital.health.nz/fhir/nhi/v1/Patient/ZGY9681",
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/nhi-id",
            "value": "ZGY9681"
        }
    },
    "occurrenceDateTime": "2024-03-02T00:00:00+00:00",
    "location": {
        "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Location/FZZ835-E",
        "identifier": {
            "system": "https://standards.digital.health.nz/ns/hpi-facility-id",
            "value": "FZZ835-E"
        }
    },
    "lotNumber": "RV1-001",
    "expirationDate": "2026-01-31",
    "route": {
        "coding": [
            {
                "system": "https://standards.digital.health.nz/ns/air-terms-code",
                "code": "PO",
                "display": "Oral"
            }
        ]
    },
    "performer": [
        {
            "function": {
                "coding": [
                    {
                        "system": "https://standards.digital.health.nz/ns/air-terms-code",
                        "code": "VC",
                        "display": "Vaccinator"
                    }
                ]
            },
            "actor": {
                "reference": "https://api.hip.digital.health.nz/fhir/hpi/v1/Practitioner/92ZZRR",
                "identifier": {
                    "system": "https://standards.digital.health.nz/ns/hpi-person-id",
                    "value": "92ZZRR"
                }
            }
        }
    ],
    "reasonCode": [
        {
            "coding": [
                {
                    "system": "https://standards.digital.health.nz/ns/air-terms-code",
                    "code": "6W",
                    "display": "6 weeks"
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
                            "code": "18624000",
                            "display": "Rotavirus"
                        }
                    ]
                }
            ],
            "doseNumberPositiveInt": 1
        }
    ]
}
```

##### Scope/s Required

Any FHIR scope that includes system/immunization.u , for example system/immunization.cruds and/or system/immunization.u 
