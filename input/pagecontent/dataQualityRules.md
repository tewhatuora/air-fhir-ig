# Immunisation Event Data Quality Rules

### Summary

This page describes all of the validation rules, and quality indications, that will be applied when an Immunisation event is being created or updated within ImmSOT.

### Quality Indication

<table border=1><thead>
  <tr>
    <th>Indication<br></th>
    <th>Description<br></th>
    <th>Weighting<br></th>
  </tr></thead>
<tbody>
  <tr>
    <td>1 - MINOR&nbsp;&nbsp;</td>
    <td>Where a data element that fails validation does not materially impact AIR’s ability to assess vaccination state against the schedule</td>
    <td>1</td>
  </tr>
  <tr>
    <td>2 - MODERATE&nbsp;&nbsp;</td>
    <td>Where a data element that fails validation materially impacts AIR’s ability to assess vaccination state against the schedule or undermines the auditability of the record</td>
    <td>2</td>
  </tr>
  <tr>
    <td>3 - MAJOR&nbsp;&nbsp;</td>
    <td>Where the vaccine can not be determined or where a data element that fails validation may mean sub-potent delivery.</td>
    <td>3</td>
  </tr>
</tbody>
</table>

### Rules

<table border=1><thead>
  <tr>
    <th>Rule Name</th>
    <th>Field (Database Field name)</th>
    <th>FHIR API Name</th>
    <th>Run Criteria</th>
    <th>Error Code</th>
    <th>Weighting</th>
    <th>Quality Matrix Rule</th>
    <th>Validation Message</th>
  </tr></thead>
<tbody>
  <tr>
    <td>valid_nhi</td>
    <td>immunisation_event.nhi</td>
    <td>patient</td>
    <td>Status is ‘Completed' or 'not done’</td>
    <td>30</td>
    <td>3 - major</td>
    <td>An Immunisation Event must always be associated to a consumer record. </td>
    <td>The NHI number provided does not exist in the NHI. An immunisation event must include a valid NHI number.</td>
  </tr>
  <tr>
    <td>recognised_vaccine_code</td>
    <td>vaccine_code</td>
    <td>vaccineCode</td>
    <td>Status is ‘Completed' or 'not done’</td>
    <td>170</td>
    <td>3 - major&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>A vaccine code must be part of the air-vaccine-product-code value set.</td>
    <td>The vaccine code is unrecognised. A vaccine code should be part of the air-vaccine-product-code value set.</td>
  </tr>
  <tr>
    <td>valid_vaccine_expiration_date</td>
    <td>expiration_date</td>
    <td>expirationDate</td>
    <td>Status is 'Completed'</td>
    <td>270</td>
    <td>3 - major </td>
    <td>A vaccine batch expiry date must not be before the immunisation event date.</td>
    <td>An immunisation event should have a vaccine batch expiry date, and the vaccine batch expiry date should not be before the immunisation event date.</td>
  </tr>
  <tr>
    <td>valid_diluent_expiration_date</td>
    <td>diluent_expiration_date</td>
    <td>air-diluent.diluentExpiryDate</td>
    <td>Status is 'Completed'</td>
    <td>500</td>
    <td>3 - major&nbsp;&nbsp;</td>
    <td>A diluent expiry date must not be before the immunisation event date.</td>
    <td>An immunisation event should have a diluent expiry date, and the diluent expiry date should not be before the immunisation event date. </td>
  </tr>
  <tr>
    <td>valid_vaccine_expiration_date_current_year</td>
    <td>expiration_date</td>
    <td>expirationDate</td>
    <td>Status is ‘Completed’</td>
    <td>280</td>
    <td>1 - minor</td>
    <td>A vaccine batch expiry date must not be before the immunisation event date.</td>
    <td>The vaccine batch expiry date should not be before the immunisation event date.</td>
  </tr>
  <tr>
    <td>valid_diluent_expiration_date_current_year</td>
    <td>diluent_expiration_date</td>
    <td>air-diluent.diluentExpiryDate</td>
    <td>Status is ‘Completed’</td>
    <td>520</td>
    <td>1 - minor</td>
    <td>A diluent expiry date must not be before the immunisation event date.</td>
    <td>An immunisation event should have a diluent expiry date, and the diluent expiry date should not be before the immunisation event date. </td>
  </tr>
  <tr>
    <td>esam</td>
    <td>N/A</td>
    <td>N/A</td>
    <td>N/A</td>
    <td>N/A</td>
    <td> N/A</td>
    <td>N/A</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td>valid_facility</td>
    <td>facility_id</td>
    <td>location.managingOrganisation</td>
    <td>Status is ‘Completed' or 'not done’<br></td>
    <td>390</td>
    <td>1 - minor&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td>A facility must pass the facility checksum criteria.<br>A facility ID must begin with “F”.<br> The facility system must be <a href="https://standards.digital.health.nz/ns/hpi-facility-id">https://standards.digital.health.nz/ns/hpi-facility-id</a></td>
    <td>The facility ID / system is unrecognised. The facility ID should begin with "F", it should pass the facility checksum criteria, and the facility system must be <a href="https://standards.digital.health.nz/ns/hpi-facility-id.">https://standards.digital.health.nz/ns/hpi-facility-id.</a></td>
  </tr>
  <tr>
    <td>recognised_route_code</td>
    <td>route_code</td>
    <td>route</td>
    <td>Status is 'Completed'</td>
    <td>290</td>
    <td>1 - minor&nbsp;&nbsp;</td>
    <td>A route code must be part of the air-route-code value set</td>
    <td>The route code is unrecognised. A route code should be part of the air-route-code value set.</td>
  </tr>
  <tr>
    <td>recognised_body_site</td>
    <td>body_site_code</td>
    <td>site.coding[].code</td>
    <td>Status is 'Completed'</td>
    <td>310</td>
    <td>1 - minor&nbsp;&nbsp;</td>
    <td>A body site code must be part of the air-site-code value set</td>
    <td>The body site code is unrecognised. A body site code should be part of the air-site-code value set.</td>
  </tr>
  <tr>
    <td>recognised_health_worker_function_code</td>
    <td>health_worker_function</td>
    <td>performer[].function</td>
    <td>Status is ‘Completed' or 'not done’</td>
    <td>470</td>
    <td>1 - minor&nbsp;&nbsp;</td>
    <td>A health worker function value must be part of the air-vaccinator-function-code value set.</td>
    <td>One or more health worker function value is unrecognised. A health worker function value should be part of the air-vaccinator-function-code value set.</td>
  </tr>
  <tr>
    <td>valid_health_worker_id</td>
    <td>identification_number</td>
    <td>performer[].actor</td>
    <td>Status is ‘completed’ or ‘not done’</td>
    <td>430</td>
    <td>2 - moderate&nbsp;&nbsp;</td>
    <td> The health worker system must be one of the following:<br>https://standards.digital.health.nz/ns/air-vhw-id<br>https://standards.digital.health.nz/ns/hpi-person-id<br>https://standards.digital.health.nz/ns/medical-council-id<br>https://standards.digital.health.nz/ns/nursing-council-id <br>https://standards.digital.health.nz/ns/air-cir-id<br>https://standards.digital.health.nz/ns/pharmacy-council-id<br>https://standards.digital.health.nz/ns/paramedic-council-id<br>https://standards.digital.health.nz/ns/midwifery-council-id<br>https://HCA<br>A health worker identification number must pass the checksum criteria when the health worker system is <a href="https://standards.digital.health.nz/ns/hpi-person-id">https://standards.digital.health.nz/ns/hpi-person-id</a></td>
    <td>One or more health worker is unrecognised. An immunisation event should have a health worker identification number that passes the checksum criteria when the system is <a href="https://standards.digital.health.nz/ns/hpi-person-id,">https://standards.digital.health.nz/ns/hpi-person-id,</a> or it should have a health worker identification number and the system <a href="https://standards.digital.health.nz/ns/air-vhw-id">https://standards.digital.health.nz/ns/air-vhw-id</a> or <a href="https://standards.digital.health.nz/ns/medical-council-id">https://standards.digital.health.nz/ns/medical-council-id</a> or <a href="https://standards.digital.health.nz/ns/nursing-council-id">https://standards.digital.health.nz/ns/nursing-council-id</a> or <a href="https://standards.digital.health.nz/ns/air-cir-id">https://standards.digital.health.nz/ns/air-cir-id</a> or <a href="https://standards.digital.health.nz/ns/pharmacy-council-id">https://standards.digital.health.nz/ns/pharmacy-council-id</a> or <a href="https://standards.digital.health.nz/ns/paramedic-council-id">https://standards.digital.health.nz/ns/paramedic-council-id</a> or <a href="https://standards.digital.health.nz/ns/midwifery-council-id">https://standards.digital.health.nz/ns/midwifery-council-id</a> or <a href="https://HCA">https://HCA</a></td>
  </tr>
  <tr>
    <td>recognised_indication_code</td>
    <td>reasonCode.value</td>
    <td>code</td>
    <td>Status is 'Completed' or 'not done’</td>
    <td>150</td>
    <td>2 - moderate</td>
    <td>An indication code must be part of the air-indication-code value set. </td>
    <td>One or more indication code is unrecognised. An indication code should be part of the air-indication-code value set.</td>
  </tr>
  <tr>
    <td>required_vaccine_batch_number</td>
    <td>lot_number</td>
    <td>lotNumber</td>
    <td>Status is ‘Completed' <br>AND Status Reason is not ‘Overseas Vaccination’ or ‘Historic Vaccination’</td>
    <td>250</td>
    <td>1 - minor</td>
    <td>An immunisation event must have a vaccine batch number</td>
    <td>An immunisation event should have a vaccine batch number.</td>
  </tr>
  <tr>
    <td>recognised_status_reason_code</td>
    <td>status_reason_code</td>
    <td>statusReason</td>
    <td>Status is ‘Completed’ or ‘not done’</td>
    <td>510</td>
    <td>2 - Moderate</td>
    <td>A status reason must be part of the air-status-reason-code value set</td>
    <td>The status reason is unrecognised. A status reason should be part of the air-status-reason-code value set.</td>
  </tr>
  <tr>
    <td>immunisation_event_date_after_DOD</td>
    <td>immunisation_event_date</td>
    <td>occurrence</td>
    <td>Status is ‘Completed’ or ‘not done’</td>
    <td>710</td>
    <td>2 - Moderate </td>
    <td>Where a consumer has a date of death, the Immunisation occurrence date must not be after</td>
    <td>The immunisation event date is after the consumer’s date of death</td>
  </tr>
  <tr>
    <td>immunisation_event_date_before_DOB</td>
    <td>immunisation_event_date</td>
    <td>occurrence</td>
    <td>Status is ‘Completed’ or ‘not done’</td>
    <td>720</td>
    <td>2 - Moderate </td>
    <td>The Immunisation occurrence date must be on or after the consumer’s date of birth</td>
    <td>The immunisation event date is before the consumer’s date of birth</td>
  </tr>
  <tr>
    <td>immunisation_event_future_date</td>
    <td>immunisation_event_date</td>
    <td>occurrence</td>
    <td>Status is ‘Completed’ or ‘not done’</td>
    <td>750</td>
    <td>2 - Moderate&nbsp;&nbsp;</td>
    <td>The immunisation occurrence date cannot be in the future</td>
    <td>The immunisation event date cannot be in the future</td>
  </tr>
  <tr>
    <td>duplicates</td>
    <td>N/A</td>
    <td>N/A</td>
    <td>Status is ‘Completed’ or ‘not done’</td>
    <td>800</td>
    <td>N/A - Duplicates do not have a weighting and do not contribute to scoring</td>
    <td>Two or more immunisation events must not match on consumer, vaccine code, and occurrence date (excluding the time component). </td>
    <td>This Immunization resource has been identified as a duplicate of existing Immunization resources</td>
  </tr>
  <tr>
    <td>serology_observation_date_future</td>
    <td>serology_observation.datetime</td>
    <td></td>
    <td>Immunisation Event Status is ‘Completed’ or ‘not done’</td>
    <td>610</td>
    <td>2 - Moderate&nbsp;&nbsp;</td>
    <td>The serology observation date cannot be in the future</td>
    <td>The serology observation date cannot be in the future</td>
  </tr>
  <tr>
    <td>recognised_<br>relationship<br>_code</td>
    <td>imms.relationship.code</td>
    <td>AIRRelatedPerson.relationship.coding.code</td>
    <td>Status is ‘Completed' or 'not done’</td>
    <td></td>
    <td>1 - minor </td>
    <td>A relationship code should be part of the air-related-person-relationship value set</td>
    <td>The related person relationship code is unrecognised. A relationship code should be part of the air-related-person-relationship value set.</td>
  </tr>
</tbody></table>

