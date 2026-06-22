This page provides a list of the FHIR terminology artifacts defined as part of this implementation guide.
<h3>Code Systems</h3>
<table class='table table-bordered table-condensed'>
<tr><th>Title</th><th>Description</th><th>Canonical url</th></tr>
<tr>
<td><a href="CodeSystem-air-agvs-schedule-type.html">AIR AGVS Schedule Type-undefined</a> </td>
<td> <p>This is a code system for representing the type of AGVS schedule attached to a Scheduled Event</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-agvs-schedule-type">https://standards.digital.health.nz/ns/air-agvs-schedule-type</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-agvs-series-type.html">AIR AGVS Series Type-undefined</a> </td>
<td> <p>This is a code system for representing the type of AGVS series attached to a Scheduled Event</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-agvs-series-type">https://standards.digital.health.nz/ns/air-agvs-series-type</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-agvs-type.html">AIR AGVS-undefined</a> </td>
<td> <p>This is a code system for representing the type of AGVS attached to a Scheduled Event</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-agvs-type">https://standards.digital.health.nz/ns/air-agvs-type</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-consumer-state.html">AIR Consumer State-undefined</a> </td>
<td> <p>This is a code system for representing the current state of an AIR Patient (AKA Consumer).</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-consumer-state">https://standards.digital.health.nz/ns/air-consumer-state</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-consumer-sub-status.html">AIR Consumer Sub Status-undefined</a> </td>
<td> <p>This is a code system for representing the current sub status of an AIR Patient (AKA Consumer).</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-consumer-sub-status">https://standards.digital.health.nz/ns/air-consumer-sub-status</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-event-type-1.0.html">AIR Event Type-1.0</a> </td>
<td> <p>Identifies AIR events.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-event-type">https://standards.digital.health.nz/ns/air-event-type</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-forecast-status.html">AIR Forecast Status-undefined</a> </td>
<td> <p>This code system includes the codes used in AIR to communicate a planned event status that are not already included in http://terminology.hl7.org/CodeSystem/immunization-recommendation-status.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-forecast-status">https://standards.digital.health.nz/ns/air-forecast-status</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-immunisation-notification-action-code-1.0.html">AIR Immunisation Notification Action Code-1.0</a> </td>
<td> <p>Describes the action taken by Orchestration server in response to an Immunisation Notification request message</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-immunisation-notification-action-code">https://standards.digital.health.nz/ns/air-immunisation-notification-action-code</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-related-person-terms.html">AIR Related Person Relationship Terms-undefined</a> </td>
<td> <p>This code system includes the relationship type codes used in the NIR HL7v2 messasing NK1 segment Relationship field.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-legacy-related-person-terms">https://standards.digital.health.nz/ns/air-legacy-related-person-terms</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-operationoutcome-code-1.0.html">AIR Operationoutcome Codes-1.0</a> </td>
<td> <p>Describes the AIR-specific errors</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-operationoutcome-code">https://standards.digital.health.nz/ns/air-operationoutcome-code</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-planned-event-date-type.html">AIR Planned Event Date Type Code System-undefined</a> </td>
<td> <p>This code system includes the codes used in AIR to communicate a date associated with a planned event, such as the due date or the earliest date to give. </p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-planned-event-date-type">https://standards.digital.health.nz/ns/air-planned-event-date-type</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-processing-terms.html">AIR Processing Terms-undefined</a> </td>
<td> <p>This Code System contains meta tags that AIR uses to signal processing outcomes</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-processing-terms">https://standards.digital.health.nz/ns/air-processing-terms</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-planned-event-type-terms.html">AIR Planned Event Type-undefined</a> </td>
<td> <p>This code system includes values for the types of Planned Events used in AIR.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-scheduled-event-type-terms">https://standards.digital.health.nz/ns/air-scheduled-event-type-terms</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-serology-protection-terms.html">AIR Serology Protection Terms Code System-undefined</a> </td>
<td> <p>This local code system includes the terms used in legacy HL7 messages and FHIR requests related to serology reports for protection status for diseases such as Hepatitis B.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-serology-protection-terms">https://standards.digital.health.nz/ns/air-serology-protection-terms</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-status-reason-terms.html">AIR Status Reason Terms Code System-undefined</a> </td>
<td> <p>This AIR code system includes the terms used in NIR HL7v2 messages to populate the RXA-18 field and and in FHIR payloads to populate immunization.statusReason.</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-status-reason-terms">https://standards.digital.health.nz/ns/air-status-reason-terms</a></td>
</tr>
<tr>
<td><a href="CodeSystem-air-terms-code.html">AIR Terms-undefined</a> </td>
<td> <p>This is a code system for terms needed in AIR ImmSoT that don&#39;t come from an external standard</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/air-terms-code">https://standards.digital.health.nz/ns/air-terms-code</a></td>
</tr>
<tr>
<td><a href="CodeSystem-Hl7v2-result.html">Hl7v2 Result Code-1.0</a> </td>
<td> <p>Hl7v2 Result Code</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/hl7v2-result">https://standards.digital.health.nz/ns/hl7v2-result</a></td>
</tr>
<tr>
<td><a href="CodeSystem-immunisation-code.html">NZVX Immunisation Code-undefined</a> </td>
<td> <p>Antigen code set for vaccines administered in New Zealand (NZVX).</p> </td>
<td> <a href="https://standards.digital.health.nz/ns/immunisation-code">https://standards.digital.health.nz/ns/immunisation-code</a></td>
</tr>
</table>
<h3>ValueSets</h3>
<table class='table table-bordered table-condensed'>
<tr>
<td><a href="ValueSet-air-administered-product-code.html">AIR Administered Product Code-undefined</a> </td>
<td> <p>NZMT TPUU codes for use in populating the administeredProduct element in an AIR Immunization resource.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-administered-product-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-administered-product-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-antigen-group-code.html">AIR Antigen Group Code-undefined</a> </td>
<td> <p>SNOMED CT Codes used in AIR to identify an Antigen Group. These codes are drawn from the SNOMED medicinal product hierarchy. The AIR Antigen Group is used in the ImmunizationRecommendation resource that is produced when a user requests a patient&#39;s list of Planned Events.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-antigen-group-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-antigen-group-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-consumer-state-code.html">AIR Consumer State Code-undefined</a> </td>
<td> <p>Represents the current state of an AIR Consumer.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-consumer-state-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-consumer-state-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-consumer-sub-status-code.html">AIR Consumer Sub Status Code-undefined</a> </td>
<td> <p>Represents the current sub status of an AIR Consumer.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-consumer-sub-state-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-consumer-sub-state-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-disease-covered-code.html">AIR Diseases Covered-undefined</a> </td>
<td> <p>Diseases that are covered by the immunization programmes and schedules that are managed or referred to in the AIR system.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-disease-covered-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-disease-covered-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-forecast-status-code.html">AIR Forecast Status-undefined</a> </td>
<td> <p>This value set includes the codes used in AIR to communicate the status of a planned event. </p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-forecast-status-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-forecast-status-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-hl7v2-imm-func-code.html">AIR HL7v2 Immunization Function Code-undefined</a> </td>
<td> <p>This value set holds health worker function codes used in legacy NIR messaging. Its purpose in AIR is to enable a mapping to semantically equivalent AIR Terms codes. These codes should NOT be used in FHIR payloads.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-hl7v2-imm-func-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-hl7v2-imm-func-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-imm-func-code-code-legacy.html">AIR Immunization Function Code (legacy)-undefined</a> </td>
<td> <p>This value set holds legacy health worker function codes. Its purpose in AIR is to enable a mapping to semantically equivalent AIR Terms codes. These codes should NOT be used in FHIR payloads.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-imm-func-code-legacy">https://nzhts.digital.health.nz/fhir/ValueSet/air-imm-func-code-legacy</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-indication-code.html">AIR Indication Code-undefined</a> </td>
<td> <p>Coded values to describe the reason an immunisation was given. Initially drawn from legacy NIR codes and CIR SNOMED codes.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-indication-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-indication-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-performer-health-worker-function-code.html">AIR Performer Health Worker Function-undefined</a> </td>
<td> <p>A value set of codes for the functions performed by the people who are involved in administering immunisations in Aotearoa. Note that the preferred terms are AP, OP, VC, VHW and IP. The other terms in this value set will be deprecated in the future. Note that the following codes are considered as Administering Providers: AP, IP, LMC, OIS, PV, VC, VHW, WCP. The following code is considered an Ordering Provider: GP.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-performer-health-worker-function-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-performer-health-worker-function-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-planned-event-date-type-code.html">AIR Planned Event Date Type Code-undefined</a> </td>
<td> <p>Coded values to describe the dates associated with a Planned Event, such as the Due Date, the Earliest Date to Give, and so on. Also codes pretaining to the Planned Event record in AIR, such as the date it was created and the date the Planned Event moved in Final status.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-planned-event-date-type-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-planned-event-date-type-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-processing-terms-code.html">AIR Processing Terms Code-undefined</a> </td>
<td> <p>This Value Set contains meta tags that AIR uses to signal processing outcomes.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-processing-terms-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-processing-terms-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-related-person-relationship-code.html">AIR Related Person Relationship Code-undefined</a> </td>
<td> <p>This value set is used to encode the relationship of a related person to the vaccine consumer. It is a subset of the FHIR Patient Relationship Type value set and includes some customised codes and displays for NZ usage.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-related-person-relationship-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-related-person-relationship-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-route-code-legacy.html">AIR Route Code (Legacy HL7v2)-undefined</a> </td>
<td> <p>A value set to hold the legacy HL7v2 codes for route of admin.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code-legacy">https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code-legacy</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-route-code.html">AIR Route of Administration-undefined</a> </td>
<td> <p>Route of administration value set for AIR immunisations</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-route-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-scheduled-event-type-code.html">AIR Scheduled Event Type Code-undefined</a> </td>
<td> <p>This value set lists the codes to be used to describe scheduled event type in AIR.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-scheduled-event-type-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-scheduled-event-type-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-serology-protection-code.html">AIR Serology Protection Code-undefined</a> </td>
<td> <p>This value set includes all codes from the AIR Serology Protection code system.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-serology-protection-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-serology-protection-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-site-code.html">AIR Body Site-undefined</a> </td>
<td> <p>Body sites value set for AIR immunisations</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-site-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-status-reason-code.html">AIR Status Reason Code-undefined</a> </td>
<td> <p>Values to use in the status reason field of an immunisation event.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-status-reason-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-status-reason-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-air-vaccine-product-code.html">AIR Vaccine Product-undefined</a> </td>
<td> <p>Allowable values for CVX and NZVX codes used to populate the vaccineCode element in an AIR Immunization resource.</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-vaccine-product-code">https://nzhts.digital.health.nz/fhir/ValueSet/air-vaccine-product-code</a></td>
</tr>
<tr>
<td><a href="ValueSet-hl7v2-result-1.0-code.html">Hl7v2_resultResult Code-1.0</a> </td>
<td> <p>Hl7v2_result Result Code</p></td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/hl7v2-result">https://nzhts.digital.health.nz/fhir/ValueSet/hl7v2-result</a></td>
</tr>
</table>
<h3>Concept Maps</h3>
<table class='table table-bordered table-condensed'>
<tr>
<td><a href="ConceptMap-air-gender-code-map.html">Concept Map -- Gender Code HL7v2 PID < -- > Administrative Gender used in FHIR R4-undefined</a> </td>
<td> <p>This maps the gender codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0001) to the codes returned by the NHI Service.</p> </td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-gender-code-map">https://nzhts.digital.health.nz/fhir/ValueSet/air-gender-code-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-air-health-worker-function-map.html">Concept Map -- HL7v2 Immunization Function ↔️< -- > AIR Health Worker Function-undefined</a> </td>
<td> <p>This maps HL7 Immunization Function Codes and Provider Roles to AIR Health Worker Function Codes. HL7v2 codes are from V2 table 0443 (Provider Role) and map to message segments as defined in <a href="https://terminology.hl7.org/4.0.0/CodeSystem-v2-0443.html">CodeSystem: providerRole</a>. HL7v3 codes are from <a href="http://terminology.hl7.org/CodeSystem/v3-ParticipationType">CodeSystem: ParticipationType</a></p> </td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-health-worker-function-map">https://nzhts.digital.health.nz/fhir/ValueSet/air-health-worker-function-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-air-route-map.html">Concept Map -- Route of Administration HL7v2 < -- >AIR SNOMED-undefined</a> </td>
<td> <p>This maps the AIR Route of Administration from HL7v2 messaging to SNOMED CT NZ.</p> </td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-route-map">https://nzhts.digital.health.nz/fhir/ValueSet/air-route-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-air-serology-protection-code-map.html">Concept Map --  HL7v2 Serology Obs Value < -- > AIR Serology Protection Code-undefined</a> </td>
<td> <p>This maps the codes used to report serology protection status in NIR HL7v2 messaging (OBX-5) to the counterpart codes used in the FHIR observation.interpretation field. Note that this map only includes those codes where the code is different between HL7v2 and FHIR standards.</p> </td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-serology-protection-code-map">https://nzhts.digital.health.nz/fhir/ValueSet/air-serology-protection-code-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-air-site-map.html">Concept Map -- Vaccination Site HL7v2 < -- > SNOMED-undefined</a> </td>
<td> <p>This maps the vaccination site codes listed in the NIR Message Spec v4.5, Sep 2020 (HL7 Table 0162) to SNOMED CT NZ.</p> </td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-site-map">https://nzhts.digital.health.nz/fhir/ValueSet/air-site-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-air-target-disease-map.html">Concept Map -- AIR Target Disease (SNOMED) < -- > Vaccine (CVX)-undefined</a> </td>
<td> <p>This map connects vaccine-preventable diseases (identified by SNOMED codes) to the vaccines that target them (identified by CVX codes). This mapping facilitates searching ImmSOT using the targetDisease search parameter.</p> </td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-target-disease-map">https://nzhts.digital.health.nz/fhir/ValueSet/air-target-disease-map</a></td>
</tr>
<tr>
<td><a href="ConceptMap-air-vaccine-product-map.html">Concept Map -- AIR Vaccine Product TPUU (NZMT) < -- > Vaccine (CVX)-undefined</a> </td>
<td> <p>This map connects vaccine products as identified by the Therapeutic Product Unit of Use (TPUU) code in the New Zealand Medicines Terminology (NZMT) to the vaccines as identified by CVX codes. This mapping facilitates translating TPUU codes stored in ImmSOT to a CVX code that can be received by legacy PMS systems.</p> </td>
<td> <a href="https://nzhts.digital.health.nz/fhir/ValueSet/air-vaccine-product-map">https://nzhts.digital.health.nz/fhir/ValueSet/air-vaccine-product-map</a></td>
</tr>
</table>