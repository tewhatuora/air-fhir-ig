### Overview
The AIR validates Immunisation Events during create and update operations to identify potential and exact duplicates. The definition of a duplicate is where ImmSOT holds multiple immunisation event records for one immunisation event.

**Exact duplicates,** where all non-system fields are equal, are handled prior to being saved in the AIR. **Potential duplicates** are close copies that require administrative review to resolve after being saved in the AIR.

### Eligibility criteria for duplicate checking
Existing immunisation events satisfying these conditions with respect to the new immunisation event is eligible for duplicate checking:

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
* Immunisation event date (occurrenceDateTime) same day NZ time, or same instant for "double-dose" vaccines (CVX 43, CVX 93 and NZVX 99009)
* conditionally dose number and/or indication

Potential duplicates can occur any time. When the record is identified as potential duplicate, then the submitted status of the record being created or updated is kept and the record is saved. Matching immunisation records will be flagged as duplicates so that an AIR Admin can retrieve and resolve the issue. The Admin may change the status of one to "Entered in Error", triggering a 'delete' notification to the source PMS and the patient's enrolled GP.

### By Operation

**Create:** When a record is identified as an exact duplicate during a create operation, the status of the updated record is changed to "Entered in Error" with status reason SNOMED 445672005, "Duplicate report". This leaves the duplicate unaffected.

**Update:** When an update makes it an Exact or Potential Duplicate of another record, the submitted record is updated and a Potential Duplicate quality violation is raised.

**Bulk Update (HealthLink AIR Broker only):** both Add and Update HL7 messages to the broker (RXA-19 = 'A' or 'U') use Upsert logic in the AIR.
* This works by seeking a record to update and updates it if the only record meeting the criteria, avoiding duplication in most cases. If the source system has a duplicate or close copy, AIR will have one record mapping to more than one at source.
* If multiple update candidates are found in AIR, a new record is created with a Data Quality violation due to uncertainty about which one was the target.
* If no records meet the criteria, the submitted record is created.

Delete HL7 messages (RXA-19 = 'D') are translated as having status 'entered-in-error'. The AIR finds one matching record and marks it entered-in-error.
* If this was sent due to a duplicate record in the source system being invalidated, then it could invalidate the only record held in AIR.
* Alternatively, if this clears a Potential Duplicate violation in AIR, AIR could be left with a completed immunisation the PMS intended to remove.

See the relevant Use Case pages for example responses. API clients are required to anticipate these outcomes and provide a suitable user experience when they occur. Note that significant changes have been made in version 2 of the API, aiming to reduce the frequency of duplicates and responses requiring user action.

### Duplicate Record Scenarios
\* marks changes in version 2 of the API from version 1 (this version).

<table class="table table-bordered table-condensed">
 <thead>
  <tr>
   <th rowspan=2 style="background-color: #eeeeee">Endpoint</th>
   <th colspan=2 style="background-color: #eeeeee">Potential Duplicate</th>
   <th colspan=2 style="background-color: #eeeeee"Exact Duplicate</th>
  </tr>
  <tr>
   <th style="background-color: #eeeeee">Normal behaviour</th>
   <th style="background-color: #eeeeee">Double-Dose</th>
   <th style="background-color: #eeeeee">Normal behaviour</th>
   <th style="background-color: #eeeeee">Double-Dose</th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td><div><p>Create</p></div></td>
   <td><div><p>Create new record, raise DQ</p></div></td>
   <td><div><p>Create new record, no DQ</p></div></td>
   <td colspan=2><div><p>entered-in-error, Duplicate report*</p></div></td>
  </tr>
  <tr>
   <td><div><p>Update</p></div></td>
   <td><div><p>Apply update, raise DQ</p></div></td>
   <td><div><p>Apply update, no DQ</p></div></td>
   <td><div><p>Apply update, raise DQ*</p></div></td>
   <td><div><p>Apply update, no DQ*</p></div></td>
  </tr>
  <tr>
   <td><div><p>Bulk Update (HL Broker only)</p></div></td>
   <td><div><p><b>Single match:</b> update existing record<br />
     <b>Multiple matches:</b> create new record, raise DQ</p></div></td>
   <td><div><p>If time and/or body site differ, create new record, no DQ</p></div></td>
   <td colspan=2><div><p><b>Single match:</b> update existing record*<br />
     <b>Multiple matches:</b> create new record, entered-in-error, Duplicate report*</p></div></td>
  </tr>
 </tbody>
</table>
