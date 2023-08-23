## Create Immunisation Event Overview

The "create" operation is used to create a new immunisation record (event) in AIR, within the context of a plan. The request includes details of the patient who received the immunisation, the next of kin who attended the immunisation encounter, the facility where the immunisation was administered, the provider who administered it, the immunisation product administered, and optional information such as the route of administration. Matching to the patient’s planned events such as those defined by the NZ National Immunisation Schedule is outside the scope of this use case.

Normally this is used once the  [Patient](https://fhir.org.nz/ig/base/StructureDefinition-NzPatient.html) has been uniquely identified and no prior record exists of the event. Validation checks identify whether the event is valid and/or a duplicate.

Current data from NHI, NES and other data providers is used.

Failure conditions documented in this IG only include those that affect AIR or its responses.

The __FHIR API Flow__ occurs when a new immunisation event is submitted from a system compliant with the version of FHIR currently in use, e.g. when an AIR Administrator submits event data via ISM. This uses the AIR FHIR endpoint.

The __HL7v2 Flow__ occurs when event data is received from a system that requires transformation from another standard, such as a PMS using legacy HL7v2 messaging. A broker transforms requests into FHIR before invoking the main flow and provides ACK (or NACK) responses to the calling system. This uses the Healthlink Air Broker public API.

### FHIR API Create Immunisation Event Flow

#### FHIR API Sequence Diagram

<div>
{% include Immunisation-create-fhir.svg %}
</div>

#### FHIR Create Immunisation Event Processing Steps

##### FHIR Create Immunisation Event Flow

   1. Consumer sends a REST request to the AIR FHIR endpoint, passing details of the immunisation event.
   1. AIR checks that the authorization token contains the required permission; if invalid, then flow continues to [E1](#e1-create-immunisation-event-authorisation-denial).
   1. AIR checks that validation rules are met. If processing encounters a fatal error, then flow continues to [E2](#e2-create-immunisation-event-exception).
      - This could require calls to other Te Whatu Ora Health Identity data providers (not shown).
      - In most cases AIR will persist the event without error, though it will include issues in the [DataQualityAssessment](StructureDefinition-air-data-quality-assessment.html) segment of the response.
      - DataQualityAssessment information is not persisted in AIR.
   1. AIR checks for duplicates of the event; if an exact duplicate, then AIR will accept the event but return an [entered-in-error](http://hl7.org/fhir/codesystem-flag-status.html) status in the response.
   1. AIR saves the new version of the event to its database.
   1. AIR prepares the response, which includes the Immunisation Event enriched with data from other data providers (not shown).
      - The response body takes the form of a FHIR message containing a bundle that includes the [OperationOutcome](http://hl7.org/fhir/R4/operationoutcome.html) and its [DataQualityAssessment](StructureDefinition-air-data-quality-assessment.html). [FHIR messaging](https://www.hl7.org/fhir/R4/messaging.html) structure is used to enable support for legacy message-based HL7v2 systems using the broker (refer to [HL7v2 Flow](#hl7v2-create-immunisation-event-flow) below).
      - This could add further issues to the DataQualityAssessment.
      - FHIR R4 specifies that the id from the message header provides control that links to the original request.
   1. AIR returns the Immunisation Event to the Consumer.
   1. Flow ends.

##### E1 Create Immunisation Event Authorisation Denial

   1. AIR returns a relevant error message and response to the Consumer (4xx), such as indicating that the user does not have the required scope to create an immunisation record.
   1. Flow ends.

##### E2 Create Immunisation Event Exception

   1. AIR returns a relevant error message to Consumer, such as an internal server error (5xx).
   1. Flow ends.


### HL7 v2.0 Create Immunisation Event Flow (VX04)

#### HL7v2 Sequence Diagram

Where a PMS communicates with NIR via Healthlink and is still in the process of implementing the FHIR API, event data is delivered legacy HL7v2 messaging. The Healthlink AIR Broker transforms requests into FHIR before invoking the FHIR API, and provides ACK (or NACK) responses to the calling system. This API will be sunsetted in the future.

<div>
{% include Immunisation-create-hl7v2.svg %}
</div>

#### HL7v2 Create Immunisation Event Processing Steps

*This flow describes temporary support provided for legacy systems, by wrapping around the FHIR API Flow.*

##### HL7v2 Create Immunisation Event Flow

   1. The Consumer sends a message to the Healthlink Air Broker public end point (eg. a HL7v2 PMS via EDI), passing details of the immunisation event.
   1. The broker transforms the request into FHIR. If an error occurs, flow continues in [E3](#e3-hl7v2-create-immunisation-event-exception).
   1. The broker sends the transformed request to the AIR FHIR endpoint in a synchronous request.
   1. Invoke FHIR API Flow with the broker as its Consumer. If an error or authorisation denial occurs, flow continues in [E3](#e3-hl7v2-create-immunisation-event-exception).
   1. The broker transforms the FHIR bundle into an ACK^V04 positive acknowledgement message.
   1. The broker sends the acknowledgement message to the Consumer.
   1. Flow ends.


##### E3 HL7v2 Create Immunisation Event Exception

   1. The broker prepares a negative ACK^V04 acknowledgement message (NACK).
   1. The broker sends the negative acknowledgement message to the Consumer.
   1. Flow ends.


### Dependencies

[Immunisation Update Message](immunisationUpdateMessage.html) depends on the created event.

[Read Immunisation Event](immunisationEventRead.html) retrieves an event created using this operation.

[Update Immunisation Event](immunisationEventUpdate.html) updates an event created using this operation.

[Search Immunisations](immunisationEventSearch.html) identifies events created using this operation.
