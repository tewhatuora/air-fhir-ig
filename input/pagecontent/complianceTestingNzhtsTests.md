### Health NZ Terminology Service
The Health NZ Terminology Service (NZHTS) provides standard codes and display values used by all applications that present or create immunisation data. While many read-only use cases can use display or text values contained within FHIR resources from the AIR, any application sending data to the AIR shall use terms and concept properties specified in the NZHTS to avoid validation failures.

Terms are grouped according to likelihood, frequency and impact of changes. Subscriber applications shall synchronise frequently and infrequently changing terms with NZHTS on a regular cadence (typically nightly) using the NZHTS APIs. Vendors are required to perform manual validation prior to changes being applied. Detailed requirements are available on request to the AIR project team.

If your application requires the NZHTS, then request access when [Onboarding](onboarding.html).

As no Terminology Service sandbox is available, compliance may be obtained via demonstration in the vendor’s environment and planning for production validation testing (PVT). To do this, arrange a Teams call with the AIR project team. This will be recorded. 

### NZHTS Compliance Tests

<table class="table table-bordered table-hover table-sm">
  <thead>
    <tr>
      <th>Reference</th>
      <th>Test</th>
      <th>Test Data Input</th>
      <th>Compliance Test Evidence</th>
      <th>Mandatory / Optional / Recommended</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>AIR-Term-1</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND a new Vaccine Product available in NZ is added to the value set<br>
          AND the Vaccine Product is used on a new immunisation record<br>
          <b>WHEN</b> a Create API call is made to create the immunisation event<br>
          <b>THEN</b> the immunisation record specifies the new Vaccine Product.</td>
      <td>Vaccine Product newly available in NZ.</td>
      <td>If suitable terminology data is not available in the Production NZHTS, then demonstrate connectivity to the NZHTS separately from the feature consuming changed values in a test environment. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send screen shots demonstrating approval process. Send a screenshot showing that the Immunisation record was created using the new vaccine.</td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Term-2</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND an approved change to Vaccine Product properties<br>
          AND the Vaccine Product is used on a immunisation record<br>
          <b>WHEN</b> the user uses the changed Vaccine Product <br>
          <b>THEN</b> the application displays or makes available the updated properties.</td>
      <td>Vaccine Product with changed Display and Indications.</td>
      <td>If suitable terminology data is not available, then demonstrate connectivity and functionality separately as above. <br>
          <br>
          Send screen shots demonstrating approval process and UI behaviour change when Vaccine Product properties are updated. Send a screenshot showing that the Immunisation record was created using the changed terms. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. </td>
      <td>Mandatory</td>
    </tr>
    <tr>
      <th>AIR-Term-3</th>
      <td>This test only applies to applications that support Administered Products (TPUU items in the NZULM).<br>
          <br>
          <b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND an immunisation record with attributes not conforming with an Administered Product's properties<br>
          <b>WHEN</b> the user attempts to save the record <br>
          <b>THEN</b> the application requires the user to confirm the non-conformant values<br>
          AND if confirmed then a Create API call is made to create the immunisation event.<br>
          <br>
          Repeat the test performing an Update request.</td>
      <td>Immunisation Event with no diluent batch or expiry date for an Administered Product that requires a diluent.<br>
          <br>
          Immunisation Event with body site not among those available for the Administered Product.</td>
      <td>If suitable terminology data is not available, then demonstrate connectivity and functionality separately as above. <br>
          <br>
          Send screen shots demonstrating approval process and UI behaviour change when Vaccine Product properties are updated. Send a screenshot showing that user was required to confirm the anomalous data entry. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. </td>
      <td>Mandatory (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Term-4</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND an approved change made to &quot;infrequently changing&quot; value set <br>
          AND a changed value in the value set is used on a immunisation record<br>
          <b>WHEN</b> a Create API call is made to create the immunisation event<br>
          <b>THEN</b> the immunisation event contains the changed value.</td>
      <td>Changed entry in value set in the &quot;infrequently changing&quot; list.</td>
      <td>Use an 'infrequently updated' value set that changed recently. If suitable terminology data is not available, then demonstrate connectivity and functionality separately as above. <br>
          <br>
          Send screen shots demonstrating approval process and UI behaviour change when the PMS is updated. Send a screenshot showing that the Immunisation record was created using the changed terms. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. </td>
      <td>Recommended</td>
    </tr>
    <tr>
      <th>AIR-Term-5</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND an immunisation record with event date not conforming with a Vaccine Product's properties<br>
          <b>WHEN</b> the user attempts to save the record <br>
          <b>THEN</b> the application requires the user to confirm the non-conformant date<br>
          AND if confirmed then a Create API call is made to create the immunisation event.<br>
          <br>
          Repeat the test performing an Update request.</td>
      <td>Immunisation event with today's date for a vaccine no longer available in NZ, with batch, body site and route (statusReason GIVEN, not HSTGIVN).<br>
          <br>
          Vaccine Product codes meeting this requirement: 04, 06, 09, 44, 103, 116, 127, 160, 208, 210, 99003, 99013</td>
      <td>If suitable terminology data is not available, then demonstrate connectivity and functionality separately as above. <br>
          <br>
          Send screen shots demonstrating approval process and UI behaviour change when Vaccine Product properties are updated. Send a screenshot showing that user was required to confirm the anomalous data entry. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. </td>
      <td>Recommended</td>
    </tr>
    <tr>
      <th>AIR-Term-6</th>
      <td><b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND a Vaccine Product is added to the set of Overseas vaccines<br>
          AND the Vaccine Product is used on a new immunisation record with statusReason GIVNOS<br>
          <b>WHEN</b> a Create API call is made to create the immunisation event<br>
          <b>THEN</b> the immunisation record specifies the changed Vaccine Product.</td>
      <td>Vaccine Product now available Overseas. Body Site, Route, batch details are optional.</td>
      <td>If suitable terminology data is not available in the Production NZHTS, then demonstrate connectivity to the NZHTS separately from the feature consuming changed values in a test environment. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the Immunisation record was created using the Overseas vaccine.</td>
      <td>Recommended</td>
    </tr>
    <tr>
      <th>AIR-Term-7</th>
      <td>This test applies if the Application supports Historical vaccinations.<br>
          <br>
          <b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND a Vaccine Product is added to the set of Historical vaccines<br>
          AND the Vaccine Product is used on a new immunisation record with statusReason HSTGIVN<br>
          <b>WHEN</b> a Create API call is made to create the immunisation event<br>
          <b>THEN</b> the immunisation record specifies the changed Vaccine Product.</td>
      <td>Vaccine Product now available for Historical events. Body Site, Route, batch details are optional.</td>
      <td>If suitable terminology data is not available in the Production NZHTS, then demonstrate connectivity to the NZHTS separately from the feature consuming changed values in a test environment. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the Immunisation record was created using the Historic vaccine.</td>
      <td>Recommended (conditional)</td>
    </tr>
    <tr>
      <th>AIR-Term-8</th>
      <td>This test applies if the Application supports Administered Products.<br>
          <br>
          <b>GIVEN</b> my application is a consumer of the immunisation and NZHTS APIs<br>
          AND an Administered Product available in NZ requires diluent<br>
          AND the Administered Product is used on a new immunisation record<br>
          AND the user does not provide diluent batch details<br>
          <b>WHEN</b> the user attempts to save the record<br>
          <b>THEN</b> the Application requests confirmation<br>
          AND if confirmed then a Create API call is made to create the immunisation event.<br>
          <br>
          Repeat the test supplying a Body Site not in the set expected for the Administered Product.</td>
      <td>Administered Product that requires diluent.</td>
      <td>If suitable terminology data is not available, then demonstrate connectivity and functionality separately as above. <br>
          <br>
          Send the x-correlation-ID header sent with the request and the AIR Identifier received from AIR. <br>
          <br>
          Send a screenshot showing that the user was required to confirm the anomalous data entry.</td>
      <td>Recommended (conditional)</td>
    </tr>
  </tbody>
</table>
