
## Immunisation Update Message Overview

An ‘Immunisation Update Message’ interaction is initiated by ImmSOT  when it wishes  to notify interested parties that a new immunisation has been recorded or an existingg immunisation is updated.
The request includes details of the patient who received the immunisation, the next of kin who attended the immunisation encounter, the immunisation itself,  and the PMS systems to which the message should be sent.
At a later time, after the health provider has processed the request, they send a response back to the nominated endpoint indicating if the immunisation request has been accepted or declined.

### Immunisation Update Message Request



<div>
{% include Immunisation-update-request.svg %}
</div>



####  Immunisation Update Message Request processing steps:

1. ISM sends a REST create request to the ImmSOT Immunization endpoint, passing in the details of the immunisation
2. ImmSOT creates the immunisation record
3. ImmSOT  creates a message bundle containing an Immunisation resource, and sends it it to the AIR Orchestration server's *$process-message* endpoint. (EventType=IMMUNISATION_UPDATE)
4. The Orchestration server enriches the Patient reference with additional patient details
5. The Orchestration server determines which PMS systems should be notified of the new Immunisation, based on the value of the *air-immunisation-notification-action-code*. 
6. The Orchestration server gets the facility id and edi of the nominated target PMS systems 
7. The Orchestration server creates a message for  each target PMS  and sends it to the Healthlink Air Broker
8. The Healthlink Air Broker transforms the message to an HL7 v2.0  VXU^V04 request and sends it to the PMS
9. The Healthlink Air Broker returns a synchronous 202 response to the Orchestration server
10. Once it has recieved responses form each request sent to the HealthLink AIR broker, the Orchestration  server sendsa  synchronous 202 response to  ImmSOT, containing information about each message which was sent.

####  Immunisation Update Message Request Example - ImmSOT To Orchestration
[update-immunisation-request2](Bundle-82020189.json.html)

####  Immunisation Update Message Request Example - Orchestration To HealthLink
[update-immunisation-request1](Bundle-72178030.json.html)

#### Business Rules

1. Requests which specify a processing flag value of 'D' in the bundle *meta.tag[0].code* element should be treated as debug messages. The server must ensure that processing these messages results in no change to production data. They server should return a success response to indicate that it is healthy, and failure  response to indicate that it is unhealthy

2. If the ID of the Immunisation resource matches an ID held in the receiving system then the message should be treated as an update rather than a create. This should be regarded as a full update rather than a delta, so the existing Immunisation record should be replaced with the Immunisation resource  in the request 

3. The *air-immunisation-notification-action-code* is used by Orchestration server to determine which PMS systems messages should be sent to as described in the table below

   | Value            |                                          |
   | ---------------- | ---------------------------------------- |
   | *SENDTOALL*      | send immunisation notification  messages both to the enrolled facility and to the facility which administered the immunisation. |
   | *SENDTOENROLLED* | send an immunisation notification  messages only to the enrolled facility |
   | *RESEND*         | send an immunisation notification  message to the facilityId in *MessageHeader.destination.name* |

   ​
4. The Orchestration server will return a 202 if one or messages are successfully sent
5. If one message fails with a 50x (from Healthlink or HIP) and the other succeeds or gets a 40x, the Orchestration server returns a 202 response with an OperationOutcpome. The message which returns a 50x will have error code *TBC* within the OperationOucome issue
6. If Orchestration server fails with a 50x for both messages it should return a 50x response and raise an operational alert


#### Response Codes

One of the following a synchronous error response may be returned by the server 


| **Scenarios**           | **http status code** | **body**           | **description**                          |
| ----------------------- | -------------------- | ------------------ | ---------------------------------------- |
| Success                 | 202                  | OperationOutcome   | The message has been accepted for processing |
| Server Error            | 50x                  | empty              | An unexpected error occurred on the part of the server. The client may resend the message at a later time once the server is issue is resolved |
| Data  Error             | 400                  | OperationOutcome   | If the server cannot process the message due to a data error, it should return a 400 error with an OperationOutcome in the body describing the error |
| Other processing errors | 40x                  | empty              | Other 40x errors may be returned by intermediary gateways (e.g. 401 Unauthorized). These may not provide an OperationOutcome |

#### Response Body
The Response body may contain an OperationOutcome resource describing the result of the request message processing.
Since the Orchestration server may have sent two separate messages to HealthLink for a single ImmSOT request, the OperationOutcome it returns to ImmSOT  may contain two Issue elements, each describing the outcome of a separate notification message. The *OperationOutcome.Issue[n].expression* field should be used to hold the facility id of the target PMS to which the message was sent. The table below describes how the OperationOutcome should be populated



| Field                                    | Description                              | Cardinality |
| ---------------------------------------- | ---------------------------------------- | ----------- |
| OperationOutcome.issue                   |                                          | 0..n        |
| OperationOutcome.issue[].diagnostics     | Details of the error                     | 0..1        |
| OperationOutcome.issue[].expression      | FacilityId of the PMS to which the message was sent | 0..1        |
| OperationOutcome.issue[].details.coding.code | AA or AE                                 | 0..1        |
| OperationOutcome.issue[n]details.coding.system | http://terminology.hl7.org/CodeSystem/v2-0008 | 0..1        |

If an error comes from the HealthLink Broker, the issue.details will element  be populated as follows:

| Field                                    | Description                              | Cardinality |
| ---------------------------------------- | ---------------------------------------- | ----------- |
| OperationOutcome.issue[].details.coding.code | AA or AE                                 | 0..1        |
| OperationOutcome.issue[n]details.coding.system | http://terminology.hl7.org/CodeSystem/v2-0008 | 0..1        |



#### Example Response from Orchestration to ImmSOT
[update-immunisation-request-response1](OperationOutcome-update-immunisation-request-response-message-1.json.html)


### Immunisation Update Message Response
<div>
{% include Immunisation-update-response.svg %}
</div>

####  Immunisation Update Message Response processing steps:
1. The PMS sends an HL7v2.0 VXU^V04 ACK message to the  Healthlink Air Broker indicating if the immunisation update  request has been accepted or not
2. The Healthlink Air Broker creates a bundle containing an OperationOutcome with an appropriate Result Code and sends it to the Orchestration server's *$process-message* endpoint (eventType=IMMUNISATION_UPDATE_ACK)
3. The Orchestration server returns a synchronous 200 response to the  Healthlink Air Broker.
4. The Orchestration server forwards the response message to the ImmSOT server's *$process-message* endpoint.


####  Immunisation Update Message Response Example
[update-immunisation-response-message-1](Bundle-update-immunisation-response-message-1.json.html)
