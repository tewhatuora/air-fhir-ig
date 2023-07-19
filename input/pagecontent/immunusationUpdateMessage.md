
## Immunisation Update Message Overview

An ‘Immunisation Update Message ’ interaction is initiated by a user who wishes to notify uinterested parteis that an immunisation has occured
The request includes details of the patient who recieved the immunisation, the immunisation itself,  and the PMS  systems to which the message should be sent
At a later time , after the health provider has processed the request, they send a response back to the nominated endpoint indicating if the immunisation request has been accepted or declined.

###Immunisation Update Message 



<div>
{% include Immunisation-update-requestt.svg %}
</div>



####  Immunisation Update Message Request processing steps:

1. ISM sends a REST create request to the ImmSot Immunization endpoint, passing in the details of the immunisation
2.  ImmSOT creates the immunisation record
3.  ImmSOT  creates a bundle containing Patient and Immunisation resources, and sends it it to the AIR Orchestration server's $process-message endpoint. (EventType=IMMUNISATION_UPDATE)
3. The Orchestration server determines which  PMS systems should be notified of the new Immunisation
4. The Orchestration server looks up the EDI address's of the nominated target PMS systems 
5. The Orchestration server creates a message for  each target PMS  and sends it to the Messaging Hub
6. The Messaging hub transforms the message to an HL7v2.0  VXU^V04 request and sends it to the PMS
6. The Messaging Hub returns a synchronous 200 response to NES

####  Immunisation Update Message Request Example
[update-immunisation-request1](update-immunisation-request1.json.html)





### To do
1. add flag to indicate message is to be sent to all interested parties
2. add response use case

### Questions
1. how does orchestation server determine the target PMSs?