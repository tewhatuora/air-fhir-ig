### Requests and Parameters

Write API tests apply to all requests that change immunisation data in the AIR. For server end points and supported FHIR resource interactions refer to the Open API Specification available under the Support menu in this IG. Use the UAT end points for Compliance Testing.

Tests marked Mandatory / Recommended / Conditional for 'stateful clients' apply to PMS applications, which persist immunisation records locally.

### Create, Update and Upsert Tests
<table class="table table-bordered table-hover table-sm">
  <thead>
    <tr>
      <th>Reference</th>
      <th>Test</th>
      <th>Test Data Input</th>
      <th>Compliance Test Evidence</th>
      <th>Mandatory</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>AIR-Writer-1</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND immunisation events with values required for completed and not-done immunisation events<br>
          <b>WHEN</b> <b>Create API</b> calls are made to create the immunisation events<br>
          <b>THEN</b> the Application sends the following elements for each record:
          <ul>
            <li>person (NHI)</li>
            <li>status (see Test Data Input)</li>
            <li>statusReason (see Test Data Input)</li>
            <li>vaccineCode, reasonCode (Indication)</li>
            <li>vaccine lot number, expiration date (required for statusReason GIVEN)</li>
            <li>route, site (required for statusReason GIVEN)</li>
            <li>occurrence (datetime of administration with Day precision, preferably better - refer to FHIR data types)</li>
            <li>location (facility HPI-F of patient encounter or system where data is entered)</li>
            <li>one to two health workers (one Administering Provider and optionally one other provider, both meeting rule nz-prac-1 in the AIR FHIR IG)</li>
          </ul>
          AND if the record is persisted locally, then the Application links the record using the AIR Identifier in the response.</td>
      <td>Subscriber's application sends an Immunisation Create request with the minimum data elements for these scenarios:<br>
          1) status completed: statusReason GIVEN<br>
          2) status completed: statusReason GIVNOS<br>
          3) status not-done: any one of DMC, DPC, DIC</td>
      <td>Send the x-correlation-ID header sent with each of the 4 requests and the AIR Identifiers (Immunization.id) received from AIR.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Writer-2</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an immunisation event completed in NZ with all fields supported by the Application populated<br>
          <b>WHEN</b> a <b>Create API</b> call is made to create the immunisation event<br>
          <b>THEN</b> the Application sends the following elements for each record additional to the previous test:<br>
          <ul>
            <li>dose number</li>
            <li>diluent lot number, expiration date (when statusReason GIVEN)</li>
            <li>up to two related persons with relationship code from AIR Related Person Relationship Codes value set</li>
            <li>serology report (required for statusReason DNI - see Test Data Input)</li>
            <li>mobile site sub-location identifier (if supported)</li>
            <li>Administered Product (if supported)</li>
          </ul>
          AND if the record is persisted locally, then the Application links the record using the AIR Identifier in the response.</td>
      <td>Subscriber's application sends an Immunisation Create request with all supported data elements for these scenarios:<br>
          1) status completed: statusReason GIVEN.<br>
          2) status: not-done, statusReason: DNI, vaccineCode one of CVX 05, 43, 52 with serology report.<br>
          API Version 1:<br>
          3.1) dose number 99<br>
          3.2) dose number 98<br>
          API Version 2:<br>
          3.1) dose number &quot;0&quot;<br>
          3.2) dose number &quot;&quot;</td>
      <td>Send the x-correlation-ID header sent with each of the requests and the AIR Identifiers received from AIR.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Writer-3</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an updated immunisation event completed in NZ with all fields supported by the Application populated <br>
          AND the record <strong>has an AIR Identifier</strong><br>
          <b>WHEN</b> an <b>Update API</b> call is made to update the existing immunisation record using the AIR Identifier<br>
          <b>THEN</b> the Application sends updates to the following elements for each record, where supported:
          <ul>
            <li>status</li>
            <li>statusReason</li>
            <li>VaccineCode, Administered Product (if supported)</li>
            <li>reasonCode, dose number</li>
            <li>vaccine lot number, expiration date (required for statusReason GIVEN)</li>
            <li>diluent lot number, expiration date</li>
            <li>occurrence</li>
            <li>location, mobile site sub-location identifier (if supported)</li>
            <li>route, site (required for statusReason GIVEN)</li>
            <li>one to two related persons</li>
            <li>one to two health workers</li>
            <li>serology report (required for statusReason DNI)</li>
          </ul></td>
      <td>Subscriber's application sends an update Request to an existing Immunisation Record with all supported data elements in addition to the VersionId field in the meta.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update and the AIR Identifier received from AIR.<br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Writer-4</th>
      <td>This test only applies if the Application holds local records previously sent to AIR via HL7 messaging.<br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI (active or dormant)<br>
          AND an updated immunisation event completed in NZ with all fields supported by the Application populated<br>
          AND the record <strong>does not have an AIR Identifier</strong> having been sent successfully to AIR/NIR previously,<br>
          <b>WHEN</b> a call is made to <b>$upsert</b> the record<br>
          <b>THEN</b> the Application sends updates to the following elements, where supported by the Application:
          <ul>
            <li>person (NHI)</li>
            <li>vaccineCode, Administered Product (if supported)</li>
            <li>dose number, reasonCode (Indication)</li>
            <li>occurrence (datetime of administration with Day precision, preferably better - refer to FHIR data types)</li>
            <li>status, statusReason</li>
            <li>vaccine lot number, expiration date (required for statusReason GIVEN)</li>
            <li>diluent lot number, expiration date</li>
            <li>occurrence</li>
            <li>location, mobile site sub-location identifier (if supported)</li>
            <li>route, site (required for statusReason GIVEN)</li>
            <li>one to two related persons</li>
            <li>one to two health workers</li>
            <li>serology report (required for statusReason DNI)</li>
          </ul>
          AND if the record is persisted locally, then the Application links the record using the AIR Identifier in the response.</td>
      <td>Subscriber's application sends an upsert request with an Immunisation Record containing all supported data elements.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update and the AIR Identifier received from AIR.</td>
      <td>Mandatory (stateful clients)</td>
    </tr>
    <tr>
      <th>AIR-Writer-5</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation Create API<br>
          <b>WHEN</b> a call is made to the <b>Create API</b>, or an <b>upsert</b> that will result in creating a record,<br>
          AND one or more rejection errors occur<br>
          <b>THEN</b> a meaningful message is displayed to the end user in near real time<br>
          AND the message provides instruction on what the user needs to do to resolve the problem<br>
          AND no data is lost unless the user chooses to discard their entry.<br>
          <br>
          <strong>Note:</strong> the upsert method applies where the application holds local records it sent to AIR via HL7 messaging. An upsert creates a new record in AIR when edits to the local record affect key fields.</td>
      <td>To cause rejection the Subscriber's Application should send an invalid request (e.g. no VaccineCode).<br>
          <br>
          Suggested methods: allow token to expire or don't request sufficient scope (HTTP 401), omit VaccineCode from the request, supply a coding.display or coding.version value longer than 2048 characters, or an invalid value in a field with Required binding (e.g. status, Administered Product code).</td>
      <td>Send a screenshot showing the message displayed to the end user and the instructions on what they should do.<br>
          <br>
          Provide a list of error messages expected to be displayed to users when AIR responds with the following HTTP status codes: 403, 404, 412, 429, 500.</td>
      <td>Recommended</td>
    </tr>
    <tr>
      <th>AIR-Writer-6</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation Update API<br>
          <b>WHEN</b> an API call is made to the <b>Update API</b>, or an upsert that will result in updating a record,<br>
          AND one or more <strong>rejection</strong> errors occur<br>
          <b>THEN</b> a meaningful message is displayed to the end user in near real time<br>
          AND the message provides instruction on what the user needs to do to resolve the problem<br>
          AND no data is lost unless the user chooses to discard their entry.<br>
          <br>
          <strong>Note:</strong> the upsert method applies where the application holds local records it sent to AIR via HL7 messaging. An upsert updates the record in AIR when edits to the local record do not affect key fields.</td>
      <td>Subscriber's application sends an Immunisation update request with all required data elements except the Vaccine code.<br>
          <br>
          Suggested methods: change local resource version to not match AIR's or work with HNZ TA who can update the record in AIR while PMS edits are uncommitted (HTTP 412), or any method suggested for Create.</td>
      <td>Send the x-correlation-ID sent in the request and a screenshot that shows the message displayed to the end user and what they should do.</td>
      <td>Recommended</td>
    </tr>
    <tr>
      <th>AIR-Writer-7</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an immunisation record that has been withdrawn (<b>invalidated</b> or <b>deleted</b>)<br>
          AND the record has an AIR Identifier<br>
          <b>WHEN</b> an <b>Update API</b> call is made, or an <b>upsert</b> that will result in updating a record,<br>
          <b>THEN</b> the Application sends the following elements for each record:
          <ul>
            <li>status (entered-in-error)</li>
            <li>person (NHI, unchanged)</li>
            <li>any other data available for the record.</li>
          </ul>
          AND if the record is persisted locally, then the Application links the record using the AIR Identifier in the response.<br>
          <br>
          <b>Note:</b> the upsert method applies where the application holds local records it sent to AIR via HL7 messaging. An upsert updates the record in AIR when edits to the local record do not affect key fields.</td>
      <td>Subscriber's application sends an update Request to an immunisation record that has been invalidated or deleted.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Writer-8</th>
      <td>This test only applies if the Application supports updates, but <strong>does not preserve at event level the NHI number originally submitted.</strong><br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND an update to a completed or declined immunisation event successfully created in AIR previously, or successfully created then changed to entered-in-error,<br>
          AND the PMS record has an AIR Identifier<br>
          AND the patient's NHI number has been updated to a different valid NHI number<br>
          <b>WHEN</b> the Application calls the Update API with an NHI number different from the one in AIR for that record<br>
          AND the response from AIR contains meta.tag=&quot;patient-identifier-immutable&quot;<br>
          <b>THEN</b> the Application verifies the NHI number returned is not used by another patient in its system<br>
          AND if no conflict exists, then the Application processes the response normally as if the correct NHI had been used, otherwise handles the anomaly in a way the user can understand.</td>
      <td>Test setup procedure: subscriber's application sends an Immunisation Create request for the first NHI value and links the local record to AIR.<br>
          Test run procedure: 1. subscriber's application sends an Immunisation Update request with the <strong>second</strong> NHI value.<br>
          <br>
          The purpose of this test is to validate handling of live and dormant NHI numbers. This scenario is where:<br>
          1. An event is first submitted with NHI number A.<br>
          2. NHI number A is made dormant so the PMS patient record is updated to B. The Application now knows the patient as B.<br>
          3. Following that, in the NHI, A is split from B and made live again. At this point the Application has the record under patient B, but AIR will return NHI number A - possibly now existing in the PMS in their own right.<br>
          At some point in this sequence a patient's identity was assigned wrongly then corrected. The immunisation event record in AIR remains associated with the NHI number originally submitted.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory (conditional, stateful clients)</td>
    </tr>
    <tr>
      <th>AIR-Writer-9</th>
      <td>This test only applies if the Application supports updates to legacy records, but <strong>does not preserve at event level the NHI number originally submitted.</strong><br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND an update to a unique completed, declined immunisation event successfully created in AIR previously, or successfully created then changed to entered-in-error,<br>
          AND the PMS record <strong>does not</strong> have an AIR Identifier<br>
          AND the patient's NHI number has been updated to a different valid NHI number<br>
          <b>WHEN</b> the Application calls the <b>$upsert API</b> with an NHI number different from the one in AIR for that record<br>
          AND the response from AIR contains <code>meta.tag=&quot;patient-identifier-immutable&quot;</code><br>
          <b>THEN</b> the Application verifies the NHI number returned is not used by another patient in its system<br>
          AND if no conflict exists, then the Application processes the response normally as if the correct NHI had been used, otherwise handles the anomaly in a way the user can understand,<br>
          AND the Application links the local record to AIR.<br>
          <br>
          The purpose of this test is to validate handling of live and dormant NHI numbers as above.</td>
      <td>Test setup procedure: <br>
          1. Subscriber's application sends an Immunisation Create request for the first NHI value. The record must differ sufficiently from any other so a potential duplicate case doesn't arise.<br>
          2. Remove the AIR Identifier from the PMS record.<br>
          Test run procedure: 1. subscriber's application sends an Immunisation $upsert request with the second NHI value.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory (conditional, stateful clients)</td>
    </tr>
    <tr>
      <th>AIR-Writer-10</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an immunisation event record that is an <strong>exact duplicate</strong> of one other immunisation event previously submitted and linked successfully<br>
          AND the other immunisation record has an AIR Identifier<br>
          <b>WHEN</b> a call is made to the <b>Create API</b> to create the immunisation event<br>
          AND the API has responded to the API call with HTTP status 200 an Immunization resource with an AIR Identifier that already exists locally in the Application<br>
          <b>THEN</b> the Application invalidates or does not persist the new record<br>
          AND the Application informs the user of the outcome.<br>
          <br>
          <strong>Note:</strong> in this scenario the returned resource contains `meta.tag.code:` &quot;exact-duplicate-not-created&quot; - the application may use this tag to identify when this happens.</td>
      <td>Subscriber's application sends a Create request for an immunisation event record that is an exact duplicate of an immunisation event previously submitted successfully.<br>
          <br>
          For the purposes of this test, an exact duplicate is a record that has status completed or not-done, occurrence datetime exactly the same, and all other values the same except id and meta values. Refer to sheet 'Exact Duplicate Field List'. Applications are expected to instead use the existing record stored in AIR, rather than create an exact duplicate.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing  the status message displayed.<br>
          <br>
          Provide evidence of the outcome where there is a single up-to-date record for the immunisation event, with the id of the existing AIR record.<br>
          <br>
          Note that the corresponding Duplicate Resolution NEMS event may be ignored if handled correctly at the time of submission.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Writer-11</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an update to an immunisation event record that <strong>now</strong> is an <strong>exact duplicate</strong> of one other immunisation event previously submitted and linked successfully<br>
          AND the other immunisation record has an AIR Identifier<br>
          <b>WHEN</b> a call is made to the <b>Update API</b> to update the immunisation event<br>
          AND the API has responded with HTTP status 201 and an Immunization resource within the body of the response<br>
          <b>THEN</b> the Application detects the Potential Duplicate data quality condition<br>
          AND the Application informs the user of the outcome.<br>
          <br>
          Note that in this scenario, a NEMS Duplicate Resolution event is published identifying both records.<br>
          <br>
          For the purposes of this test, an exact duplicate is a record that has status completed or not-done, occurrence within the same day NZ time, and all other values the same except id and meta values, with the exception that Rabies and HepB occurrence comparison must be exact. Applications are expected to instead use the existing record stored in AIR, rather than create an exact duplicate.</td>
      <td>Subscriber's application sends an Update request for an immunisation event record that is an exact duplicate of an immunisation event previously submitted successfully.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing  the status message displayed.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Writer-12</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an updated immunisation event completed in NZ which <strong>now</strong> is an <strong>exact duplicate</strong> of another immunisation event previously submitted and linked successfully<br>
          AND the updated record <b>does not have an AIR Identifier,</b><br>
          <b>WHEN</b> a call is made to <b>$upsert</b> the record<br>
          AND the API has responded with HTTP status 200 and an Immunization resource with an AIR Identifier that already exists locally in the Application<br>
          <b>THEN</b> the Application invalidates or does not persist the new record<br>
          AND if the version is later than the previous record then the Application syncs the previous record<br>
          AND the Application informs the user of the outcome.</td>
      <td>Subscriber's application sends an upsert request for an immunisation event record that is an exact duplicate of an immunisation event previously submitted successfully.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing  the status message displayed.<br>
          <br>
          Provide evidence of the outcome where there is an single up-to-date record for the immunisation event, with the id of the existing AIR record.</td>
      <td>Mandatory (stateful clients)</td>
    </tr>
    <tr>
      <th>AIR-Writer-13</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an immunisation event with a health worker who has an <b>additional practicing credential</b> (nurse, doctor, midwife, paramedic or pharmacist) as an Administering Provider of a vaccination completed in NZ<br>
          <b>WHEN</b> an API call is made to create or update or upsert the immunisation event<br>
          <b>THEN</b> the Application assigns <code>performer.function.coding.code</code> the value &quot;VC&quot;.<br>
          <br>
          <b>Note:</b> the VHW function similarly may only be associated with AIR Vaccinating Health Workers administering vaccinations in NZ.</td>
      <td>Subscriber's application sends an Immunisation Create and Update requests with correct data elements for an administering provider with &quot;VC&quot; role, identified by NZMC, NZNC or CPN identifier.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update and the AIR Identifier received from AIR.<br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Writer-14</th>
      <td>This test only applies where the Application maintains its own identifiers for health workers who have no CPN, VHW, AIR Vaccinating Health Worker or recognised registration identifier.<br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an immunisation event with a <b>Health Care Assistant</b> or Kaiāwhina Hauora as an Administering Provider of a vaccination completed in NZ<br>
          <b>WHEN</b> an API call is made to <b>Create</b> or <b>Update</b> or <b>$upsert</b> the immunisation event<br>
          <b>THEN</b> the Application assigns <code>performer.actor.identifier.system</code> the value &quot;<code>https://HCA</code>&quot;<br>
          <br>
          For context, HCA supports the special case where the Responsible Provider is accountable, for traceability to an individual person authorised to administer vaccinations.</td>
      <td>Subscriber's application sends Immunisation Create and Update requests with correct data elements for an individual Administering Provider with no external identifier.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update and the AIR Identifier received from AIR.<br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Recommended (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Writer-15</th>
      <td>This test only applies if the Application supports updating of records first entered via the AIR Portal on behalf of the facility, for a vaccine not yet supported by the Application.<br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an update to an immunisation given at my facility that was first entered via the AIR portal and recorded in my system from a GET or search result<br>
          with a <b>vaccineCode unknown in the version of the AIR Vaccine Product Value Set supported</b> in the Application<br>
          <b>WHEN</b> an API call is made to <b>Update</b> the immunisation event,<br>
          <b>THEN</b> the <strong>Application preserves the <code>vaccineCode.coding.code</code> and <code>.system</code> from the original record.</strong><br>
          <br>
          <b>Note:</b> vaccineCode is one among several fields where the binding to the value set is 'preferred'. In the case of Health Worker <code>identifier.system</code>, no binding is present. <b>WHEN</b> such values are unchanged, value or code and system must be returned verbatim in the update request.</td>
      <td>Test setup procedure: import into the subscriber's application a record from AIR for an Immunisation given at the subscriber's facility, or create an event with a valid TPUU code.<br>
          Test run procedure: the subscriber's application sends an Update request for the record.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update and the AIR Identifier received from AIR.<br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Writer-16</th>
      <td>This test only applies if the Application supports Administered Products.<br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an immunisation event with a Administered Product TPUU code<br>
          <b>WHEN</b> a Create API or <b>Update API</b> call is made to create or update or upsert the immunisation event<br>
          <b>THEN</b> the <strong>Administered Product is consistent with the Vaccine Code.</strong></td>
      <td>Test setup procedure: import into the subscriber's application a record from AIR for an Immunisation given at the subscriber's facility.<br>
          Test run procedure: the subscriber's application sends an Update request for the record.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update AIR Identifier received from AIR.<br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Writer-17</th>
      <td>This test only applies if the Application supports updating of records entered via the AIR Portal for its facilities and either does not support Administered Products or the event's Administered Product is not yet supported locally.<br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an update to an immunisation given at my facility that was first entered via the AIR portal and recorded in my system from a GET or search result<br>
          with vaccine and an <b>unknown Administered Product that have not been changed</b><br>
          <b>WHEN</b> an API call is made to <b>Update</b> the immunisation event<br>
          <b>THEN</b> the Application preserves the <code>administeredProduct.coding.code</code> and <code>.system</code> from the original record.</td>
      <td>Test setup procedure: import into the subscriber's application a record from AIR for an Immunisation given at the subscriber's facility, which has an unknown administeredProduct.<br>
          Test run procedure: the subscriber's application sends an Update request for the record, not changing the vaccine or product details.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update AIR Identifier received from AIR.<br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Writer-18</th>
      <td>This test only applies where the Application supports immunisation records with inconsistent dates. <b>Note:</b> HNZ would prefer records with apparent inconsistencies be sent for AIR administrative review.<br>
          <br>
          <b>GIVEN</b> a completed or not-done immunisation event allowed by the application to have inconsistent dates<br>
          <b>WHEN</b> the user saves the record<br>
          <b>THEN</b> the Application requests confirmation this data is correct<br>
          AND the Application handles the Data Quality issue in the response in near real time in a way that is understandable to the user.<br>
          <br>
          Date inconsistencies could include, but are not limited to:<br>
          a. occurrence date is before the date of birth or after the date of death<br>
          b. occurrence date is in the future for a completed immunisation event<br>
          c. occurrence date is after a substance expiry date<br>
          d. serology result date in the future, before the date of birth or after the date of death (statusReson=DNI).</td>
      <td>Subscriber's application sends a completed or not-done immunisation event with a date to which the user has responded that it is intentionally inconsistent with other dates.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing the message that is displayed. An example for one of the scenarios listed should be sent.</td>
      <td>Recommended (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Writer-19</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI for a consumer who has <b>Restricted Access</b><br>
          AND an immunisation event for a vaccination completed in NZ that has been successfully created in AIR by the Application<br>
          <b>WHEN</b> an API call is made to search for the immunisation event<br>
          <b>THEN</b> the Application handles the redacted response without error.</td>
      <td>Set-up procedure: Subscriber's application sends an Immunisation Create request with the minimum data elements for this scenario.<br>
          Run procedure: Subscriber's application sends a search request for the consumer.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Writer-20</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation Update API<br>
          <b>WHEN</b> an API call is made to the <b>Update API</b>, Create API or an upsert that will result in updating a record,<br>
          AND one or more Data Quality violations occur<br>
          <b>THEN</b> a meaningful message is displayed to the end user<br>
          AND the message provides instruction on what the user needs to do to resolve the problem.</td>
      <td>Subscriber's application sends an Immunisation create, update and upsert requests with a data quality issue.<br>
          <br>
          What is feasible to test will depend on client-side validation. Typical DQ violations are: CPN fails checksum, performer function not in value set, non-vaccinator registration authority, NHI number passes checksum but not in NHI, status 'completed' with no batch number, event / batch / DoD / DoB date inconsistencies, unrecognised Related Person relationship code.</td>
      <td>Send the x-correlation-ID sent in the requests and screenshots that show messages displayed to the end user and what they should do.</td>
      <td>Recommended</td>
    </tr>
    <tr>
      <th>AIR-Writer-21</th>
      <td>This test only applies when the user identifier in the request header is that of a system or other software application, such as an AI tool.<br>
          <br>
          <b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND I am using software that provides a <b>system-to-system client id</b> in the request<br>
          AND an immunisation event given in NZ<br>
          <b>WHEN</b> an API call is made to create or update or upsert the immunisation event<br>
          <b>THEN</b> performer.actor identifiers are only of natural persons participating in the encounter including the responsible provider.</td>
      <td>Subscriber's application sends an Immunisation Create and Update requests with correct data elements for an administering provider who is the responsible person in the encounter.</td>
      <td>Send the x-correlation-ID sent in the request that was used in the update and the AIR Identifier received from AIR.<br>
          <br>
          Send a screenshot showing that the version of the Immunisation record was updated.</td>
      <td>Mandatory (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Writer-22</th>
      <td><b>GIVEN</b> I have the appropriate permission<br>
          AND a valid NHI <br>
          AND an immunisation event record that is a <b>double-dose Rabies</b> event differing in time-of-day from one previously submitted and linked successfully<br>
          <b>WHEN</b> a call is made to the <b>Create API</b> to create the immunisation event<br>
          AND the API has responded to the API call with HTTP status 200 <br>
          <b>THEN</b> the Application links the new record without error.<br>
          <br><br><em>Future state: the Data Quality assessment will be 100%, i.e. no data quality issue (ref. IMM-6734).</em></td>
      <td>Subscriber's application sends a Create request for an immunisation event record that is the same as a successfully submitted immunisation event at a different time on the same day, for a double-dose vaccine.</td>
      <td>Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send screenshots showing the two records.</td>
      <td>Mandatory</td>
    </tr>
  </tbody>
</table>
