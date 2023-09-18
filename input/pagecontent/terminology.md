This page provides a list of the FHIR terminology artifacts defined as part of this implementation guide.
<h3>Code Systems</h3>
<table class='table table-bordered table-condensed'>
<tr><th>Title</th><th>Description</th><th>Canonical url</th></tr>
<tr>
<td><a href="CodeSystem-air-event-type-1.0.html">AIR Event Type-1.0</a> </td>
<td> <p>Identifies AIR events.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-event-type">https://standards.digital.health.nz/ns/air-event-type</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-immunisation-notification-action-code-1.0.html">AIR Immunisation Notification Action Code-1.0</a> </td>
<td> <p>Describes the action taken by Orchestration server in response to an Immunisation Notification request message</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-immunisation-notification-action-code">https://standards.digital.health.nz/ns/air-immunisation-notification-action-code</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-operationoutcome-code-1.0.html">AIR Operationoutcome Codes-1.0</a> </td>
<td> <p>Describes the AIR-specific errors</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-operationoutcome-code">https://standards.digital.health.nz/ns/air-operationoutcome-code</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-related-person-terms.html">AIR Related Person Relationship Terms-undefined</a> </td>
<td> <p>This code system includes the relationship type codes used in the NIR HL7v2 messasing NK1 segment Relationship field.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-related-person-terms">https://standards.digital.health.nz/ns/air-related-person-terms</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-serology-protection-terms.html">AIR Serology Protection Terms Code System-undefined</a> </td>
<td> <p>This local code system includes the terms used in legacy HL7 messages and FHIR requests related to serology reports for protection status for diseases such as Hepatitis B.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-serology-protection-terms">https://standards.digital.health.nz/ns/air-serology-protection-terms</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-terms-code.html">AIR Terms-undefined</a> </td>
<td> <p>This is a code system for all the terms needed in AIR ImmSoT that don&#39;t come from an external standard</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-terms-code">https://standards.digital.health.nz/ns/air-terms-code</a></td>
</tr>
<tr>
<td><a href="CodeSystem-Hl7v2-result.html">Hl7v2 Result Code-1.0</a> </td>
<td> <p>Hl7v2 Result Code.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/hl7v2-result">https://standards.digital.health.nz/ns/hl7v2-result</a></td>
</tr>
</table>
<h3>ValueSets</h3>
<table class='table table-bordered table-condensed'>
<tr>
<td><a href="ValueSet-air-route-code-legacy.html">AIR Route Code (Legacy HL7v2)-undefined</a> </td>
<td> <p>A value set to hold the legacy HL7v2 codes for route of admin.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code-legacy">https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code-legacy</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-route-code.html">AIR Route of Administration Value Set-undefined</a> </td>
<td> <p>Route of administration value set for AIR immunisations</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-site-code.html">AIR Body Site Value Set-undefined</a> </td>
<td> <p>Body sites value set for AIR immunisations</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-status-reason-code.html">AIR Status Reason Code-undefined</a> </td>
<td> <p>Values to use in the status reason field of an immunisation event.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-status-reason-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-status-reason-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-hl7v2-result-1.0-code.html">Hl7v2_resultResult Code-1.0</a> </td>
<td> <p>Hl7v2_result Result Code.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/hl7v2-result">https://nzhts.digital.health.nz/fhir/ValueSet/hl7v2-result</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-disease-covered-code.html">AIR Diseases Covered-undefined</a> </td>
<td> <p>Diseases that are covered by the immunization programmes and schedules that are managed or referred to in the AIR system.</p></td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ValueSet/air-disease-covered-code">https://standards.digital.health.nz/fhir/air/ValueSet/air-disease-covered-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-indication-code.html">AIR Indication Codes-undefined</a> </td>
<td> <p>Coded values to describe the reason an immunisation was given. Initially drawn from legacy NIR codes and CIR SNOMED codes.</p></td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ValueSet/air-indication-code">https://standards.digital.health.nz/fhir/air/ValueSet/air-indication-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-performer-health-worker-function-code.html">AIR Performer Health Worker Function-undefined</a> </td>
<td> <p>A value set of codes for the functions performed by the people who are involved in administering immunisations in Aotearoa. Note that the preferred terms are VC, VHW and IP. The other terms in this value set will be deprecated in the future.</p></td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ValueSet/air-performer-health-worker-function-code">https://standards.digital.health.nz/fhir/air/ValueSet/air-performer-health-worker-function-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-related-person-relationship.html">AIR Related Person Relationship Codes-undefined</a> </td>
<td> <p>This value set is used to encode the relationship of a related person to the vaccine consumer. It is a subset of the FHIR Patient Relationship Type value set.</p></td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ValueSet/air-related-person-relationship">https://standards.digital.health.nz/fhir/air/ValueSet/air-related-person-relationship</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-serology-protection-code.html">AIR Serology Protection Code Value Set-undefined</a> </td>
<td> <p>This value set includes all codes from the AIR Serology Protection code system.</p></td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ValueSet/air-serology-protection-code">https://standards.digital.health.nz/fhir/air/ValueSet/air-serology-protection-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-vaccine-product-code.html">AIR Vaccine Product Value Set-undefined</a> </td>
<td> <p>Allowable values for vaccine products in AIR.</p></td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ValueSet/air-vaccine-product-code">https://standards.digital.health.nz/fhir/air/ValueSet/air-vaccine-product-code</a></td>
</tr>
</table>
<h3>Concept Maps</h3>
<table class='table table-bordered table-condensed'>
<tr>
<td><a href="ConceptMap-air-site-map.html">Concept Map -- Vaccination Site HL7v2 < -- > SNOMED-undefined</a> </td>
<td> <p>This maps the vaccination site codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0162) to SNOMED CT NZ.</p> </td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ConceptMap/air-site-map">https://standards.digital.health.nz/fhir/air/ConceptMap/air-site-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-air-status-reason-map.html">Concept Map --Immunisation Status Reason Codes-undefined</a> </td>
<td> <p>This maps the immunisation status reason codes across various code systems. The AIR target is to record these using SNOMED CT NZ Edition.</p> </td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ConceptMap/air-status-reason-map">https://standards.digital.health.nz/fhir/air/ConceptMap/air-status-reason-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-gender-code-map.html">Concept Map -- Gender Code HL7v2 PID < -- > Administrative Gender used in FHIR R4-undefined</a> </td>
<td> <p>This maps the gender codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0001) to the codes returned by the NHI Service.</p> </td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ConceptMap/gender-code-map">https://standards.digital.health.nz/fhir/air/ConceptMap/gender-code-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-route-map.html">Concept Map -- Route of Administration HL7v2 < -- > SNOMED-undefined</a> </td>
<td> <p>This maps the Route codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0162) to SNOMED CT NZ.</p> </td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ConceptMap/route-map">https://standards.digital.health.nz/fhir/air/ConceptMap/route-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-target-disease-map.html">Concept Map -- Target Disease (SNOMED) < -- > Vaccine (CVX)-undefined</a> </td>
<td> <p>This map connects vaccine-preventable diseases (identified by SNOMED codes) to the vaccines that target them (identified by CVX codes). This mapping facilitates searching ImmSOT using the targetDisease search parameter.</p> </td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ConceptMap/target-disease-map">https://standards.digital.health.nz/fhir/air/ConceptMap/target-disease-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-vaccine-product-map.html">Concept Map -- Vaccine Product TPUU (NZMT) < -- > Vaccine (CVX)-undefined</a> </td>
<td> <p>This map connects vaccine products as identified by the Therapeutic Product Unit of Use (TPUU) code in the New Zealand Medicines Terminology (NZMT) to the vaccines as identified by CVX codes. This mapping facilitates translating TPUU codes stored in ImmSOT to a CVX code that can be received by legacy PMS systems.</p> </td>
<td> <a href="https://standards.digital.health.nz/fhir/air/ConceptMap/vaccine-product-map">https://standards.digital.health.nz/fhir/air/ConceptMap/vaccine-product-map</a></td>
</tr>
</table>