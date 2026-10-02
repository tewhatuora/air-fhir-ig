### Introduction

This is the FHIR® Implementation Guide (IG) for the Aotearoa Immunisation Register (AIR) API (application programming interface). This API exposes Health NZ’s Immunisation Source of Truth (ImmSoT) service via the Digital Services Hub (DSH).  ImmSoT is the repository of all immunisation data for the AIR.

The AIR stores and manages information about immunisations delivered or planned for future delivery in New Zealand. AIR uses the FHIR API and artifacts specified in this IG to transmit information about immunisation to authorised users. Principal resources available via the AIR APIs are:

* Immunization
* Patient, combining NHI with data held in AIR about the consumer
* HPI Practitioner, Organization and Location (facility)

CarePlan, with related ImmunizationRecommendation representing a consumer’s National Immunisation Service (NIS) schedule events, will be available in future.

The AIR solution set includes an application known as ISD, the Immunisation Service Delivery portal. This Salesforce application is used to record immunisation information where another system such as a General Practice Practice Management System (GP PMS) is not available. The ISM (Immunisation Service Management) system enables AIR administrators and support teams to manage immunisation data and access to the ISD.

For more information about the AIR context and problem domain see [Business Context](business-context.html). 

### Dependencies

This IG depends on [FHIR version 4.0.1](https://hl7.org/fhir/R4/index.html).

This IG depends on the [HL7(r) FHIR(r) New Zealand Base IG](http://build.fhir.org/ig/HL7NZ/nzbase/branches/master/index.html).

### API IG versions

Currently two major versions of the FHIR Implementation Guide are active, with corresponding API implementations: [API Version 1](/air-v1/index.html) and [API Version 2](/air/index.html). Key differences between versions are noted in the [Directory of Published Versions](directory.html).

The payload is validated against the version of the IG requested, and the response payload (if present) will adhere to that version of the IG. 

#### Default Version

__The default version of the IG and API is version 2.__ API subscribers using versions previous to the default usually are expected to migrate to the current version within 1 year of Production release.

#### Specify the API version

To specify the API version used the html header in the request `Api-Version` can be set to `["1", "2"]`, this will validate the payload against that version of the IG, and the response payload (if present) will adhere to that version of the IG.

So a `search` request for version 1 of the IG will use the version 1 API and return results using version 1 of the IG. Simarly a `create` request with a version 2 header will have the payload verified against version 2 of the IG and the result will also adhere to version 2.

i.e html request headers
```
...
Content-Type: application/fhir+json
Api-Version: 1
...
```

example html response headers
```
...
Content-Type: application/fhir+json
Api-Version: 1
...
```

