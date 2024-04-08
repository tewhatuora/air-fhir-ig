## Read Immunisation Event Overview

*Status: rough draft*

The "read" operation is used to retrieve an immunisation record (event) from AIR. The response includes details of the specified patient, the next of kin who attended the immunisation encounter, the facility where the immunisation was administered, the provider who administered it, the immunisation product administered, and optional information such as the route of administration. Current data from NHI, NES and other data providers is used.

Validation checks identify whether the request is valid and identifies an existing record. Failure conditions documented in this IG only include those that affect AIR or its responses.

If the patient has opted to suppress access to their immunisation records, the read request will return an empty Resource having the meta.security element set to "REDACTED" (redacted).

The __[FHIR API Flow](#fhir-read-immunisation-event-flow)__ occurs when the request is submitted from a system compliant with the version of FHIR currently in use, e.g. when an AIR Administrator submits event data via ISM. This uses the AIR FHIR endpoint.

The __[HL7v2 Flow](#hl7-v20-read-immunisation-event-flow-v04)__ occurs when the request is received from a system that requires transformation from another standard, such as a PMS using legacy HL7v2 messaging. A broker transforms requests into FHIR before invoking the main flow and messages the response to the calling system. This uses the Healthlink Air Broker public API.

### FHIR API Read Immunisation Event Flow

#### FHIR API Sequence Diagram

<div>

</div>

#### FHIR Read Immunisation Event Processing Steps

##### FHIR Read Immunisation Event Flow

   1. ...
   1. AIR returns the Immunisation Event to the Consumer.
   1. Flow ends.

##### E1 Read Immunisation Event Authorisation Denial

   1. AIR returns a relevant error message and response to the Consumer (4xx), such as indicating that the user does not have the required scope to view an immunisation record.
   1. Flow ends.

##### E2 Read Immunisation Event Exception

   1. AIR returns a relevant error message to Consumer, such as an internal server error (5xx).
   1. Flow ends.


### HL7 v2.0 Read Immunisation Event Flow (V04)

#### HL7v2 Sequence Diagram

Where a PMS communicates with NIR via Healthlink and is still in the process of implementing the FHIR API, event data is delivered legacy HL7v2 messaging. The Healthlink AIR Broker transforms requests into FHIR before invoking the FHIR API, and provides ACK (or NACK) responses to the calling system. This API will be sunsetted in the future.

<div>

</div>

#### HL7v2 Read Immunisation Event Processing Steps

*This flow describes temporary support provided for legacy systems, by wrapping around the FHIR API Flow.*

##### HL7v2 Read Immunisation Event Flow

   1. ...
   1. The broker sends the message to the Consumer.
   1. Flow ends.


##### E3 HL7v2 Read Immunisation Event Exception

   1. The broker prepares a negative ACK^V04 acknowledgement message (NACK).
   1. The broker sends the negative acknowledgement message to the Consumer.
   1. Flow ends.


### Dependencies

[Immunisation Update Message](immunisationUpdateMessage.html) depends on the created event.

[Create Immunisation Event](immunisationEventCreate.html) creates an event that can be retrieved using this operation.

[Update Immunisation Event](immunisationEventUpdate.html) updates an event that can be retrieved using this operation.

[Search Immunisations](immunisationEventSearch.html) identifies events that can be retrieved using this operation.

