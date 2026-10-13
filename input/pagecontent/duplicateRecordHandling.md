### Overview
The AIR validates Immunisation Events during create and update operations to identify potential and exact duplicates. 

Exact duplicates are handled at the time of submission, prior to being saved in ImmSOT. Potential duplicates are close copies that require administrative review to resolve some time later.

When a record is identified as an exact duplicate during a create operation, then no record is created and the original is returned with a meta tag indicating what has happened. In the rare scenario where multiple duplicates are found, the latest is returned.

When an exact duplicate is found during an update, the status of the immunisation record being updated will be changed to "Entered in Error" with status reason "Duplicate report". This leaves the duplicate unaffected, while a duplicate resolution event is published via NEMS citing the AIR Identifiers of both records.

When the record is identified as potential duplicate then the status of the record being created or updated does not change. The matching immunisation records will be flagged as duplicate so that an AIR Admin can retrieve them and fix them later. At that point the status of one record may change to "Entered in Error", resulting in a duplicate resolution event being published.

Upsert works by seeking a record to update and updates it if unambiguously the same record. If an exact duplicate, the original is returned with the meta tag and no update occurs. Multiple potential duplicates result in a data quality condition due to the ambiguity.

The potential duplicate check is modified for "double dose" vaccines, requiring near-exact timing to be considered.

API clients are required to anticipate these outcomes.

### Immunisation events eligibility criteria for duplicate checking
Existing immunisation events satisfying these conditions with respect to the new immunisation event are eligible for duplicate checking:

* latest version

* same event date (occurrence date or datetime within 1s for double-dose)

* modified date today or earlier

* not entered-in-error status

* same consumer (any linked NHI)

### Duplicate Identification Criteria
The definition of a duplicate is where ImmSOT holds multiple immunisation event records for one immunisation event.

There are two types of duplicates:
* Exact duplicate (applies only for create and update immunisation event) are where two or more immunisation events match on:

    * every data field (incl. NHI) except for the AIR Identifier, version, modified date and source system.
    
    **Note - Exact duplicates are likely triggered by duplicate manual entry or incorrect operational procedure (e.g. creating a new record instead of correcting a previous one).**

* A potential duplicate data quality condition applies in cases of “Create” or “Update” immunisation event, and $upsert when multiple similar records are found. These are where two or more immunisation events are not exact duplicates and match on:

    * consumer - a consumer has one active NHI and may have many dormant NHIs. AIR needs to check if there’s potential duplicates across all NHIs for the consumer, not just the active NHI.

    * Vaccination code and dose number

    * Immunisation event date, or datetime within 1s for CVX 43, CVX 93 and NZVX 99009
