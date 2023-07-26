
## Immunisation Update Message Overview

An ‘Immunisation Update Message’ interaction is initiated by a user who wishes to notify interested parties that an immunisation has occurred.
The request includes details of the patient who received the immunisation, the next of kin who attended the immunisation encounter, the immunisation itself,  and the PMS systems to which the message should be sent
At a later time, after the health provider has processed the request, they send a response back to the nominated endpoint indicating if the immunisation request has been accepted or declined.

### Immunisation Update Message Request



<div>
{% include Immunisation-update-request.svg %}
</div>



####  Immunisation Update Message Request processing steps:

1. ISM sends a REST create request to the ImmSot Immunization endpoint, passing in the details of the immunisation
2. ImmSOT creates the immunisation record
3. ImmSOT  creates a message bundle containing a Patient reference and Immunisation resources, and sends it it to the AIR Orchestration server's *$process-message* endpoint. (EventType=IMMUNISATION_UPDATE)
4. The Orchestration server enriches the Patient reference with additional patient details
   The Orchestration server determines which PMS systems should be notified of the new Immunisation
5. The Orchestration server looks up the EDI address's of the nominated target PMS systems 
6. The Orchestration server creates a message for  each target PMS  and sends it to the  Healthlink Air Broker
7. The Healthlink Air Broker transforms the message to an HL7v2.0  VXU^V04 request and sends it to the PMS
8. The Healthlink Air Broker returns a synchronous 202 response to NES

####  Immunisation Update Message Request Example - ImmSot To Orchestration
[update-immunisation-request2](Bundle-update-immunisation-request2.json.html)

####  Immunisation Update Message Request Example - Orchestration To HealthLink
[update-immunisation-request1](Bundle-update-immunisation-request1.json.html)

#### Business Rules

1. Requests which specify a processing flag value of 'D' in the bundle *meta.tag[0].code* element should be treated as debug messages. The server must ensure that processing these messages results in no change to production data.


#### Responses Codes

One of the following a synchronous error response may be returned by the server 


| **Scenarios**           | **http status code** | **body**         | **description**                          |
| ----------------------- | -------------------- | ---------------- | ---------------------------------------- |
| Success                 | 200                  | empty            | The message has been successfully processed|
| Success                 | 202                  | empty            | The message has been accepted for processing |
| Server Error            | 50x                  | empty            | An unexpected error occurred on the part of the server. The client may resend the message at a later time once the server is issue is resolved |
| Data  Error             | 400                  | OperationOutcome | If the server cannot process the message due to a data error, it should return a 400 error with an OperationOutcome in the body describing the error |
| Other processing errors | 40x                  | empty            | Other 40x errors may be returned by intermediary gateways (e.g. 401 Unauthorized). These may not provide an OperationOutcome |



### Immunisation Update Message Response
<div>
{% include Immunisation-update-response.svg %}
</div>

####  Immunisation Update Message Response processing steps:
1. The PMS sends an HL7v2.0 VXU^V04 ACK message to the  Healthlink Air Broker indicating if the immunisation update  request has been accepted or not
2. The Healthlink Air Broker creates a bundle containing an OperationOutcome with an appropriate Result Code and sends it to the Orchestration server's *$process-message* endpoint (eventType=IMMUNISATION_UPDATE_ACK)
3. The Orchestration server returns a synchronous 200 response to the  Healthlink Air Broker.
3. The Orchestration server forwards the response message to the ImmSOT server's *$process-message* endpoint.


####  Immunisation Update Message Response Example
[update-immunisation-response-message-1](Bundle-update-immunisation-response1.html)

### Notes
1. flag to indicate message is to be sent to all interested parties. This has been done as an extension to messageheader, but there is  no to place in the message definition that the AirMessgaeHeader profile should be used. We might consider having a different event type instead - e.g IMMUNISATION_UPDATE_ALL
2. I have used David's scripts to generate profile and extensions .xml which means the IG menus for those get properly rendered. Do we want the scripts included in the codebase and run as part of the pipeline?
3. added business rules
4. added processing flag to examples
