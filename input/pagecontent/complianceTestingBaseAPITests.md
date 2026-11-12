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

AIR uses test identifiers from the NHI UAT environment. **Do not update/change any of the immunisation data or NHI records in the table below.** These consumers and related data are reserved for these compliance tests.

Vendors integrating with Write APIs (Create, Update, Upsert) will be provided NHI numbers for their testing.

To access a list of NHI test identifiers follow [this link](https://www.tewhatuora.govt.nz/our-health-system/digital-health/health-identity/information-for-it-vendors-and-developers/#national-health-index-nhi) and search for text **NHI Test Data**. To specifically test the new NHI number format, go to [Upcoming Changes to the NHI](https://www.healthnz.govt.nz/health-professionals/guidance-standards/topic/health-identity/national-health-index-nhi/upcoming-changes-to-the-nhi) and download the spreadsheet under the heading 'Change to the check digit algorithm'.

<table class="table table-bordered table-hover table-sm">
  <thead>
    <tr>
      <th style="background-color: #eeeeee">NHI Number (reserved)</th>
      <th style="background-color: #eeeeee">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><div><p>ZMM7002</p></div></td>
      <td><div><p>Full set of completed childhood immunisations (no anomalies)  +ZDH3912</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZUA48EH</p></div></td>
      <td><div><p>No immunisation events</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZMM8521</p></div></td>
      <td><div><p>Full set of statuses &amp; status reasons</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZJM9567</p></div></td>
      <td><div><p>Travel vaccinations</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZKC4641</p></div></td>
      <td><div><p>Vaccinations with data quality issues - 3 events</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZHZ9215</p></div></td>
      <td><div><p>Vaccinations with maximum characters: vaccine source text field has 255 char, lotNumber is 50 char, body site is 18 char.<br>Also has Data Quality issues including: body site code, route code, unrecognised vaccine code, vaccine batch exp date, vaccine diluent exp date.</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZMM8637</p></div></td>
      <td><div><p>Multiple events that cannot display on a single page - can also use ZMM7002</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZDH3343 (D)<br>ZDH3351 (D)<br>ZDH3335 (L)</p></div></td>
      <td><div><p>Live NHI with at least 2 dormant NHIs associated to it<br>Can also use  ZAT2518 (D)  ZAT2496  (L)</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZFE35PQ</p></div></td>
      <td><div><p>Restricted Access - immunisation history is redacted</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZXE24NV</p></div></td>
      <td><div><p>New format NHI (7 digits, Mod23 check sum)</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZHS7524</p></div></td>
      <td><div><p>Historic immunisations, from a period with data that does not comply to current standards</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZAA0547</p></div></td>
      <td><div><p>DOD 2016-05-12, has Imms prior to 2016, DOB is 1954-11-01</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZDH3769</p></div></td>
      <td><div><p>Minimum Data - ISD</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZDH3513</p></div></td>
      <td><div><p>Max data - all fields are populated</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZKL2308</p></div></td>
      <td><div><p>Has selection of not-done and status reasons, incl 1 entered-in-error</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZDH3572</p></div></td>
      <td><div><p>Has mix of status and status reasons: not-done (DPC / DMC / RESCHO), GIVNOS (given overseas), HSTGIVN (Historic)</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZHZ9398</p></div></td>
      <td><div><p>Has dose 98 representing null dose number</p></div></td>
    </tr>
    <tr>
      <td><div><p>ZDH3513</p></div></td>
      <td><div><p>Has dose 99 representing early-life Dose 0</p></div></td>
    </tr>
  </tbody>
</table>


#### Links

<table class="table table-bordered table-hover table-sm">
  <thead>
    <tr>
      <th style="background-color: #eeeeee">Description</th>
      <th style="background-color: #eeeeee">Link</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><div><p>Health NZ Aotearoa Immunisation Register – Immunisation API</p></div></td>
      <td><div><p><a target="_blank" href="https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/explore-apis-digital-services/aotearoa-immunisation-register-immunisation-api">https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/explore-apis-digital-services/aotearoa-immunisation-register-immunisation-api</a></p></div></td>
    </tr>
    <tr>
      <td><div><p>How to access Health NZ Digital Services Hub</p></div></td>
      <td><div><p><a target="_blank" href="https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/consumer-onboarding">https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/consumer-onboarding</a></p></div></td>
    </tr>
    <tr>
      <td><div><p>AIR FHIR Implementation Guide</p></div></td>
      <td><div><p><a target="_blank" href="https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html">https://healthnz-prm.gitlab.io/air/air-api-fhir-ig/index.html</a></p></div></td>
    </tr>
  </tbody>
</table>

### Compliance Test Structure

Test Specifications are grouped as follows.

[Base API Compliance Testing](#base-tests) (below)

- Base tests apply to all types of request to AIR APIs.

[Search and Read Compliance Testing](complianceTestingReadAPITests.html)

- These tests apply to all applications accessing immunisation data.

[Write Compliance Testing](complianceTestingWriteAPITests.html)

- Write API tests apply to all requests that change immunisation data in the AIR.

[Notifications Compliance Testing](complianceTestingNemsTests.html)

- The National Event Management System (NEMS) is used by applications that hold immunisation data locally, namely Practice Management Systems (PMS), to receive update and duplicate resolution event notifications.

[Terminology Service Compliance Testing](complianceTestingNzhtsTests.html)

- The NZHTS provides standard codes, value sets and concept maps used by all applications that present or create immunisation data. Any application sending data to the AIR shall use terms and concept properties specified in the NZHTS to avoid validation failures. Subscriber applications shall synchronise terms with NZHTS on a regular cadence (typically nightly) using the NZHTS APIs.

Not all compliance tests in this implementation guide will be appropriate for every application. If there are tests that do not apply please discuss this with the integration team and where appropriate write a description in the compliance test submission why the particular test does not apply.

**Mandatory vs Optional tests**

- If there are tests below that are labelled mandatory but do fit the application's use case then please let us know why.

- Some tests are labelled (conditional). These tests apply only if you are using this data or functionality for your use case.

- A template for reporting compliance test results is available here: [AIR_Compliance - Template v1.2.docx](assets/AIR_Compliance%20-%20Template%20v1.2.docx) 

- For further information, either add a comment to your onboarding request form or reach out using the [Enquiry form](https://mohapis.atlassian.net/servicedesk/customer/portal/3/group/35/create/112).

### Base Tests

Base API tests apply to all types of request to AIR APIs. For server end points refer to the Open API Specification available under the Support menu in this IG. Use the UAT end points for Compliance Testing.

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
      <th>AIR-Base-1</th>
      <td><div><p>RBAC: Role-Based Access Control (RBAC)</p></div></td>
      <td><div><p>
        The application demonstrates the ability to ensure only authorised users are allowed to access clinical immunization information.
      </p></div></td>
      <td><div><p>
        1a. <b>GIVEN</b> my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        And I am an authorised user with an authenticated application<br>
        And I am classified as registered workforce or working on behalf of a person classified as registered workforce<br>
        <b>WHEN</b> I navigate to view immunisation history information<br>
        <b>THEN</b> an API call can be made<br>
        And the Application displays Immunisation history information<br></p>
        <p>1b. <b>GIVEN</b> my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        And I am an authorised user with an authenticated application<br>
        And I am NOT classified as registered workforce or working on behalf of a person classified as registered workforce<br>
        <b>WHEN</b> I navigate to view immunisation history information<br>
        <b>THEN</b> an API call can NOT be made<br>
        And the Application does NOT display Immunisation history information<br>
        And the application displays a message stating that authorisation has failed.
      </p></div></td>
      <td><div><p>
        1a. Subscriber's Application calls the Immunisation History (Immunisation Search) API and passes the NHI number to the API only when a user authorised to view AIR immunisation data is logged in to the Application.</p>
        <p>1b. Subscriber's Application logged in user is NOT authorised to view AIR immunisation data.
      </p></div></td>
      <td><div><p>
        1a. Screenshot/s showing the subscriber's application screen/s displaying the Immunisation History information only when an authorised user who is classified as registered workforce or working on behalf of a person classified as registered workforce is logged in to the Application.</p>
        <p>1b. Screenshot/s showing the same application screen/s NOT displaying the Immunisation History information when the user logged in to the Application does not have authorisation, with the authorisation failure message that is displayed to the user, or other evidence they are denied access. Web application screen shots should include the URL attempted to be accessed, showing spoofing attempt failing.
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Base-2</th>
      <td><div><p>Request context header appropriately populated</p></div></td>
      <td><div><p>
        The Request-Context HTTP header is populated in each request/API call with correct information as specified in the Request-Context.json schema
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        <b>WHEN</b> an API call is made<br>
        <b>THEN</b> the Request-Context header properties are populated as specified in the schema and base-64 encoded. The schema is defined in:<br>
        <a href="https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context.json">https://github.com/tewhatuora/schemas/blob/main/json-schema/Request-Context.json</a><br><br>
        Te whatu ora will validate your request and verify it includes the request context information.
      </p></div></td>
      <td><div><p>
        The subscriber's Application sets the following fields in the Request-Context HTTP header:<br>
        <b>userIdentifier:</b> the subscriber's Application logged in user.<br>
        <b>facilityIdentifier:</b> the HPI-F code assigned to the Facility<br>
        <b>secondaryIdentifier:</b> If the person triggering the request is not registered with any New Zealand health body on the list provided, values must remain empty (empty string).<br>
        <b>userRole</b> and <b>purposeOfUse</b> are also required.</p>
        <p>For detail on each attribute see <a target="_blank" href="https://github.com/tewhatuora/schemas/blob/main/README.md">README.md</a> and <a target="_blank" href="https://github.com/tewhatuora/schemas/blob/main/Developer%20Guide%20System-to-System%20authentication%20%20clinical%20applications.pdf">Developer Guide</a>
      </p></div></td>
      <td><div><p>
        Send a screenshot showing the logged in user.</p>
        <p>Send the context-header in plain text including userIdentifier, facilityIdentifier and secondaryIdentifier, for example:<br>
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
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Base-3</th>
      <td><div><p>Credentials: ensure the value assigned to userIdentifier reflects the Application's logged-in user</p></div></td>
      <td><div><p>
        userIdentifier within the Request-Context changes when different end users are initiating the request
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application is subscribed to the Immunisation History (Search Immunisation) API<br>
        <b>WHEN</b> a new API call is made<br>
        <b>THEN</b> the sending user's userIdentifier must correspond to the currently logged-in user.
      </p></div></td>
      <td><div><p>
        Repeat the above Test AIR-Base-2 with a <b>different</b> user being logged to the subscriber's application.
      </p></div></td>
      <td><div><p>
        Send a screenshot showing the logged in user.</p>
        <p>Send the X-Correlation-ID and the value that have been set for the userIdentifier field in the context-header
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Base-4</th>
      <td><div><p>Credentials: Universally Unique ID (UUID) in the Correlation ID</p></div></td>
      <td><div><p>
        Each request has a UUID in the X-Correlation-ID field.</p>
        <p>If present this will be returned in the response.
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        <b>WHEN</b> an API call is made<br>
        <b>THEN</b> a universally unique ID is present in the X-Correlation-Id HTTP header
      </p></div></td>
      <td><div><p>
        Subscriber application sets the x-correlation-id to a unique auto generated value (ideally GUID) in API calls, for example the previous two tests AIR-Base-2 and AIR-Base-3 should set the x-correlation-id to different unique values.
      </p></div></td>
      <td><div><p>
        Send x-correlation-id or screenshot that shows them for each API request/call, for example the previous two tests AIR-Base-2 and AIR-Base-3 should have set the x-correlation-id to different unique values.
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Base-5</th>
      <td><div><p>Error Handling and messages to end users</p></div></td>
      <td><div><p>
        The application has robust error handling and ensures meaningful, friendly error messages are displayed.
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        <b>WHEN</b> an API call is made<br>
        And an error occurs<br>
        <b>THEN</b> a meaningful, friendly message is displayed<br>
        And if possible the message provides instruction on what the user needs to do.<br><br>
        User experience should be tailored according to user needs. The OperationOutcome diagnostics text could be displayed to the end user for generic error-handling.
      </p></div></td>
      <td><div><p>
        Send an Immunisation Search Request for an invalid NHI (e.g. "ZZZ0B12").
      </p></div></td>
      <td><div><p>
        Send a Subscriber's Application screenshot showing the message displayed to the end user with the Application window displayed when the error occurred.
      </p></div></td>
      <td><div><p>Mandatory</p></div></td>
    </tr>
    <tr>
      <th>AIR-Base-6</th>
      <td><div><p>Application can appropriately handle rate limiting (HTTP 429)</p></div></td>
      <td><div><p>
        The application has robust error handling and ensures meaningful, friendly error messages are displayed.
      </p></div></td>
      <td><div><p>
        <b>GIVEN</b> my application is a subscriber to the immunisation history (Search Immunisation) API<br>
        <b>WHEN</b> an API call is made and the application receives 429 error code having reached its usage plan limit<br>
        <b>THEN</b> the application handles this gracefully by informing the user to wait few seconds or it displays an hourglass icon as a way of backing off before sending another request.<br><br>
        User experience should be tailored according to user needs. The OperationOutcome diagnostics text could be displayed to the user for generic error-handling.
      </p></div></td>
      <td><div><p>
        The application reaches its usage plan limit and it receives HTTP 429 response code then it handles this gracefully, for example informing the user to wait few seconds, or displaying an hourglass icon as a way of backing off before sending another request.
      </p></div></td>
      <td><div><p>
        Please provide estimates and evidence where available of peak API request rates and volumes, to ensure your application is assigned the correct rate-limiting tier by HNZ - by default rate limiting will be set at Bronze level (1 request per second, 10,000 requests per day). Also,<br>
        Either <br>
        Send a Subscriber's Application screenshot showing the message displayed to the end user with the Application window displayed when the error occurred.<br>
        OR<br>
        State that you are aware that AIR APIs have rate limiting and that you do not expect the number of requests that your application will make to exceed the AIR plan limit you are requesting.
      </p></div></td>
      <td><div><p>Mandatory (no test evidence required but it is Mandatory the application handle this)</p></div></td>
    </tr>
  </tbody>
</table>
