### Compliance Testing Important Information

#### Compliance Testing Process

Please provide the following details in a test report and email it to [integration@health.govt.nz](mailto:integration@health.govt.nz).

1. Tester Details
    - Organisation Name
    - Application name and version
    - Application HSAPP ID (if applicable)
    - AIR FHIR IG Version
    - Test Script Version
    - Testing Start Date and Time and End Date and Time
    - Tester Name and Contact Details
    - List of Operations Included in Your Integration (e.g., AIR Read, AIR Write)

2. For each test supply screen shots of the user interface for:
    - The input data as entered in the integrating application (“the application”)
    - The output:
        - Any error messages presented by the application
        - The confirmation or result of the request presented by the application
        - For update operations the state of the record pre-request should be included
        - **Note:** If non-interactive, please provide JSON request (update / create) or response (get)

3. For each test supply a timestamp when each request is sent.


#### Test Data

AIR uses test identifiers from the NHI UAT environment. To access a list of NHI test identifiers follow [this link](https://www.tewhatuora.govt.nz/our-health-system/digital-health/health-identity/information-for-it-vendors-and-developers/#national-health-index-nhi). For a set of current format identifiers and look for heading **NHI Test identifiers** and for new format NHI test identifiers see **NHI records Mod23**.

 
Please do not update/change any of the immunisation data in the table below. These have been specifically set up for compliance.

<table class="table table-bordered table-hover table-sm">
  <tbody>
    <tr>
      <th>NHI</th>
      <th>Description</th>
    </tr>
    <tr>
      <td>ZMM7002</td>
      <td>Full set of completed childhood immunisations (no anomalies)  +ZDH3912</td>
    </tr>
    <tr>
      <td>ZUA48EH</td>
      <td>No immunisation events</td>
    </tr>
    <tr>
      <td>ZMM8521</td>
      <td>Full set of statuses &amp; status reasons</td>
    </tr>
    <tr>
      <td>ZJM9567</td>
      <td>Travel vaccinations</td>
    </tr>
    <tr>
      <td>ZKC4641</td>
      <td>Vaccinations with data quality issues - 3 events</td>
    </tr>
    <tr>
      <td>ZDH3530</td>
      <td>Vaccinations with maximum characters 3 events: vaccine source text field has 255 char, lotNumber is 50 char, body site is 18 char<br>Also has Data Quality issues including; body site code, route code, unrecognised vaccine code, vaccine batch exp date, vaccine diluent exp date</td>
    </tr>
    <tr>
      <td>ZMM8637</td>
      <td>Multiple events that cannot display on a single page - can also use ZMM7002</td>
    </tr>
    <tr>
      <td>ZDH3343 (D)<br>ZDH3351 (D)<br>ZDH3335 (L)</td>
      <td>Live NHI with at least 2 dormant NHIs associated to it<br>Can also use  ZAT2518 (D)  ZAT2496  (L)</td>
    </tr>
    <tr>
      <td>ZFE35PQ</td>
      <td>Suppressed immunisation history</td>
    </tr>
    <tr>
      <td>ZXE24NV</td>
      <td>New format NHI (7 digits)</td>
    </tr>
    <tr>
      <td>ZHS7524</td>
      <td>Historic immunisations, from a period with data that does not comply to current standards</td>
    </tr>
    <tr>
      <td>ZAA0547</td>
      <td>DOD 2016-05-12   Has Imms prior to 2016    DOB is 1954-11-01</td>
    </tr>
    <tr>
      <td>ZDH3475</td>
      <td>Minimum data - mandatory fields only</td>
    </tr>
    <tr>
      <td>ZDH3769</td>
      <td>Minimum Data - ISD</td>
    </tr>
    <tr>
      <td>ZDH3513</td>
      <td>Max data - all fields are populated</td>
    </tr>
    <tr>
      <td>ZKL2308</td>
      <td>Has selection of non-done and status reasons, incl 1 entered-in-error</td>
    </tr>
    <tr>
      <td>ZMN6354</td>
      <td>Has mix of status and status reasons: not-done (DPC / DMC / RESCHO)  GIVNOS (given overseas), HSTGIVN (Historic)</td>
    </tr>
  </tbody>
</table>


#### Links

<table class="table table-bordered table-hover table-sm">
  <tbody>
    <tr>
      <th>Description</th>
      <th>Link</th>
    </tr>
    <tr>
      <td>Health NZ Aotearoa Immunisation Register – Immunisation API</td>
      <td><a href="https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/explore-apis-digital-services/aotearoa-immunisation-register-immunisation-api">https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/explore-apis-digital-services/aotearoa-immunisation-register-immunisation-api</a></td>
    </tr>
    <tr>
      <td>How to access Health NZ Digital Services Hub</td>
      <td><a href="https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/consumer-onboarding">https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/consumer-onboarding</a></td>
    </tr>
    <tr>
      <td>AIR FHIR Implementation Guide</td>
      <td><a href="https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html">https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html</a></td>
    </tr>
  </tbody>
</table>

### Compliance Tests

Not all compliance tests in this implementation guide will be appropriate for every application. If there are tests that do not apply please discuss this with the integration team and where appropriate write a description in the compliance test submission why the particular test does not apply.

**Mandatory vs Optional tests**

* If there are tests below that are labelled mandatory but do fit the application's use case then please let us know why.

* Some tests are labelled mandatory if. These tests are Mandatory only if you are using this piece of data for your use case.

To request a template for the compliance tests either add a comment to your onboarding request form or reach out using the [Enquiry form](https://mohapis.atlassian.net/servicedesk/customer/portal/3/group/35/create/112).

#### Search API Compliance Tests

Endpoint for AIR Search API 

https://api.uat.air.digital.health.nz/s2s/fhir/R4/Immunization/_search


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
      <td>AIR-Base-1</td>
      <td>RBAC: Role-Based Access Control (RBAC)</td>
      <td>
        The application demonstrates the ability to ensure only authorised users are allowed to access clinical immunization information.
      </td>
      <td>
        1a. Given my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        And I am an authorised user with an authenticated application<br>
        And I am classified as registered workforce or working on behalf of a person classified as registered workforce<br>
        When I navigate to view immunisation history information<br>
        Then an API call can be made<br>
        And the Application displays Immunisation history information<br><br>
        1b. Given my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        And I am an authorised user with an authenticated application<br>
        And I am NOT classified as registered workforce or working on behalf of a person classified as registered workforce<br>
        When I navigate to view immunisation history information<br>
        Then an API call can NOT be made<br>
        And the Application does NOT display Immunisation history information<br>
        And the application displays a message stating that authorisation has failed.
      </td>
      <td>
        1a. Subscriber's Application calls the Immunisation History (Immunisation Search) API and passes the NHI number to the API only when a user authorised to view AIR immunisation data is logged in to the Application.<br><br>
        1b. Subscriber's Application logged in user is NOT authorised to view AIR immunisation data.
      </td>
      <td>
        1a. Screenshot/s showing the subscriber's application screen/s displaying the Immunisation History information only when an authorised user who is classified as registered workforce or working on behalf of a person classified as registered workforce is logged in to the Application.<br><br>
        1b. Screenshot/s showing the same application screen/s NOT displaying the Immunisation History information when the user logged in to the Application does not have authorisation, with the authorisation failure message that is displayed to the user, or other evidence they are denied access. Web application screen shots should include the URL attempted to be accessed, showing spoofing attempt failing.
      </td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <td>AIR-Base-2</td>
      <td>Request context header appropriately populated</td>
      <td>
        The Request-Context HTTP header is populated in each request/API call with correct information as specified in the Request-Context.json schema
      </td>
      <td>
        Given my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        When an API call is made<br>
        Then the Request-Context header properties are populated as specified in the schema and base-64 encoded. The schema is defined in:<br>
        <a href="https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context.json">https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context.json</a><br><br>
        Te whatu ora will validate your request and verify it includes the request context information.
      </td>
      <td>
        The subscriber's Application sets the following fields in the Request-Context HTTP header:<br>
        <b>userIdentifier:</b> the subscriber's Application logged in user.<br>
        <b>facilityIdentifier:</b> the HPI-F code assigned to the Facility<br>
        <b>secondaryIdentifier:</b> If the person triggering the request is not registered with any New Zealand health body on the list provided, values must remain empty (empty string).<br>
        <b>userRole</b> and <b>purposeOfUse</b> are also required.<br><br>
        For detail on each attribute see <a href="https://github.com/tewhatuora/schemas/blob/main/README.md">README.md</a> and <a href="https://github.com/tewhatuora/schemas/blob/main/Developer%20Guide%20System-to-System%20authentication%20%20clinical%20applications.pdf">Developer Guide</a>
      </td>
      <td>
        Send a screenshot showing the logged in user<br>
        Send the context-header in plain text including userIdentifier, facilityIdentifier and secondaryIdentifier, for example:<br>
        <pre>
        {
          "userIdentifier":"pms-user-id-123",
          "userRole":"PROV",
          "secondaryIdentifier":{
              "use":"official",
              "system":"https://standards.digital.health.nz/ns/medical-council-id",
              "value":"RA99Z"
          },
          "purposeOfUse":[
              "POPHLTH"
          ],
          "userFullName":"Beverly Crusher"
        }
        </pre>
      </td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <td>AIR-Base-3</td>
      <td>Credentials: ensure the value assigned to userIdentifier reflects the Application's logged-in user</td>
      <td>
        userIdentifier within the Request-Context changes when different end users are initiating the request
      </td>
      <td>
        Given my application is subscribed to the Immunisation History (Search Immunisation) API<br>
        When a new API call is made<br>
        Then the sending user's userIdentifier must correspond to the currently logged-in user.
      </td>
      <td>
        Repeat the above Test AIR-Base-2 with a <b>different</b> user being logged to the subscriber's application.
      </td>
      <td>
        Send a screenshot showing the logged in user<br>
        Send the X-Correlation-ID and the value that have been set for the userIdentifier field in the context-header
      </td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <td>AIR-Base-4</td>
      <td>Credentials: Universally Unique ID (UUID) in the Correlation ID</td>
      <td>
        Each request has a UUID in the X-Correlation-ID field<br>
        If present this will be returned in the response
      </td>
      <td>
        Given my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        When an API call is made<br>
        Then a universally unique ID is present in the X-Correlation-Id HTTP header
      </td>
      <td>
        Subscriber application sets the x-correlation-id to a unique auto generated value (ideally GUID) in API calls, for example the previous two tests AIR-Base-2 and AIR-Base-3 should set the x-correlation-id to different unique values.
      </td>
      <td>
        Send x-correlation-id or screenshot that shows them for each API request/call, for example the previous two tests AIR-Base-2 and AIR-Base-3 should have set the x-correlation-id to different unique values.
      </td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <td>AIR-Base-5</td>
      <td>Error Handling and messages to end users</td>
      <td>
        The application has robust error handling and ensures meaningful, friendly error messages are displayed.
      </td>
      <td>
        Given my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        When an API call is made<br>
        And an error occurs<br>
        Then a meaningful, friendly message is displayed<br>
        And if possible the message provides instruction on what the user needs to do.<br><br>
        User experience should be tailored according to user needs. The OperationOutcome diagnostics text could be displayed to the end user for generic error-handling.
      </td>
      <td>
        Send an Immunisation Search Request for an invalid NHI (e.g. "ZZZ0B12")
      </td>
      <td>
        Send a Subscriber's Application screenshot showing the message displayed to the end user with the Application window displayed when the error occurred.
      </td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <td>AIR-Base-6</td>
      <td>Application can appropriately handle rate limiting (HTTP 429)</td>
      <td>
        The application has robust error handling and ensures meaningful, friendly error messages are displayed.
      </td>
      <td>
        Given my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        When an API call is made and the application receives 429 error code having reached its usage plan limit<br>
        Then the application handles this gracefully by informing the user to wait few seconds or it displays an hourglass icon as a way of backing off before sending another request.<br><br>
        User experience should be tailored according to user needs. The OperationOutcome diagnostics text could be displayed to the user for generic error-handling.
      </td>
      <td>
        The application reaches its usage plan limit and it receives HTTP 429 response code then it handles this gracefully, for example informing the user to wait few seconds, or displaying an hourglass icon as a way of backing off before sending another request.
      </td>
      <td>
        Please provide estimates and evidence where available of peak API request rates and volumes, to ensure your application is assigned the correct rate-limiting tier by HNZ - by default rate limiting will be set at Bronze level (1 request per second, 10,000 requests per day). Also,<br>
        Either <br>
        Send a Subscriber's Application screenshot showing the message displayed to the end user with the Application window displayed when the error occurred.<br>
        OR<br>
        State that you are aware that AIR APIs have rate limiting and that you do not expect the number of requests that your application will make to exceed the AIR plan limit you are requesting.
      </td>
      <td>Mandatory (no test evidence required but it is Mandatory the application handle this)</td>
    </tr>
  </tbody>
</table>

#### Read API Compliance Tests

Endpoint for AIR Read API 

https://api.uat.air.digital.health.nz/s2s/fhir/R4/Immunization/{ID}



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
            Notes:<br>
            • If the application does not support searching using dormant NHI numbers, then search using the live NHI number ZDH3335.<br>
            • The patient's other dormant NHI number is ZDH3351.
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
            The application demonstrates the ability to display clinically important elements and data is displayed in the expected format as specified in the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide<br>
            <a href="https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html">https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html</a>
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And the NHI has multiple immunisation records<br>
            When an API call is made<br>
            Then the Application should display the following key elements for each record:<br>
            &nbsp;&nbsp;- person (NHI)<br>
            &nbsp;&nbsp;- status<br>
            &nbsp;&nbsp;- statusReason<br>
            &nbsp;&nbsp;- vaccine Display Name<br>
            &nbsp;&nbsp;- vaccine (product display name), if it is provided in the response<br>
            &nbsp;&nbsp;- dose number<br>
            &nbsp;&nbsp;- reasonCode (Indication)<br>
            &nbsp;&nbsp;- occurrence - date/time<br>
            And the data is displayed to the user in the format specified in the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide
        </td>
        <td>
            <p>The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for the following NHI numbers<br>
            <strong>ZDH3769</strong> - typical immunisation details, including Product Name<br>
            <strong>ZJM9567</strong> - has dose 98 representing null dose number<br>
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
            <a href="https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html">https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html</a>
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application is providing an NHI with an immunisation record with maximum allowable size data fields<br>
            When an API call is made<br>
            Then the Application displays the maximum allowable size for all immunisation data fields<br>
            And no data is truncated
        </td>
        <td>
            The subscriber's Application sends an Immunisation History (Search Immunisation) API Request for NHI number <b>ZDH3530</b>
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
            Message to end user: Suppressed immunisation history
        </td>
        <td>
            The application demonstrates the ability to indicate that a person has a restricted immunisation history
        </td>
        <td>
            Given my application has the appropriate permission<br>
            And my application is providing an NHI with suppressed immunisation history<br>
            When an API call is made<br>
            Then the application display makes it clear to me that the immunisation history is suppressed
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
            Input NHI: <b>ZDH3530</b><br>
            Has 7 events:<br>
            - 2 with DQ Pass<br>
            - 2 with minor issues (body site & route)<br>
            - 2 with major issues (vax code & expiry date)<br>
            - 1 with 3 DQs (site, route & diluent expiry date)
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
            <b>ZMN6354</b> has events of not-done and also GIVNOS HSTGIVN<br>
            or <b>ZMM8521</b> has set of events that have all status and status reasons
        </td>
        <td>
            Screenshots that clearly show immunisation events returned.  If the application is filtering the events by status and initially only displays the 'completed' events, then it must show that the user is able to display all events if needed.  e.g.<br><br>
  <img src="assets/images/search-api-air-reader8.png" alt="search-api-air-reader8" style="max-width:100%; height:auto;"/>
        </td>
        <td></td>
    </tr>
  </tbody>
</table>
