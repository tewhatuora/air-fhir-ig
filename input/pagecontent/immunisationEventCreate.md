## Create (record) Immunisation Event Overview

The "create" operation is used to create a new immunisation record (event) in AIR, often within the context of a plan. The request includes details of the patient who received the immunisation, the next of kin who attended the immunisation encounter, the facility where the immunisation was administered, the provider who administered it, the immunisation product administered, and optional information such as the route of administration and serology results. Refer to [Resource Profile: AIR Immunization](StructureDefinition-air-immunization.html) for details.

Normally this is used once the [Patient](StructureDefinition-air-patient.html) has been uniquely identified and no prior record exists of the event. Validation checks identify whether the event is valid and/or a duplicate. Matching to the patient’s planned events such as those defined by the NZ National Immunisation Schedule is outside the scope of this use case.

It is the responsibility of the integrating application to supply correct Patient NHI number, facility and other codes. AIR will save a record provided the integrating application is authorised, the request is valid, the bundle passes FHIR validation and code/id format and checksums are correct. Exact duplicates received less than 60 minutes apart are marked with status ‘entered-in-error’.

The [__FHIR API Flow__](#fhir-api-create-immunisation-event-flow) occurs when a new immunisation event is submitted from a system compliant with the version of FHIR currently in use, e.g. when an AIR Administrator submits event data via ISM. This uses the AIR Immunisation endpoint.

The [__HL7 v2.0 Flow__](#hl7-v20-create-immunisation-event-flow-vx04) occurs when event data is received from a system that requires transformation from another standard, such as a PMS using legacy HL7v2 messaging. A broker transforms requests into FHIR before invoking the main flow and provides (N)ACK responses to the calling system. This uses the Healthlink Air Broker public API.

### FHIR API Create Immunisation Event Flow

#### FHIR API Sequence Diagram

<div>
{% include Immunisation-create-fhir.svg %}
</div>

#### FHIR Create Immunisation Event Processing Steps

##### FHIR Create Immunisation Event Flow

   1. Integrating application sends a REST POST request to the AIR Immunisation endpoint, passing details of the immunisation event in a FHIR bundle.
   1. AIR checks that the authorization token contains the required permission; if invalid, then flow continues to [E1](#e1-create-immunisation-event-authorisation-denial).
      - If at any stage the server encounters an unrecoverable internal error, then flow continues to [E2](#e2-create-immunisation-event-exception).
   1. AIR checks that validation rules are met. If a critical fault exists in the request, then it is rejected and flow continues to [E2](#e2-create-immunisation-event-exception).
      - In most cases AIR will persist the event without error, though it will include issues in the [DataQualityAssessment](StructureDefinition-air-data-quality-assessment.html) segment of the response.
      - DQ information is persisted in AIR for reporting and problem resolution.
      - AIR checks for duplicates of the event; if an exact duplicate is received within a specific period (60 minutes), then AIR will accept the record but return an [entered-in-error](http://hl7.org/fhir/codesystem-flag-status.html) status in the response.
   1. AIR saves the new event to its database.
   1. AIR prepares the response, which includes a DQ segment if the score is not 100%.
      - The response body takes the form of a FHIR bundle that includes the [OperationOutcome](http://hl7.org/fhir/R4/operationoutcome.html) and its [DataQualityAssessment](StructureDefinition-air-data-quality-assessment.html). 
   1. AIR returns a 201 status with the response to the Integrating application.
   1. Flow ends.

##### E1 Create Immunisation Event Authorisation Denial

   1. AIR returns a relevant HTTP status code to the Integrating application (4xx), indicating that the user does not have the required scope to create an immunisation record.
   1. Flow ends.

##### E2 Create Immunisation Event Exception

   1. AIR returns a relevant error message to Integrating application, such as an internal server error (5xx) or rejection (4xx).
   1. Flow ends.


### HL7 v2.0 Create Immunisation Event Flow (VX04)

#### HL7v2 Sequence Diagram

Where a PMS communicates with NIR via Healthlink and is still in the process of implementing FHIR, event data is delivered (asynchronously) via legacy HL7v2 messaging. The Healthlink AIR Broker transforms requests into FHIR before invoking the FHIR synchronous API, and provides ACK (or NACK) responses to the calling system. This API will be sunsetted in the future.

<div>
{% include Immunisation-create-hl7v2.svg %}
</div>

#### HL7v2 Create Immunisation Event Processing Steps

*This flow describes temporary support provided for legacy systems, by wrapping around the FHIR API Flow.*

##### HL7v2 Create Immunisation Event Flow

   1. The Legacy application sends a message to the Healthlink Air Broker public end point (eg. a HL7v2 PMS via EDI), passing details of the immunisation event.
   1. The Broker checks authorisation of the request. If not permitted, flow continues in [E3](#e3-hl7v2-create-immunisation-event-failure).
   1. The Broker transforms the request into FHIR. If an error occurs, flow continues in [E3](#e3-hl7v2-create-immunisation-event-failure).
   1. The Broker sends the transformed request to the AIR Immunisation endpoint in a synchronous request.
      - To identify Facility, the Broker maps between the EDI mailbox identifier, HPI-f and Health ID when transforming requests.
   1. The Broker sends the transformed request to the AIR FHIR endpoint in a synchronous request.
      - This invokes the [FHIR API Flow](#fhir-create-immunisation-event-flow) with the broker as the Integrating application.
      - If a permanent error or rejection occurs, flow continues in [E3](#e3-hl7v2-create-immunisation-event-failure).
      - If a temporary error occurs, the Broker will retry the request later.
   1. The Broker transforms the FHIR bundle into an ACK^V04 positive acknowledgement message.
   1. The Broker sends the acknowledgement message to the Legacy application.
   1. Flow ends.


##### E3 HL7v2 Create Immunisation Event Failure

   1. The Broker prepares a negative ACK^V04 message (NACK).
   1. The Broker sends the negative acknowledgement message to the Legacy application.
   1. Flow ends.


### Dependencies

[Immunisation Update Message](immunisationUpdateMessage.html) depends on the created event.

[Read Immunisation Event](immunisationEventRead.html) retrieves an event created using this operation.

[Update Immunisation Event](immunisationEventUpdate.html) updates an event created using this operation.

[Search Immunisations](immunisationEventSearch.html) identifies events created using this operation.
