### Introduction

This is the FHIR(r) Implementation Guide (IG) for the Aotearoa Immunisation Register(AIR) Immunisation Source of Truth (ImmSoT) service. ImmSoT stores information about vaccinations delivered or planned for future delivery in New Zealand. AIR ImmSoT uses the FHIR API (application programming interface) and artifacts specified in this IG to transmit information about immunisation(to authorised users). ImmSoT is one component of AIR, which also includes an application known as ISD which can be used to record vaccination information when another system such as a General Practice Practice Management System (GP PMS) is not available.

### Dependencies

This IG depends on FHIR version 4.0.1.

This IG depends on the [HL7(r) FHIR(r) New Zealand Base IG](http://build.fhir.org/ig/HL7NZ/nzbase/branches/master/index.html)

### API IG versions

Currently two major versions of the IG are supported, with corrosponding API implementations [API Version 1](https://healthnz-prm.gitlab.io/air/air-api-fhir-ig-v2/v1/index.html) and [API Version 2](https://healthnz-prm.gitlab.io/air/air-api-fhir-ig-v2/v2/index.html). 

#### Default version

The default version of the IG and API used is version 1.

#### Specify the API version

To specify the API version used the html header in the request `Api-Version` can be set to `["1", "2"]`, this will validate the payload against that version of the IG, and the response payload (if present) will adhere to that version of the IG.

So a `search` request for version 1 of the IG will use the version 1 API and return results using version 1 of the IG. Simarly a `create` request with a version 2 header will have the payload verified against version 2 of the IG and the result will also adhere to version 2.

i.e Html headers
```
Content-Type: application/fhir+json
Api-Version: 1
```
