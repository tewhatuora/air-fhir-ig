### Overview
The AIR validates Immunisation Events during create and update operations to identify potential and exact duplicates. The definition of a duplicate is where ImmSOT holds multiple immunisation event records for one immunisation event.

**Exact duplicates,** where all non-system fields are equal, are handled prior to being saved in the AIR. **Potential duplicates** are close copies that require administrative review to resolve some time later.

### Eligibility criteria for duplicate checking
Existing immunisation events satisfying these conditions with respect to the new immunisation event are eligible for duplicate checking:

* latest version

* same event date (occurrence date or datetime within 1s for double-dose)

* modified date today or earlier

* not entered-in-error status

* same consumer (any linked NHI)

### Duplicate Identification Criteria

**Exact duplicates** are where two or more immunisation events match on:

* every data field (incl. NHI) except for the AIR Identifier, version, modified date and source system.

* **Exact duplicates likely are triggered by duplicate manual entry or incorrect operational procedure,** e.g. creating a new record instead of correcting a previous one.

**Potential duplicate** Data Quality violations apply when two or more immunisation events are not exact duplicates, yet match on:

* consumer - a consumer has one active NHI and may have many dormant NHIs. AIR needs to check if there’s potential duplicates across all NHIs for the consumer, not just the active NHI.
* Vaccination code
* Immunisation event date (occurrenceDateTime) same day NZ time, or same instant for CVX 43, CVX 93 and NZVX 99009
* conditionally dose number and/or indication

The potential duplicate check is modified for "double dose" vaccines, requiring event times exactly equal for them to be considered.

### By Operation
Potential duplicates can occur in almost all operations. When the record is identified as potential duplicate, then the status of the record being created or updated does not change. The matching immunisation records will be flagged as duplicates so that an AIR Admin can retrieve them and fix them later. At that point the status of one of them may change to "Entered in Error", resulting in a duplicate resolution event being published.

**Create:** When a record is identified as an exact duplicate during a create operation, then no record is created and the original is returned with a meta tag indicating what happened. In rare cases where multiple are found, the latest is returned.

**Update:** When an update submits an exact duplicate of another record, the status of the incoming record is changed to "Entered in Error" with status reason "Duplicate report". This leaves the duplicate unaffected, while a duplicate resolution event is published via NEMS citing the AIR Identifiers of both records.

**Upsert:** Upsert works by seeking a record to update and updates it if unambiguously the same record, avoiding single potential duplicate secenarios. Multiple potential duplicates result in a Data Quality violation due to the ambiguity. If one or more exact duplicates were found, the (latest) original is returned with the meta tag and no update occurs.

See the relevant Use Case pages for example responses. API clients are required to anticipate these outcomes.
