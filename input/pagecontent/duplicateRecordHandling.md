### Overview
ImmSOT will validate the Immunisation Events during create and update operations to identify potential duplicates, and during the create operation to identify exact duplicate records.

When a record is identified as an exact duplicate then the status of the immunisation record being created will be changed to “Entered in Error”. When the record is identified as potential duplicate then the status for the record being created or updated will not change.

In case of potential duplicate the immunisation records will be created or updated in ImmSOT and the matching immunisation records will be flagged as duplicate so that an Air Admin can retrieve them and work on fixing them later.

### Immunisation events eligibility criteria for duplicate checking
Existing immunisation events satisfying these conditions with respect to the new immunisation event is eligible for duplicate checking:

* latest version

* same event date(occurrence date)

* modified date today or earlier

* not entered-in-error status

* same consumer

### Duplicate Identification Criteria
The definition of a duplicate is where ImmSOT holds multiple immunisation event records for one immunisation event.

There are two types of duplicates:
* Exact duplicate( applies only for “Create” immunisation event)  are where two or more immunisation events match on 

    * every data field(inc NHI) except for the id, ImmSOT ID, version, modified date. Refer to Immunisation Event Data Fields - Aotearoa Immunisation Register (formerly NIS) - Confluence (atlassian.net). 
    
    **Note - Exact duplicate are likely triggered by duplicate manual entry or incorrect operational procedure (e.g. creating a new record instead of correcting a previous one).**

* Potential duplicate ( applies in case of “Create” or “Update”  immunisation event) are where two or more immunisation events are not exact duplicate and have a match on:

    * consumer (a consumer may have an active NHI and many dormant NHIs. We need to check if there’s potential duplicates across all NHIs for the consumer, not just the active NHI)

    * Vaccination code and dose number

    * Immunisation event date
