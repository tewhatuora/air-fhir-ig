### Overview
The AIR validates Immunisation Events during create and update operations to identify potential and exact duplicates. The definition of a duplicate is where ImmSOT holds multiple immunisation event records for one immunisation event.

**Exact duplicates,** where all non-system fields are equal, are handled prior to being saved in the AIR. **Potential duplicates** are close copies that require administrative review to resolve some time later.

### Eligibility criteria for duplicate checking
Existing immunisation events satisfying these conditions with respect to the submitted immunisation event are eligible for duplicate checking:

* latest version
* event date (occurrenceDateTime same day NZ time, or exact datetime for double-dose and exact duplicate checks)
* modified date today or earlier
* not entered-in-error status
* same consumer (for partial duplicate checks, any linked NHI)

### Duplicate Identification Criteria

**Exact duplicates** are where two or more immunisation events match on:

* all non-system field values, including:
  * patient reference (NHI number),
  * immunisation details,
  * location references (facility and mobile site id),
  * related person (NoK or accompanying adult) contact details,
  * actor (practitioner) identifiers and functions, and
  * serology results.
* System fields not considered are the AIR Identifier, version, modified date and source system.
* **Exact duplicates likely are triggered by duplicate manual entry** or incorrect operational procedure, e.g. creating a new record instead of correcting a previous one.

**Potential duplicate** Data Quality violations are raised when two or more immunisation events are not exact duplicates, yet match on:

* consumer - a consumer has one active NHI and may have many dormant NHIs. AIR needs to check if there’s potential duplicates across all NHIs for the consumer, not just the active NHI.
* Vaccine CVX or NZVX code
* Immunisation event date (occurrenceDateTime) same day NZ time, or same instant for CVX 43, CVX 93 and NZVX 99009
* conditionally dose number and/or indication

The potential duplicate check is modified for "double dose" vaccines, requiring event time and body site exactly equal for them to be considered.

Potential duplicates can occur in almost all operations. When the record is identified as potential duplicate, then the status of the record being created or updated does not change and the record is saved. The matching immunisation records will be flagged as duplicates so that an AIR Admin can retrieve and fix them later. At that point the status of one of them may change to "Entered in Error", resulting in a duplicate resolution event being published.

### By Operation

**Create:** When a record is identified as an exact duplicate during a create operation, then no record is created and the existing record is returned with a meta tag `exact-duplicate-not-created` indicating what happened. In rare cases where multiple are found, the latest is returned.

**Update:** When an update submits an exact duplicate of another record, the status of the updated record is changed to "Entered in Error" with status reason SNOMED 445672005, "Duplicate report". This leaves the duplicate unaffected, while a duplicate resolution event is published via NEMS citing the AIR Identifiers of both records.

**Upsert:** Upsert works by seeking a record to update and updates it if the only record meeting the criteria. Multiple potential duplicates result in a Data Quality violation due to the ambiguity. If one or more exact duplicates were found, the (latest) original is returned with the meta tag and no update occurs.

See the relevant Use Case pages for example responses. API clients are required to anticipate these outcomes and provide a suitable user experience when they occur.

### Duplicate Record Scenarios
\* = change in version 2 of the API from version 1.

<table class="table table-bordered table-hover table-sm">
 <tr>
  <th rowspan=2 style="background-color: #eeeeee">Endpoint</th>
  <th colspan=2 style="background-color: #eeeeee">Potential Duplicate</th>
  <th colspan=2 style="background-color: #eeeeee">Exact Duplicate</th>
 </tr>
 <tr>
  <th style="background-color: #eeeeee">Normal behaviour</th>
  <th style="background-color: #eeeeee">Double-Dose</th>
  <th style="background-color: #eeeeee">Normal behaviour</th>
  <th style="background-color: #eeeeee">Double-Dose</th>
 </tr>
 <tr>
  <td><div><p>Create</p></div></td>
  <td><div><p>Create new record, raise DQ</p></div></td>
  <td><div><p>Create new record, no DQ</p></div></td>
  <td colspan=2><div><p>Return existing record with meta tag, HTTP status 200*</p></div></td>
 </tr>
 <tr>
  <td><div><p>Update</p></div></td>
  <td><div><p>Apply update, raise DQ</p></div></td>
  <td><div><p>Apply update, no DQ</p></div></td>
  <td colspan=2><div><p>entered-in-error, Duplicate report*</p></div></td>
 </tr>
 <tr>
  <td><div><p>Upsert</p></div></td>
  <td><div><p><b>Single match:</b> update existing record<br />
    <b>Multiple matches:</b> create new record, raise DQ</b></p></div></td>
  <td><div><p>If time and/or body site differ, create new record, no DQ</p></div></td>
  <td colspan=2><b>Single match:</b> return existing record with meta tag, HTTP status 200*<br/>
    <b>Multiple matches:</b> return existing record with meta tag, HTTP status 200*</p></div></td>
 </tr>
</table>
