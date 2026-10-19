### Overview
The AIR validates Immunisation Events during create and update operations to identify potential and exact duplicates. The definition of a duplicate is where ImmSOT holds multiple immunisation event records for one immunisation event.

**Exact duplicates,** where all non-system fields are equal, are handled prior to being saved in the AIR. **Potential duplicates** are close copies that require administrative review to resolve some time later.

In case of potential duplicate the immunisation records will be created or updated in ImmSOT and the matching immunisation records will be flagged as duplicate so that an Air Admin can retrieve them and work on fixing them later.

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
* Immunisation event date (occurrenceDateTime) same day NZ time, or same instant for CVX 43, CVX 93 and NZVX 99009
* conditionally dose number and/or indication

The potential duplicate check is modified for "double dose" vaccines, requiring event time and body site exactly equal for them to be considered.

Potential duplicates can occur in almost all operations. When the record is identified as potential duplicate, then the status of the record being created or updated does not change and the record is saved. The matching immunisation records will be flagged as duplicates so that an AIR Admin can retrieve and fix them later. At that point the status of one of them may change to "Entered in Error", resulting in a duplicate resolution event being published.

### By Operation

**Create:** When a record is identified as an exact duplicate during a create operation, the status of the updated record is changed to "Entered in Error" with status reason SNOMED 445672005, "Duplicate report". This leaves the duplicate unaffected.

**Update:** When an update submits an Exact or Potential Duplicate of another record, the matching record is updated and a Potential Duplicate quality violation is raised.

**Bulk Update (HL Broker only):** both Add and Update messages to the broker (RXA-19 = 'A' or 'U') use Upsert logic in the AIR. This works by seeking a record to update and updates it if the only record meeting the criteria. If multiple update candidates are found, a new record is created with a Data Quality violation due to uncertainty about which one was the target. If no records meet the criteria, the submitted record is created.

Delete messages (RXA-19 = 'D') are translated as having status 'entered-in-error'. The AIR finds one matching record and marks it entered-in-error. This risks clearing a Potential Duplicate violation and leaving AIR with a completed immunisation the PMS intended to remove.

See the relevant Use Case pages for example responses. API clients are required to anticipate these outcomes and provide a suitable user experience when they occur. Note that significant changes have been made in version 2 of the API, aiming to reduce the frequency of duplicates and responses requiring user action.

### Duplicate Record Scenarios
\* = changes in version 2 of the API from version 1 (this version).

<table border=>
 <tr>
  <th rowspan=2>Endpoint</th>
  <th colspan=2>Potential Duplicate</th>
  <th colspan=2>Exact Duplicate</th>
 </tr>
 <tr>
  <th>Normal behaviour</th>
  <th>Double-Dose</th>
  <th>Normal behaviour</th>
  <th>Double-Dose</th>
 </tr>
 <tr>
  <td>Create</td>
  <td>Create new record, raise DQ</td>
  <td>Create new record, no DQ</td>
  <td colspan=2>entered-in-error, Duplicate report*</td>
 </tr>
 <tr>
  <td>Update</td>
  <td>Apply update, raise DQ</td>
  <td>Apply update, no DQ</td>
  <td>Apply update, raise DQ*</td>
  <td>Apply update, no DQ*</td>
 </tr>
 <tr>
  <td>Bulk Update (HL Broker only)</td>
  <td><b>Single match:</b> update existing record<br />
    <b>Multiple matches:</b> create new record, raise DQ</td>
  <td>If time and/or body site differ, create new record, no DQ</td>
  <td colspan=2><b>Single match:</b> update existing record*<br />
    <b>Multiple matches:</b> create new record, entered-in-error, Duplicate report*</td>
 </tr>
</table>
