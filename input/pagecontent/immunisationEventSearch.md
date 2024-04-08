## Search Immunisation Event Overview

*Status: rough draft*

When a health worker wishes to view a consumers vaccination history they will bring up the consumer’s record and then a search of their immunisations will be initiated.  The NHI number will be used to do a call to the immunisation data store, and an array of immunisation events will be returned.

The "search" operation is used to search patient immunisation events. This method takes NHI, date range, facility-Id and dq_status and returns the FHIR bundle, which is a collection of immunisation event resources. Data outgoing from the immunisation data store is enriched with data from NHI, NES and other data providers.

Validation checks verify whether the request is valid and identifies any existing records. Failure conditions documented in this IG only include those that affect AIR or its responses.

If the patient has opted to suppress access to their immunisation records, the search request will return an empty bundle having the meta.security element set to "REDACTED" (redacted).

The __[FHIR API Flow](#fhir-search-immunisation-event-flow)__ occurs when the request is submitted from a system compliant with the version of FHIR currently in use, e.g. when an AIR Administrator submits event data via ISM. This uses the AIR FHIR endpoint.

The __[HL7v2 Flow](#hl7-v20-search-immunisation-event-flow-v01-v03)__ occurs when the request is received from a system that requires transformation from another standard, such as a PMS using legacy HL7v2 messaging. A broker transforms requests into FHIR before invoking the main flow and messages the response to the calling system. This uses the Healthlink Air Broker public API.

### FHIR API Search Immunisation Event Flow

#### FHIR API Sequence Diagram

<div>

</div>

#### FHIR Search Immunisation Event Processing Steps

##### FHIR Search Immunisation Event Flow

   1. ...
   1. AIR returns the bundle of Immunisation Events to the Consumer.
   1. Flow ends.

##### E1 Search Immunisation Event Authorisation Denial

   1. AIR returns a relevant error message and response to the Consumer (4xx), such as indicating that the user does not have the required scope to view an immunisation record.
   1. Flow ends.

##### E2 Search Immunisation Event Exception

   1. AIR returns a relevant error message to Consumer, such as an internal server error (5xx).
   1. Flow ends.


### HL7 v2.0 Search Immunisation Event Flow (V01/V03)

#### HL7v2 Sequence Diagram

Where a PMS communicates with NIR via Healthlink and is still in the process of implementing the FHIR API, event data is delivered legacy HL7v2 messaging. The Healthlink AIR Broker transforms requests into FHIR before invoking the FHIR API, and provides ACK (or NACK) responses to the calling system. This API will be sunsetted in the future.

<div>

</div>

#### HL7v2 Search Immunisation Event Processing Steps

*This flow describes temporary support provided for legacy systems, by wrapping around the FHIR API Flow.*

##### HL7v2 Search Immunisation Event Flow

   1. ...
   1. The broker sends the message to the Consumer.
   1. Flow ends.


##### E3 HL7v2 Search Immunisation Event Exception

   1. The broker prepares a negative ACK^V04 acknowledgement message (NACK).
   1. The broker sends the negative acknowledgement message to the Consumer.
   1. Flow ends.

   ### Notes

   1. AIR does not maintain a complete record of Practitioner details, but instead uses the HPI service (see the HPI Implementation Guide at https://hpi-ig.hip.digital.health.nz/index.html) to ensure a joined-up, consistent source of practitioner information. In a few cases, health providers have opted for their details not to be shared via the HPI service. When AIR retrieves one of these practitioner records in response to an _include parameter in a search request, it will appear in the AIR payload as is shown here: https://hpi-ig.hip-uat.digital.health.nz/StructureDefinition-HPIPractitioner.html#redacted-practitioner-details. The search result bundle will also contain an OperationOutcome resource including the explanatory text "No Practitioner name".



### Dependencies

[Create Immunisation Event](immunisationEventCreate.html) creates an event that can be searchd using this operation.

[Read Immunisation Event](immunisationEventRead.html) retrieves an event searchd using this operation.

[Search Immunisations](immunisationEventSearch.html) identifies events searchd using this operation.

