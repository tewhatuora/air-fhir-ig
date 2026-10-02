### National Event Management Service (NEMS)

NEMS is used by **applications that persist immunisation data locally,** namely Practice Management Systems (PMS), to receive update and duplicate resolution event notifications. 

Other solutions are expected to retrieve patient immunisation history as needed, so do not consume update event notifications from AIR via NEMS.

If your application requires NEMS, then request access when [Onboarding](onboarding.html). The AIR project team will reserve test HPI Organisation and Facility identifiers for your use.

Upon consuming a notification from the AIR, the PMS shall read the latest version of the immunisation event from AIR. For server end points refer to the Open API Specification available under the Support menu in this IG. Use the UAT end points for Compliance Testing.

### NEMS Tests

<table class="table table-bordered table-hover table-sm">
  <thead>
    <tr>
      <th><b>Reference</b></td>
      <th>Test</td>
      <th>Test Data Input</td>
      <th>Compliance Test Evidence</td>
      <th>Mandatory</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>AIR-Notif-1</th>
      <td><b>GIVEN</b> EITHER a new immunisation event created in the AIR portal (entered on behalf of the facility where given) or another PMS ('given elsewhere' for a patient enrolled at the practice)<br>
          OR an <strong>update to an immunisation event in AIR not yet held in the Application</strong><br>
          AND the immunisation event created or updated has the patient's <b>dormant</b> NHI number<br>
          AND the Application only has the patient's live NHI number recorded<br>
          <b>WHEN</b> NEMS publishes the event to the organisation's queue with the Immunisation Update Topic<br>
          <b>THEN</b> the Application performs a GET operation to fetch the record in the notification<br>
          AND the Application persists the new record under the correct patient.</td>
      <td>Set-up procedure: AIR Product team creates or updates an immunisation event with the dormant NHI number for a patient enrolled at the Application's facility.<br>
          Run procedure: the Application processes events from its NEMS queue.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the Immunisation record was created under the correct patient.</td>
      <td>Mandatory (stateful clients)</td>
    </tr>
    <tr>
      <th>AIR-Notif-2</th>
      <td><b>GIVEN</b> an update in AIR or another PMS to an immunisation event record held locally in the PMS that is <strong>not linked</strong> to AIR<br>
          <b>WHEN</b> the event is emitted via NEMS to my queue with the Immunisation Update Topic<br>
          <b>THEN</b> the Application performs a GET operation to fetch the record in the notification<br>
          AND the Application links the local record using the AIR Identifier<br>
          AND the Application updates the existing record.</td>
      <td>Set-up procedure: AIR Product team updates an immunisation event that is was messaged prior to cut-over to APIs, or creates an exact copy in AIR of a record in the PMS.<br>
          Run procedure: the Application processes events from its NEMS queue.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the Immunisation record was created.</td>
      <td>Mandatory (stateful clients)</td>
    </tr>
    <tr>
      <th>AIR-Notif-3</th>
      <td><b>GIVEN</b> an update in AIR or another PMS to an immunisation event record held locally in the PMS that <strong>is linked</strong> to AIR<br>
          <b>WHEN</b> the event is emitted via NEMS to my queue with the Immunisation Update Topic<br>
          <b>THEN</b> the Application performs a GET operation to fetch the record in the notification<br>
          AND the Application updates the existing record.</td>
      <td>Set-up procedure: AIR Product team updates a 'given elsewhere' immunisation event.<br>
          Run procedure: the Application processes events from its NEMS queue.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the Immunisation record was created.</td>
      <td>Mandatory (stateful clients)</td>
    </tr>
    <tr>
      <th>AIR-Notif-4</th>
      <td><b>GIVEN</b> <strong>two</strong> immunisation records that were submitted using the Create API<br>
          AND <strong>both</strong> <b>events are linked</b> to AIR<br>
          AND the events have the same patient identifier and vaccine<br>
          AND the events were completed on the same day NZ time<br>
          AND the vaccine is not a double-dose vaccine<br>
          AND the event records differ in other ways (any of route, body site, indication, dose number, health worker(s))<br>
          <b>WHEN</b> the status in AIR of one of the records has been changed to entered-in-error following administrative review<br>
          AND NEMS has published an Immunisation Event Notification for the entered-in-error update<br>
          AND NEMS has published a <b>Duplicate Resolution</b> event notification citing AIR Identifiers for the two records<br>
          <b>THEN</b> the Application performs a GET operation to fetch the record in the IE notification<br>
          AND the Application updates the corresponding record<br>
          AND the Application closes any tasks created to resolve the Potential Duplicate DQ reported earlier.</td>
      <td>Set-up procedure: the Application submits two records. The second record will return a Data Quality result indicating a Potential Duplicate.<br>
          <br>
          <b>Note:</b> if validation rules prevent the Application creating the required condition, then request that the AIR Test Analyst create the second record &quot;on behalf of&quot; the facility.<br>
          <br>
          Run procedure: the AIR Test Analyst updates one of the records to entered-in-error, resolving the Potential Duplicate DQ.</td>
      <td>Send the AIR Identifiers of the two records.<br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing the Immunisation record that was invalidated on resolution of the potential duplicate.<br>
          <br>
          Optionally, send a screenshot showing the task to resolve the potential duplicate (depends on solution).</td>
      <td>Mandatory (stateful clients)</td>
    </tr>
  </tbody>
</table>
