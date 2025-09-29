### Resource representation: Json
Only JSON is supported by this implementation.

### Id and Identifiers
Immunization resources in this implementation have both an id and an identifier. The id is the ‘physical’ identity of the resource, and the identifier is the business identifier.

This design allows an implementer to retrieve a resource and save it on their own system, but still be able to retrieve the original to check for and apply updates. This can be done in two ways.

#### Read Resource by Id
```
GET https://api_endpoint/fhir/R4/Immunization/{id}
```
For further information see the [Read Immunisation Event](immunisationEventRead.html) item under the Use Cases menu.

#### Search Immunisation Events
```
POST https://api_endpoint/fhir/R4/Immunization/_search with parameters
```
For more information see the [Search Immunisation Events](immunisationEventSearch.html) item under the Use Cases menu.

### Additional search parameters
#### target-disease
Restricts results to specific target disease(s) by system|code, for example: http://snomed.info/sct|123456,http://loinc.org|7890. Exact matching is applied with no mapping of concepts between code systems.

#### status-reason:not-in and status:not-in
These exclude given status_reason(s) and status(es), enabling consuming applications to present relevant results only. For example, a user might not want to be distracted by closed and deleted records. See the Open API specification for further detail on these parameters.

#### Enrichment: the _include parameter
Certain operations allow for enrichment of the response bundle with referenced Patient, Location, Organization and Practitioner resources. If those resources are to be accessed, then onboarding to NHI and HPI is required.

#### Count and Offset in DQ results
For those with permission to view Data Quality (DQ) results, the AIR APIs default to returning 100 results in the search bundle e.g. GET<Endpoint>/Immunization/_search?_query=data-quality will return the first 100 rows.

To receive more than 100, and for paginated searching, use parameters _count and _offset.

- _count - This search parameter is used to extend the search and has a limit of 50 search results.
- _offset - This search parameter is used to get the next set of search results

Example usage:

- First request - GET<Endpoint>/Immunization/_search?_query=data-quality&_count=50
- Second request - GET\/Immunization/_search?_query=data-quality&_count=50&_offset=50
- Third request - GET\/Immunization/_search?_query=data-quality&_count=50&_offset=100

### dateTime support and UTC default
The FHIR [dateTime](https://hl7.org/fhir/R4/datatypes.html#dateTime) data type is defined as: 
```
A date, date-time or partial date (e.g. just year or year + month) as used in human communication. The format is YYYY, YYYY-MM, YYYY-MM-DD or YYYY-MM-DDThh:mm:ss+zz:zz
```
**AIR APIs do not support partial dates (YYYY, YYYY-MM) in Create/Update interactions.** dateTime values received by AIR with Day precision are preserved with Day precision on output (no time zone).

If hours and minutes are provided in datetime values, the FHIR dateTime type requires time zone. While AIR accepts values with no time zone, UTC is the default.

**dateTime values with a time component are output in UTC with +00:00 offset.** Applications are responsible for localising dateTime values when displaying dates and times to users or grouping at Day level.

### Dose 0 and null dose number
In this implementation `doseNumberPostitiveInt` is used in `protocolApplied` and `recommendation` elements.

External applications commonly record zero (0) to represent an ‘early’ dose where clinically recommended. Nulls appear in data migrated to AIR from systems that did not record dose number.

To support null and ‘Dose 0’ use cases, values 98 and 99 are substituted respectively. Applications must interpret these values accordingly.

A future release will implement [doseNumberString](https://hl7.org/fhir/R4/immunization-definitions.html#Immunization.protocolApplied.doseNumber_x_), anticipating [doseNumber](https://hl7.org/fhir/immunization-definitions.html#Immunization.protocolApplied.doseNumber) in later versions of FHIR.

### Health Worker Identifiers
The AIR requires health workers administering immunisations to be authorised. Records must be kept for traceability and legal reasons. Therefore, function (role) and identifier are important.

The HPI number (HPI Common Person Number CPN) is the preferred identifier. If a registration number is used, it should relate to administering immunisations.

The vaccinating workforce is diverse and many health workers do not have a CPN or relevant registration. Often this applies to health care assistants, kaiāwhina hauora and Vaccinating Health Workers.

AIR accepts a broad range of Practitioner identifiers, including some specific to AIR. AIR also provides for the use case where the only available identifier is local to the site or organisation:

* If a Vaccinating Health Worker (VHW) administers an immunisation, the function SHOULD be VHW. Vaccinating Health Worker (VHW) identifiers are assigned in the AIR Portal.
* If a registered nurse or doctor administers an immunisation, the function SHOULD be VC.
* For each immunisation event, at least one health worker SHOULD have function AP or a child thereof.
* If a health worker authorised to administer immunisations has no registration or CPN, their identifier MUST be unique within the source system and SHOULD have system 'https://HCA'. The identifier must be traceable to an individual health worker.
* Request-Context header and CreatedBy and ModifiedBy meta fields capture usernames of those who interact with the record.
* Request-Context header field secondaryIdentifier MUST be the end user’s CPN where available. Otherwise, any secondary identifier that is held for the user. This value is mandatory and must be correct and accurate, due to legal requirements. If the person triggering the request is not registered with any New Zealand health body on the list provided at [standards.digital.health.nz](https://standards.digital.health.nz ), the value must remain empty (empty string).

### Immunization status and statusReason
Immunisation status and statusReason SHOULD correspond, according to the table below. Events not complying with this rule are not able to be categorised, reported or matched to a planned event.

<table class="table table-bordered table-hover table-sm">
  <thead>
    <tr>
      <th>Scenario</th>
      <th>Immunization.status</th>
      <th>Immunization.statusReason</th>
      <th>Business Rules</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Immunisation given in NZ</td>
      <td>completed</td>
      <td><em>null</em> or GIVEN</td>
      <td>Body Site, Route, Vaccine lot number and Vaccine Expiration Date SHOULD have a value when status='completed'</td>
    </tr>
    <tr>
      <td>Declined (permanent contraindication)</td>
      <td>not-done</td>
      <td>DMC</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Declined by parent/guardian</td>
      <td>not-done</td>
      <td>DPC</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Declined by individual</td>
      <td>not-done</td>
      <td>DIC</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Immune</td>
      <td>not-done</td>
      <td>DNI</td>
      <td>Marks the matching planned event as not required. Serology report SHOULD be contained.</td>
    </tr>
    <tr>
      <td>Closed not required</td>
      <td>not-done</td>
      <td>CPI</td>
      <td>For HNZ internal use only. Marks the matching planned event as not required. No notification is sent to providers.</td>
    </tr>
    <tr>
      <td>Alternative vaccination given</td>
      <td>completed</td>
      <td>ALTGIVN</td>
      <td>This record identifies the vaccine replaced by an alternative, relevant only to NIS events</td>
    </tr>
    <tr>
      <td>Given overseas</td>
      <td>completed</td>
      <td>GIVNOS</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>Historic vaccination</td>
      <td>completed</td>
      <td>HSTGIVN</td>
      <td>A vaccination given in NZ prior to 2005 or was not recorded in NIR prior to December 2023 for which complete details are not available SHOULD have statusReason='HSTGIVN'</td>
    </tr>
    <tr>
      <td>Deleted, invalidated, duplicate of a good record</td>
      <td>entered-in-error</td>
      <td><em>any</em></td>
      <td>Does not match any planned event.</td>
    </tr>
  </tbody>
</table>

Rescheduling of events is not supported (status reason codes RESCHO, RESREF, RESTC).

Typical PMS status query (_search request) parameters are `status-reason:not-in=CPI,RESCHO,RESREF,RESTC&status:not-in=entered-in-error`

### Planned and Expected Events
Planned events based on a consumer’s schedule are represented in ImmunizationRecommendation resources. These contain a recommendation node for each Consumer Planned Event (type CPE), with a related recommendation of type Expected Event (EE) when the date is moved due to dose gap or other scheduling rules. Past recommendations can be due or overdue. Events marked as not required do not appear in the consumer’s schedule.

Appointments and rescheduled events are not recorded in the AIR.

In future, a consumer’s CarePlan resources will present Immunization and ImmunizationRecommendation together for each antigen group, where matching.

### Errors
#### System failures and rejection responses
Errors fall into several categories that depend on the issue and request type.

- HTTP status codes identify common technical faults and conditions. These are documented in the Open API Specification associated with this implementation guide. OperationOutcome diagnostics in the response contain human-readable descriptions depending on context.
- FHIR profile faults are mostly caught in the HAPI library, with diagnostics like “HAPI-nnnn: …”
- FHIR constraint violations usually repeat the text of the constraint rule in diagnostics.
- Well-formed requests can fail due to invalid values or business rule violations. In such cases the diagnostics describe the problem to be resolved.
- Refer to the Use Cases pages for example responses.

#### Data quality issue detection and remediation 
The AIR applies further checks on data quality (DQ) than specified in this Implementation Guide. These include possible and exact duplicates, deviations from ‘preferred’ value sets, event dates in the future or inconsistent with DoB, DoD or expiry dates, data missing that should be provided under specific conditions, etc.

Immunisation events containing issues cause DQ cases to be raised for follow-up by the AIR support team. DQ cases are closed automatically when underlying issues are resolved.

Each deviation is ranked and a score is calculated. Authorised applications receive DQ details in the [air-data-quality-assessment](StructureDefinition-air-data-quality-assessment.html) extension in responses to Create & Update interactions and the Immunization/_search operation.

#### Exact Duplicates: status "entered-in-error" in response
The status of the Immunization resource returned as "entered-in-error" in the response when a Create interaction is performed submitting data that exactly matches another record, apart from ModifiedSourceSystem, ModifiedBy, versionId and id. The source Application must recognise this response and invalidate its record accordingly.

### HTTP Header Details
#### Request Headers
The AIR external APIs comply with [Health New Zealand | Te Whatu Ora API Standards](https://apistandards.digital.health.nz/). In particular [Part C: Synchronous APIs: HTTP Headers](https://apistandards.digital.health.nz/api-development/Synchronous%20APIs/Headers) specifies headers that are expected in requests to AIR.

Notes:

- Some custom X- notation headers are FHIR standard, but such headers have been deprecated by HNZ. Those headers might change in future.
- Only JSON is supported by this implementation and the application must provide `Content-Type: application/jsonand Accept: application/json,version=\*`

### API Interactions and Operations
  <table class="table table-bordered table-hover table-sm">
    <tbody>
      <tr>
        <th>Category</th>
        <th>Verb</th>
        <th>Endpoint</th>
        <th>External</th>
        <th>Internal</th>
        <th>Notes</th>
      </tr>
      <tr>
        <td>Consumer</td>
        <td>GET</td>
        <td>/Patient/{NHI}</td>
        <td>N</td>
        <td>Y</td>
        <td>Returns information about the state of the consumer.</td>
      </tr>
      <tr>
        <td>Consumer</td>
        <td>POST</td>
        <td>/Patient/{NHI}/$update-state</td>
        <td>N</td>
        <td>Y</td>
        <td>Edits the consumer state information.</td>
      </tr>
      <tr>
        <td>Consumer</td>
        <td>GET</td>
        <td>/Patient/{NHI}/_history</td>
        <td>N</td>
        <td>Y</td>
        <td>Returns all versions of an ImmSOT Consumer including modification information.</td>
      </tr>
      <tr>
        <td>Immunisation</td>
        <td>GET</td>
        <td>/Immunization/_search</td>
        <td>Y</td>
        <td>Y</td>
        <td>Returns a list of immunisations the consumer has had</td>
      </tr>
      <tr>
        <td>Immunisation</td>
        <td>GET</td>
        <td>/Immunization/{ID}/_history</td>
        <td>N</td>
        <td>Y</td>
        <td>Returns all versions of this immunisation event</td>
      </tr>
      <tr>
        <td>Immunisation</td>
        <td>GET</td>
        <td>/Immunization/{ID}</td>
        <td>Y</td>
        <td>Y</td>
        <td>Returns latest version of this immunisation event only</td>
      </tr>
      <tr>
        <td>Immunisation</td>
        <td>POST</td>
        <td>/Immunization</td>
        <td>N</td>
        <td>Y</td>
        <td>Records a new immunisation event</td>
      </tr>
      <tr>
        <td>Immunisation</td>
        <td>PUT</td>
        <td>/Immunization/{ID}</td>
        <td>N</td>
        <td>Y</td>
        <td>Edits an existing immunisation event</td>
      </tr>
      <tr>
        <td>Immunisation</td>
        <td>POST</td>
        <td>/Immunization/$process-message</td>
        <td>HealthLink broker only</td>
        <td>Y</td>
        <td>Updates an existing acknowledgement from SENT to RECEIVED status. Supports co-existence with HL7 v2 messaging.</td>
      </tr>
      <tr>
        <td>Immunisation</td>
        <td>POST</td>
        <td>/Immunization/$bulk-update</td>
        <td>HealthLink broker only</td>
        <td>Y</td>
        <td>Create new immunisation events and/or Upsert immunisation events based on a matching algorithm. Operation is atomic. Supports co-existence with HL7 v2 messaging.</td>
      </tr>
      <tr>
        <td>Consumer Schedule</td>
        <td>POST</td>
        <td>/Immunization/{ID}/$match</td>
        <td>N</td>
        <td>Y</td>
        <td>Matches an immunisation event to a planned event</td>
      </tr>
      <tr>
        <td>Consumer Schedule</td>
        <td>POST</td>
        <td>/Immunization/{ID}/$unmatch</td>
        <td>N</td>
        <td>Y</td>
        <td>Unmatches an immunisation event from a planned event</td>
      </tr>
      <tr>
        <td>Consumer Schedule</td>
        <td>POST</td>
        <td>/Patient/{NHI}/$reassign-schedules</td>
        <td>N</td>
        <td>Y</td>
        <td>Updates the immunisation plan of an ImmSOT Consumer by reassessing and reassigning their schedules.</td>
      </tr>
      <tr>
        <td>Consumer Schedule</td>
        <td>GET</td>
        <td>/ImmunizationRecommendation/$view</td>
        <td>N</td>
        <td>Y</td>
        <td>Returns the planned events for the consumer</td>
      </tr>
      <tr>
        <td>Consumer Schedule</td>
        <td>GET</td>
        <td>/CarePlan/$view</td>
        <td>N</td>
        <td>Test only</td>
        <td>Returns the planned events for the consumer</td>
      </tr>
    </tbody>
  </table>
