## Search and Read API Compliance Testing

### Requests and Parameters

Search and Read API tests apply to all applications accessing immunisation data.

For server end points refer to the Open API Specification available under the Support menu in this IG. Use UAT end points for Compliance Testing.

- Search: `POST https://api_endpoint/Immunization/_search` - with patient reference parameter in the body of the request

- Read: `GET https://api_endpoint/Immunization/{id}`

- Both requests support the optional _include parameter, which enriches the response with data from NHI and HPI.

### Search and Read Tests

<table class="table table-bordered table-hover table-sm">
  <thead>
    <tr>
      <th style="background-color: #eeeeee">Reference</th>
      <th style="background-color: #eeeeee">Requirement</th>
      <th style="background-color: #eeeeee">Purpose</th>
      <th style="background-color: #eeeeee">Test</th>
      <th style="background-color: #eeeeee">Test Data Input</th>
      <th style="background-color: #eeeeee">Compliance Test Output</th>
      <th style="background-color: #eeeeee">Mandatory</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>AIR-Reader-1</th>
      <td><div><p>
        The application demonstrates the ability to handle a dormant NHI. AIR could return search results that
        contain live and dormant NHI numbers and we expect the application to handle this. In other words the
        AIR response may contain Immunization resources with an NHI number that differs from the one provided
        in the search.</p>
        <p>Note that the Patient resource included in the AIR response identifies the live NHI and
        any dormant NHIs for that patient.
      </p></div></td>
      <td><div><p>
          The application demonstrates the ability to handle Immunisation search results that contain live and dormant NHIs.
      </p></div></td>
      <td><div><p>
          <b>GIVEN</b> my application has the appropriate permission<br>
          AND my application uses a dormant NHI number for a search<br>
          <b>WHEN</b> an API call is made<br>
          <b>THEN</b> the application displays person information for the live NHI<br>
          AND I can see all NHI numbers for the person distinguishing live from dormant<br>
          AND I can see all immunisation history related to the person.
      </p></div></td>
      <td><div><p>
          Subscriber's application sends an Immunisation Search request for a dormant NHI number <b>ZDH3343</b>.<br><br>
          Notes:
          <ul>
            <li>If the application does not support searching using dormant NHI numbers, then search using the
              live NHI number ZDH3335.</li>
            <li>The patient's other dormant NHI number is ZDH3351.</li>
          </ul>
      </p></div></td>
      <td><div><p>
        Send the subscriber's application screenshots that show immunisation history in full context including
        the NHI searched for, distinguishing the dormant from live NHIs.<br><br>
        Ensure at least 1 screenshot is supplied with the full application screen showing how the immunisation
        history and live and dormant NHIs are displayed on screen.
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Reader-2</th>
      <td><div><p>
          Data integrity: Minimum data displayed accurately
      </p></div></td>
      <td><div><p>
          The application demonstrates the ability to display clinically important elements and data is displayed
          in the expected format as specified in the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide<br>
          <a target="_blank" href="https://fhir-ig.digital.health.nz/air/index.html">https://fhir-ig.digital.health.nz/air/index.html</a>
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application has the appropriate permission<br>
        AND the NHI has multiple immunisation records<br>
        <b>WHEN</b> an API call is made<br>
        <b>THEN</b> the Application should display the following key elements for each record:
        <ul>
          <li>person (NHI)</li>
          <li>status</li>
          <li>statusReason</li>
          <li>vaccine Display Name</li>
          <li>vaccine (product display name), if it is provided in the response</li>
          <li>dose number</li>
          <li>reasonCode (Indication)</li>
          <li>occurrence - date/time</li>
        </ul>
        AND the data is displayed to the user in the format specified in the Aotearoa Immunisation Register
        (AIR) FHIR Implementation Guide.
      </p></div></td>
      <td><div><p>
        <p>The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for the following NHI numbers<br>
        <strong>ZDH3769</strong> - typical immunisation details, including Product Name<br>
        <strong>ZHZ9398</strong> - has dose 98 representing null dose number<br>
        <strong>ZDH3513</strong> - has dose 99 representing early-life Dose 0</p>
      </p></div></td>
      <td><div><p>
        The subscriber's Application sends a screenshot showing the values for the key elements stated in the test for
        the specific NHI and specific ImmSOT identified in the test Data input</p>
        <p>As a minimum the guidance for fields to display is based on ISD (Te Whatu Ora Immunisation Frontend System), where the vaccination history table displays:</p>
        <ul>
          <li>Date</li>
          <li>Vaccine</li>
          <li>Product Name (if provided)</li>
          <li>Dose Number</li>
          <li>Age Given</li>
          <li>Status</li>
          <li>Status reason</li>
        </ul>
<img src="assets/images/search-api-air-reader2-1.png" alt="Vaccination History (minimum fields)" style="max-width:100%; height:auto;"/>
        <p>Record details - link to full display of each individual immunisation record.</p>
        <p>Screenshot is from ISD and is result of selecting the link detailed in above screenshot.</p>
<img src="assets/images/search-api-air-reader2-2.png" alt="Vaccination Record (detail)" style="max-width:100%; height:auto;"/>
      </div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Reader-3</th>
      <td><div><p>
          Data integrity: No truncation
      </p></div></td>
      <td><div><p>
        The application demonstrates the ability to display the maximum allowable sizes for all immunisation
        data fields as specified in the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide<br>
        <a href="https://fhir-ig.digital.health.nz/air/index.html">https://fhir-ig.digital.health.nz/air/index.html</a>
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application has the appropriate permission<br>
        AND my application is providing an NHI with an immunisation record with maximum allowable size data fields<br>
        <b>WHEN</b> an API call is made<br>
        <b>THEN</b> the Application displays the maximum allowable size for all immunisation data fields<br>
        AND no data is truncated
      </p></div></td>
      <td><div><p>
        The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for NHI number <b>ZHZ9215</b>
      </p></div></td>
      <td><div><p>
        Send a screenshot for the Subscriber's Application showing the lotNumber field displayed<br><br>
        The lotNumber for the rZV immunisation event has the maximum characters:<br><br>
        BiglotNumberthatisupto50characterslong-ZZ-12345678<br><br>
        This NHI (ZDH3530) has 7 events in total, and is also used in Air-reader-7 as 5 of the events have data quality issues
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Reader-4</th>
      <td><div><p>
        Message to end user: Restricted Access immunisation history
      </p></div></td>
      <td><div><p>
        The application demonstrates the ability to indicate that a person has a restricted immunisation history
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application has the appropriate permission<br>
        AND my application provides an NHI with restricted access to immunisation history<br>
        <b>WHEN</b> an API call is made<br>
        <b>THEN</b> the application display makes it clear to me that the immunisation history is redacted.
      </p></div></td>
      <td><div><p>
        The subscriber's Application sends a search request for Immunisation History (Search Immunisation) using the NHI number <b>ZFE35PQ</b> or sends a read request for Immunization resource ID:<br>
        30D1312B-6896-465F-93D9-AAE34EAC59F1
      </p></div></td>
      <td><div><p>
        Send a screenshot for the Subscriber's Application showing a clear message to the end user that the Immunisation
        History for this Patient is restricted.
        The following is returned in ISD for NHIs that have restricted data:
        <i>This consumer has chosen to restrict access to their immunisation records held in the AIR.</i><br><br>
<img src="assets/images/search-api-api-air-reader4.png" alt="Vaccination History (redacted)" style="max-width:100%; height:auto;"/>
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Reader-5</th>
      <td><div><p>
        Message to end user: This consumer has no vaccination records to display
      </p></div></td>
      <td><div><p>
        The application demonstrates the ability to indicate that a person has no immunisation history despite search being successful
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application has the appropriate permission<br>
        AND my application is providing an NHI with no immunisation history<br>
        <b>WHEN</b> an API call is made<br>
        <b>THEN</b> the application display makes it clear to the end user that the AIR did respond successfully but the
        NHI does not have any immunisation events/history
      </p></div></td>
      <td><div><p>
        The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for NHI number <b>ZUA48EH</b>
      </p></div></td>
      <td><div><p>
        Send a screenshot for the Subscriber's Application showing a clear message to the end user that there are no
        vaccination records to display for this Patient, in full context of the application showing the NHI being searched for.
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Reader-6</th>
      <td><div><p>
        Application is able to display all immunisation events
      </p></div></td>
      <td><div><p>
        The application demonstrates the ability to display all immunisation events for a patient.
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application has the appropriate permission<br>
        AND my application is providing an NHI with multiple immunisation events<br>
        <b>WHEN</b> an API call is made<br>
        <b>THEN</b> the application displays all events returned
      </p></div></td>
      <td><div><p>
        Input NHI: <b>ZMM8637</b><br>
        NHI has 32 completed immunisation events
      </p></div></td>
      <td><div><p>
        Send screen shots that clearly show all immunisation events returned. Note, this can be displayed on
        separate pages. If the application is limited to a set number of rows e.g. 20, demonstrate how the user
        is able to view all immunisation event.
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Reader-7</th>
      <td><div><p>
          Applications displays records with data quality flags appropriately
      </p></div></td>
      <td><div><p>
          <b>WHEN</b> certain data quality issues are present, the 'display' field is not in the API payload, in which case the Application should use 'code', and if code is not present, then 'unknown' or nothing should be displayed.
      </p></div></td>
      <td><div><p>
          <b>GIVEN</b> my application has the appropriate permission<br>
          AND my application is providing an NHI with immunisation events that contain data quality issues<br>
          <b>WHEN</b> an API call is made<br>
          <b>THEN</b> the application displays all events returned including fields with data quality
      </p></div></td>
      <td><div><p>
          Input NHI: <b>ZKC4641</b><br>
          Has 7 events:<br>
          - 1 with DQ Pass<br>
          - 2 with minor issues (Body Site & Route)<br>
          - 2 with major issues (Vaccine Code & Expiry Date)<br>
          - 1 with moderate issue (Indication)<br>
          - 1 with 3 DQs (Body Site, Route & Diluent Expiry Date)
      </p></div></td>
      <td><div><p>
          Send screen shots that clearly show all immunisation events returned. If an event has a DQ the response will not return the "display", example below has 'needle' instead of IM or SC. Therefore, a display field is not returned in the Search payload. Guidance is that if the application is taking data from "display" then if this is blank we recommend to take what is in the "code" field. Should the code field be blank, then 'unknown' to be displayed<br><br>
<img src="assets/images/search-api-air-reader7-1.png" alt="coding example with invalid code" style="max-width:100%; height:auto;"/><br><br>
<img src="assets/images/search-api-air-reader7-2.png" alt="valid route coding example" style="max-width:100%; height:auto;"/>
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Reader-8</th>
      <td><div><p>
          Applications displays records that have status of not-done with the reason
      </p></div></td>
      <td><div><p>
          The application demonstrates the ability to display all immunisations events for a patient that have the status of not-done and the reason the event was not completed.<br>
          Applications can filter events returned to return only completed in the first instance, but users must be able to view all events.
      </p></div></td>
      <td><div><p>
          <b>GIVEN</b> my application has the appropriate permission<br>
          AND my application is providing an NHI with multiple immunisation events that include events with a status of 'not-done' and a status reason (e.g. declined by parent)<br>
          <b>WHEN</b> an API call is made<br>
          <b>THEN</b> the application is able to display all events returned
      </p></div></td>
      <td><div><p>
          Input NHI: <b>ZKL2308</b><br>
          Has 9 events -<br>
          - 2 x RV1 not-done (DPC, RESCHO)<br>
          - 3 x PCV10 not done (DMC, RESTC, DNI)<br>
          - 3 x DTaP-IPV-Heb/Hib. 2 completed (GIVEN), 1 not-done (RESREF)<br>
          - 1 x MMR not-done (DIC)<br>
          - 1 x MMR entered-in-error</p>
          <p><b>ZDH3572</b> has events with status not-done and completed (GIVNOS, HSTGIVN)<br>
          or <b>ZMM8521</b> has set of events that have all statuses and status reasons.
      </p></div></td>
      <td><div><p>
          Screenshots that clearly show immunisation events returned.  If the application is filtering the events by status and initially only displays the 'completed' events, then it must show that the user is able to display all events if needed. e.g.</p>
<img src="assets/images/search-api-air-reader8.png" alt="Vaccination History and Immunisation Plan example with Status Reason filter" style="max-width:100%; height:auto;"/>
      </div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
  </tbody>
</table>
