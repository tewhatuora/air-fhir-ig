## Search and Read API Compliance Testing

### Requests and Parameters

Search and Read API tests apply to all applications accessing immunisation data.

For server end points and supported FHIR resource interactions refer to the Open API Specification available under the Support menu in this IG. Use the UAT end points for Compliance Testing.

- Search: `POST https://api_endpoint/Immunization/_search` - with patient reference parameter in the body of the request

- Read: `GET https://api_endpoint/Immunization/{id}`

- Both requests support the optional _include parameter, which enriches the response with data from NHI and HPI.

### Read API Compliance Tests

<table class="table table-bordered table-hover table-sm">
  <tbody>
    <tr>
      <th>Reference</th>
      <th>Requirement</th>
      <th>Purpose</th>
      <th>Test</th>
      <th>Test Data Input</th>
      <th>Compliance Test Output</th>
      <th>Mandatory</th>
    </tr>
    <tr>
        <td>AIR-Reader-1</td>
        <td>
            The application demonstrates the ability to handle a dormant NHI. AIR could return search results that contain live and dormant NHI numbers and we expect the application to handle this. In other words the AIR response may contain Immunization resources with an NHI number that differs from the one provided in the search. Note that the Patient resource included in the AIR response identifies the live NHI and any dormant NHIs for that patient.
        </td>
        <td>
            The application demonstrates the ability to handle Immunisation search results that contain live and dormant NHIs.
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application uses a dormant NHI number for a search<br>
            When an API call is made<br>
            Then the application displays person information for the live NHI<br>
            And I can see all NHI numbers for the person distinguishing live from dormant<br>
            And I can see all immunisation history related to the person
        </td>
        <td>
            Subscriber's application sends an Immunisation Search request for a dormant NHI number <b>ZDH3343</b>.<br><br>
            Notes:
            <ul>
              <li>If the application does not support searching using dormant NHI numbers, then search using the live NHI number ZDH3335.</li>
              <li>The patient's other dormant NHI number is ZDH3351.</li>
            </ul>
        </td>
        <td>
            Send the subscriber's application screenshots that show immunisation history in full context including the NHI searched for, distinguishing the dormant from live NHIs.<br><br>
            Ensure at least 1 screenshot is supplied with the full application screen showing how the immunisation history and live and dormant NHIs are displayed on screen.
        </td>
        <td>Mandatory</td>
    </tr>
    <tr>
        <td>AIR-Reader-2</td>
        <td>
            Data integrity: Minimum data displayed accurately
        </td>
        <td>
            The application demonstrates the ability to display clinically important elements and data is displayed
            in the expected format as specified in the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide<br>
            <a target="_blank" href="https://fhir-ig.digital.health.nz/air/index.html">https://fhir-ig.digital.health.nz/air/index.html</a>
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And the NHI has multiple immunisation records<br>
            When an API call is made<br>
            Then the Application should display the following key elements for each record:
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
            And the data is displayed to the user in the format specified in the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide.
        </td>
        <td>
            <p>The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for the following NHI numbers<br>
            <strong>ZDH3769</strong> - typical immunisation details, including Product Name<br>
            <strong>ZHZ9398</strong> - has dose 98 representing null dose number<br>
            <strong>ZDH3513</strong> - has dose 99 representing early-life Dose 0</p>
        </td>
        <td>
            The subscriber's Application sends a screenshot showing the values for the key elements stated in the test for the specific NHI and specific ImmSOT identified in the test Data input<br><br>
            As a minimum the guidance for fields to display is based on ISD (Te Whatu Ora Immunisation Frontend System), where the vaccination history table displays:<br>
            &nbsp;&nbsp;&nbsp;&nbsp;Date<br>
            &nbsp;&nbsp;&nbsp;&nbsp;Vaccine<br>
            &nbsp;&nbsp;&nbsp;&nbsp;Product Name (if provided)<br>
            &nbsp;&nbsp;&nbsp;&nbsp;Dose Number<br>
            &nbsp;&nbsp;&nbsp;&nbsp;Age Given<br>
            &nbsp;&nbsp;&nbsp;&nbsp;Status<br>
            &nbsp;&nbsp;&nbsp;&nbsp;Status reason<br><br>
  <img src="assets/images/search-api-air-reader2-1.png" alt="search-api-air-reader2-1" style="max-width:100%; height:auto;"/><br><br>
            Record details - link to full display of each individual immunisation record.<br>
            Screenshot is from ISD and is result of selecting the link detailed in above screenshot.<br><br>
  <img src="assets/images/search-api-air-reader2-2.png" alt="search-api-air-reader2-2" style="max-width:100%; height:auto;"/>
        </td>
        <td>Mandatory</td>
    </tr>
    <tr>
        <td>AIR-Reader-3</td>
        <td>
            Data integrity: No truncation
        </td>
        <td>
            The application demonstrates the ability to display the maximum allowable sizes for all immunisation data fields as specified in the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide<br>
            <a href="https://fhir-ig.digital.health.nz/air/index.html">https://fhir-ig.digital.health.nz/air/index.html</a>
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application is providing an NHI with an immunisation record with maximum allowable size data fields<br>
            When an API call is made<br>
            Then the Application displays the maximum allowable size for all immunisation data fields<br>
            And no data is truncated
        </td>
        <td>
            The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for NHI number <b>ZHZ9215</b>
        </td>
        <td>
            Send a screenshot for the Subscriber's Application showing the lotNumber field displayed<br><br>
            The lotNumber for the rZV immunisation event has the maximum characters:<br><br>
            BiglotNumberthatisupto50characterslong-ZZ-12345678<br><br>
            This NHI (ZDH3530) has 7 events in total, and is also used in Air-reader-7 as 5 of the events have data quality issues
        </td>
        <td>Mandatory</td>
    </tr>
    <tr>
        <td>AIR-Reader-4</td>
        <td>
            Message to end user: Restricted Access immunisation history
        </td>
        <td>
            The application demonstrates the ability to indicate that a person has a restricted immunisation history
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application provides an NHI with restricted access to immunisation history<br>
            When an API call is made<br>
            Then the application display makes it clear to me that the immunisation history is redacted.
        </td>
        <td>
            The subscriber's Application sends a search request for Immunisation History (Search Immunisation) using the NHI number <b>ZFE35PQ</b> or sends a read request for Immunization resource ID:<br>
            30D1312B-6896-465F-93D9-AAE34EAC59F1
        </td>
        <td>
            Send a screenshot for the Subscriber's Application showing a clear message to the end user that the Immunisation History for this Patient is restricted.
            The following is returned in ISD for NHIs that have restricted data:
            <i>This consumer has chosen to restrict access to their immunisation records held in the AIR.</i><br><br>
  <img src="assets/images/search-api-api-air-reader4.png" alt="search-api-api-air-reader4" style="max-width:100%; height:auto;"/>
        </td>
        <td>Mandatory</td>
    </tr>
    <tr>
        <td>AIR-Reader-5</td>
        <td>
            Message to end user: This consumer has no vaccination records to display
        </td>
        <td>
            The application demonstrates the ability to indicate that a person has no immunisation history despite search being successful
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application is providing an NHI with no immunisation history<br>
            When an API call is made<br>
            Then the application display makes it clear to the end user that the AIR did respond successfully but the NHI does not have any immunisation events/history
        </td>
        <td>
            The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for NHI number <b>ZUA48EH</b>
        </td>
        <td>
            Send a screenshot for the Subscriber's Application showing a clear message to the end user that there are no vaccination records to display for this Patient, in full context of the application showing the NHI being searched for.
        </td>
        <td>Mandatory</td>
    </tr>
    <tr>
        <td>AIR-Reader-6</td>
        <td>
            Application is able to display all immunisation events
        </td>
        <td>
            The application demonstrates the ability to display all immunisation events for a patient.
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application is providing an NHI with multiple immunisation events<br>
            When an API call is made<br>
            Then the application displays all events returned
        </td>
        <td>
            Input NHI: <b>ZMM8637</b><br>
            NHI has 32 completed immunisation events
        </td>
        <td>
            Send screen shots that clearly show all immunisation events returned. Note, this can be displayed on separate pages. If the application is limited to a set number of rows e.g. 20, demonstrate how the user is able to view all immunisation event.
        </td>
        <td>Mandatory</td>
    </tr>
    <tr>
        <td>AIR-Reader-7</td>
        <td>
            Applications displays records with data quality flags appropriately
        </td>
        <td>
            When certain data quality issues are present, the 'display' field is not in the API payload, in which case the Application should use 'code', and if code is not present, then 'unknown' or nothing should be displayed.
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application is providing an NHI with immunisation events that contain data quality issues<br>
            When an API call is made<br>
            Then the application displays all events returned including fields with data quality
        </td>
        <td>
            Input NHI: <b>ZKC4641</b><br>
            Has 7 events:<br>
            - 1 with DQ Pass<br>
            - 2 with minor issues (Body Site & Route)<br>
            - 2 with major issues (Vaccine Code & Expiry Date)<br>
            - 1 with moderate issue (Indication)<br>
            - 1 with 3 DQs (Body Site, Route & Diluent Expiry Date)
        </td>
        <td>
            Send screen shots that clearly show all immunisation events returned. If an event has a DQ the response will not return the "display", example below has 'needle' instead of IM or SC. Therefore, a display field is not returned in the Search payload. Guidance is that if the application is taking data from "display" then if this is blank we recommend to take what is in the "code" field. Should the code field be blank, then 'unknown' to be displayed<br><br>
  <img src="assets/images/search-api-air-reader7-1.png" alt="search-api-air-reader7-1" style="max-width:100%; height:auto;"/><br><br>
  <img src="assets/images/search-api-air-reader7-2.png" alt="search-api-air-reader7-2" style="max-width:100%; height:auto;"/>
        </td>
        <td></td>
    </tr>
    <tr>
        <td>AIR-Reader-8</td>
        <td>
            Applications displays records that have status of not-done with the reason
        </td>
        <td>
            The application demonstrates the ability to display all immunisations events for a patient that have the status of not-done and the reason the event was not completed.<br>
            Applications can filter events returned to return only completed in the first instance, but users must be able to view all events.
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application is providing an NHI with multiple immunisation events that include events with a status of 'not-done' and a status reason (e.g. declined by parent)<br>
            When an API call is made<br>
            Then the application is able to display all events returned
        </td>
        <td>
            Input NHI: <b>ZKL2308</b><br>
            Has 9 events -<br>
            - 2 x RV1 not-done (DPC, RESCHO)<br>
            - 3 x PCV10 not done (DMC, RESTC, DNI)<br>
            - 3 x DTaP-IPV-Heb/Hib. 2 completed (GIVEN), 1 not-done (RESREF)<br>
            - 1 x MMR not-done (DIC)<br>
            - 1 x MMR entered-in-error<br>
            <b>ZDH3572</b> has events with status not-done and completed (GIVNOS, HSTGIVN)<br>
            or <b>ZMM8521</b> has set of events that have all statuses and status reasons,
        </td>
        <td>
            Screenshots that clearly show immunisation events returned.  If the application is filtering the events by status and initially only displays the 'completed' events, then it must show that the user is able to display all events if needed.  e.g.<br><br>
  <img src="assets/images/search-api-air-reader8.png" alt="search-api-air-reader8" style="max-width:100%; height:auto;"/>
        </td>
        <td></td>
    </tr>
  </tbody>
</table>
