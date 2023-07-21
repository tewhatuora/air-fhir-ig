
## Immunisation Update Message Overview

An ‘Immunisation Update Message ’ interaction is initiated by a user who wishes to notify interested parties that an immunisation has occured.
The request includes details of the patient who recieved the immunisation, the immunisation itself,  and the PMS  systems to which the message should be sent
At a later time, after the health provider has processed the request, they send a response back to the nominated endpoint indicating if the immunisation request has been accepted or declined.

###Immunisation Update Message Request



<div>
{% include Immunisation-update-request.svg %}
</div>



####  Immunisation Update Message Request processing steps:

1. ISM sends a REST create request to the ImmSot Immunization endpoint, passing in the details of the immunisation
2.  ImmSOT creates the immunisation record
3.  ImmSOT  creates a message bundle containing a Patient reference and Immunisation resources, and sends it it to the AIR Orchestration server's $process-message endpoint. (EventType=IMMUNISATION_UPDATE)
3. The Orchestration server enriches the Patient refernece with additional patient detils
The Orchestration server determines which  PMS systems should be notified of the new Immunisation
4. The Orchestration server looks up the EDI address's of the nominated target PMS systems 
5. The Orchestration server creates a message for  each target PMS  and sends it to the Messaging Hub
6. The Messaging hub transforms the message to an HL7v2.0  VXU^V04 request and sends it to the PMS
6. The Messaging Hub returns a synchronous 200 response to NES

####  Immunisation Update Message Request Example - ImmSot To Orchestration
[update-immunisation-request1](update-immunisation-request1.json.html)

####  Immunisation Update Message Request Example - Orchestration To HealthLink
[update-immunisation-request1](update-immunisation-request1.json.html)


###Immunisation Update Message Response
<div>
{% include Immunisation-update-response.svg %}
</div>

####  Immunisation Update Message Response processing steps:
1. The PMS sends an HL7v2.0 VXU^V04 ACK message to the Messaging Hub indicating if the immunisation update  request has been accepted or not
2. The Messaging Hub creates a bundle containing an OperationOutcome with an appropriate Result Code and sends it to the  Orchestration server $process-message endpoint.
3.  Orchestration server returns a synchronous 200 response to the Messaging Hub.

####  Immunisation Update Message Response Example
[update-immunisation-response-message-1](Bundle-update-immunisation-response1.html)

### To do
1. add flag to indicate message is to be sent to all interested parties


### Questions
1.look at error codes