# Immunisation Event Rejection Rules

The following rejection rules must be passed before an immunisation event can be created or updated within ImmSOT.

<table border=2><thead>
  <tr>
    <th>Rule&nbsp;&nbsp;&nbsp;Name</th>
    <th>Rejection&nbsp;&nbsp;&nbsp;Rule</th>
    <th>Error&nbsp;&nbsp;&nbsp;Code</th>
    <th>Sample&nbsp;&nbsp;&nbsp;return value</th>
  </tr></thead>
<tbody>
  <tr>
    <td>rejection_facility</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has a non HPI-F system</td>
    <td>1. 422</td>
    <td>1. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics": "A&nbsp;&nbsp;&nbsp;Facility ID is required."        }    ]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event facility value is empty.</td>
    <td>2. 400</td>
    <td>2. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics":  "HAPI-0450: Failed to parse request&nbsp;&nbsp;&nbsp;body as JSON resource. Error was: HAPI-1821: [element=\"value\"]&nbsp;&nbsp;&nbsp;Invalid attribute value \"\": Attribute value must not be empty&nbsp;&nbsp;&nbsp;(\"\")" }    ]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The event facility system is empty.</td>
    <td>3. 400</td>
    <td>3. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics":  "HAPI-0450: Failed to parse request&nbsp;&nbsp;&nbsp;body as JSON resource. Error was: HAPI-1821: [element=\"value\"]&nbsp;&nbsp;&nbsp;Invalid attribute value \"\": Attribute value must not be empty&nbsp;&nbsp;&nbsp;(\"\")" }    ]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The facility system exceeds 100 chars</td>
    <td>4. 422</td>
    <td>4. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics":&nbsp;&nbsp;&nbsp;"Location system cannot be greater than 100 characters"        }   &nbsp;&nbsp;&nbsp;]}</td>
  </tr>
  <tr>
    <td></td>
    <td>5. The facility value exceeds 8 characters</td>
    <td>5. 422</td>
    <td>5. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics":&nbsp;&nbsp;&nbsp;"Location value cannot be greater than 8 characters"        }   &nbsp;&nbsp;&nbsp;]}</td>
  </tr>
  <tr>
    <td></td>
    <td>6. The event does not have:</td>
    <td>6. 422</td>
    <td>6. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics": "A&nbsp;&nbsp;&nbsp;location is required."        }    ]}</td>
  </tr>
  <tr>
    <td></td>
    <td>    1. both facility system and&nbsp;&nbsp;&nbsp;value</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>    2. location identifier</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>    3. location</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>7. The event does not have a facility system</td>
    <td>7. 422</td>
    <td>7. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics":&nbsp;&nbsp;&nbsp;"Location has identification number but no identification system is&nbsp;&nbsp;&nbsp;specified"       }    ]}</td>
  </tr>
  <tr>
    <td></td>
    <td>8. The event does not have a facility value</td>
    <td></td>
    <td>8. {   &nbsp;&nbsp;&nbsp;"resourceType": "OperationOutcome",    "issue": [{            "severity":&nbsp;&nbsp;&nbsp;"error",           &nbsp;&nbsp;&nbsp;"code": "invariant",            "diagnostics": "A&nbsp;&nbsp;&nbsp;Facility ID is required."        }    ]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_dose_number</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. There’s more than one dose number.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Immunization.protocolApplied:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization","Line&nbsp;&nbsp;&nbsp;1, Col 1003"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. There’s a dose number and it exceeds 2 digits.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Dose&nbsp;&nbsp;&nbsp;number cannot exceed 2 digits"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The dose supplied is blank or&nbsp;&nbsp;&nbsp;zero.</td>
    <td>3. 422</td>
    <td>3. "Value supplied is less than permitted&nbsp;&nbsp;&nbsp;value of 1"</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_immunisation_event_date</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. There’s more than one immunisation event date</td>
    <td>1. 400</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","diagnostics":"HAPI-0450:&nbsp;&nbsp;&nbsp;Failed to parse request body as JSON resource. Error was: HAPI-1823: Multiple&nbsp;&nbsp;&nbsp;repetitions of non-repeatable element 'occurrenceDateTime' found during&nbsp;&nbsp;&nbsp;parse"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has an immunisation event date and it’s not in date OR&nbsp;&nbsp;&nbsp;datetime format.</td>
    <td>2. 400</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","diagnostics":"HAPI-0450:&nbsp;&nbsp;&nbsp;Failed to parse request body as JSON resource. Error was: HAPI-1821:&nbsp;&nbsp;&nbsp;[element=\"occurrenceDateTime\"] Invalid attribute value \"not&nbsp;&nbsp;&nbsp;a date\": Invalid date/time format: \"not a date\""}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. It does not contain an immunisation event date.</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Minimum"}]},"diagnostics":"Immunization.occurrence[x]:&nbsp;&nbsp;&nbsp;minimum required = 1, but only found 0 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization","Line&nbsp;&nbsp;&nbsp;1, Col 878"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_vaccine_batch_expiry_date</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. There’s more than one vaccine batch expiry date</td>
    <td>1. 400</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","diagnostics":"HAPI-0450:&nbsp;&nbsp;&nbsp;Failed to parse request body as JSON resource. Error was: HAPI-1823: Multiple&nbsp;&nbsp;&nbsp;repetitions of non-repeatable element 'expirationDate' found during&nbsp;&nbsp;&nbsp;parse"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a vaccine batch expiry date and it’s not in date format.</td>
    <td>2. 400</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","diagnostics":"HAPI-0450:&nbsp;&nbsp;&nbsp;Failed to parse request body as JSON resource. Error was: HAPI-1821:&nbsp;&nbsp;&nbsp;[element=\"expirationDate\"] Invalid attribute value \"not a&nbsp;&nbsp;&nbsp;date\": Invalid date/time format: \"not a date\""}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_diluent_expiry_date</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. There’s more than one diluent expiry date</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Extension.extension:diluentExpiryDate:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent|0.3.0)","location":["Immunization.extension[1]","Line&nbsp;&nbsp;&nbsp;1, Col 828"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a diluent expiry date and it’s not in date format.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"warning","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Type_Specific_Checks_DT_DateTime_Reasonable"}]},"diagnostics":"The&nbsp;&nbsp;&nbsp;value '111111' is outside the range of reasonable years - check for data&nbsp;&nbsp;&nbsp;entry error","location":["Immunization.extension[0].extension[1].value.ofType(string)","Line&nbsp;&nbsp;&nbsp;1, Col 684"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_vaccine_batch_number</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. There’s more than one vaccine batch number</td>
    <td>1. 400</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","diagnostics":"HAPI-0450:&nbsp;&nbsp;&nbsp;Failed to parse request body as JSON resource. Error was: HAPI-1823: Multiple&nbsp;&nbsp;&nbsp;repetitions of non-repeatable element 'lotNumber' found during parse"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a vaccine batch number and it’s more than 50 characters.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Vaccine&nbsp;&nbsp;&nbsp;lot number cannot be greater than 50 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_diluent_batch_number</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. There’s more than one diluent batch number</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Immunization.extension:Diluent:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization","Line&nbsp;&nbsp;&nbsp;1, Col&nbsp;&nbsp;&nbsp;1122"]},{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Extension.extension:diluentLotNumber:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-diluent|0.3.0)","location":["Immunization.extension[1]","Line&nbsp;&nbsp;&nbsp;1, Col 816"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a diluent batch number and it’s more than 50 characters.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Diluent&nbsp;&nbsp;&nbsp;lot number cannot be greater than 50 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_modified_by</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event does not have ‘modified by’.</td>
    <td>1. 400</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"unknown","diagnostics":"User&nbsp;&nbsp;&nbsp;ID header must be set."}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. There’s more than one ‘modified by’</td>
    <td>2. n/a</td>
    <td>2. last one considered</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The event has ‘modified by’ and it exceeds 255 characters.</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Modified&nbsp;&nbsp;&nbsp;by cannot be greater than 255 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_vaccine</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. There’s more than one vaccine code</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Immunization.vaccineCode.coding:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization.vaccineCode","Line&nbsp;&nbsp;&nbsp;1, Col 766"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event does not have a vaccine code (Note - this is irrespective of&nbsp;&nbsp;&nbsp;whether vaccine system is present or not)</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Minimum"}]},"diagnostics":"Immunization.vaccineCode.coding.code:&nbsp;&nbsp;&nbsp;minimum required = 1, but only found 0 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization.vaccineCode.coding[0]","Line&nbsp;&nbsp;&nbsp;1, Col 701"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The event does not have a vaccine system (Note - this is irrespective&nbsp;&nbsp;&nbsp;of whether vaccine code is present or not)</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"warning","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"TERMINOLOGY_TX_SYSTEM_NO_CODE"}]},"diagnostics":"A&nbsp;&nbsp;&nbsp;code with no system has no defined meaning. A system should be&nbsp;&nbsp;&nbsp;provided","location":["Immunization.vaccineCode.coding[0]","Line&nbsp;&nbsp;&nbsp;1, Col&nbsp;&nbsp;&nbsp;684"]},{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Minimum"}]},"diagnostics":"Immunization.vaccineCode.coding.system:&nbsp;&nbsp;&nbsp;minimum required = 1, but only found 0 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization.vaccineCode.coding[0]","Line&nbsp;&nbsp;&nbsp;1, Col 684"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The vaccine code exceeds 25 characters</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Vaccine&nbsp;&nbsp;&nbsp;code cannot be greater than 25 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>5. The event has a code system version and it exceeds 25 characters</td>
    <td>5. 422</td>
    <td>5.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Vaccine&nbsp;&nbsp;&nbsp;code system version cannot be greater than 25 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>6. The event has vaccine source text and it exceeds 255 characters</td>
    <td>6. 422</td>
    <td>6.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Vaccine&nbsp;&nbsp;&nbsp;code text cannot be greater than 255 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_status_reason</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has more than one status_reason_code.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Immunization.statusReason.coding:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization.statusReason","Line&nbsp;&nbsp;&nbsp;1, Col 781"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a status_reason_code and it exceeds 18 characters.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Status&nbsp;&nbsp;&nbsp;reason code cannot be greater than 18 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td colspan="3">3. The event has a&nbsp;&nbsp;&nbsp;status_reason_code but does not have a status_reason_code_system (or&nbsp;&nbsp;&nbsp;vice-versa).</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>3a. 422</td>
    <td>3a.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Status&nbsp;&nbsp;&nbsp;reason has a code but no code system is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>3b. 422</td>
    <td>3b.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Status&nbsp;&nbsp;&nbsp;reason has a code system but no code is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The event has a status_reason_code_system and it exceeds 100&nbsp;&nbsp;&nbsp;characters.</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Status&nbsp;&nbsp;&nbsp;reason code system cannot be greater than 100 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>5. The event has a status_reason_code_system_version and it exceeds 25&nbsp;&nbsp;&nbsp;characters.</td>
    <td>5. 422</td>
    <td>5.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Status&nbsp;&nbsp;&nbsp;reason code system version cannot be greater than 25 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_route</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has more than one route_code.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Immunization.route.coding:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization.route","Line&nbsp;&nbsp;&nbsp;1, Col 1001"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a route_code and it exceeds 18 characters.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Route&nbsp;&nbsp;&nbsp;code cannot be greater than 18 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td colspan="3">3. The event has a route_code but&nbsp;&nbsp;&nbsp;does not have a route_code_system (or vice-versa).</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>3a. 422</td>
    <td>3a.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Route&nbsp;&nbsp;&nbsp;has a code but no code system is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>3b. 422</td>
    <td>3b.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Route&nbsp;&nbsp;&nbsp;has a code system but no code is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The event has a route_code_system and it exceeds 100 characters.</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Route&nbsp;&nbsp;&nbsp;code system cannot be greater than 100 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>5. The event has a route_code_system_version and it exceeds 25&nbsp;&nbsp;&nbsp;characters.</td>
    <td>5. 422</td>
    <td>5.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Route&nbsp;&nbsp;&nbsp;code system version cannot be greater than 25 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_body_site</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has more than one body_site_code</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Validation_VAL_Profile_Maximum"}]},"diagnostics":"Immunization.site.coding:&nbsp;&nbsp;&nbsp;max allowed = 1, but found 2 (from&nbsp;&nbsp;&nbsp;https://standards.digital.health.nz/fhir/air/StructureDefinition/air-immunization|0.3.0)","location":["Immunization.site","Line&nbsp;&nbsp;&nbsp;1, Col 1034"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a body_site_code and it exceeds 18 characters.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Body&nbsp;&nbsp;&nbsp;site code cannot be greater than 18 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td colspan="3">3. The event has a body_site_code&nbsp;&nbsp;&nbsp;but does not have a body_site_code_system (or vice-versa).</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>3a. 422</td>
    <td>3a.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Body&nbsp;&nbsp;&nbsp;site has a code but no code system is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>3b. 422</td>
    <td>3b.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Body&nbsp;&nbsp;&nbsp;site has a code system but no code is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The event has a body_site_code_system and it exceeds 100 characters.</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Body&nbsp;&nbsp;&nbsp;site code system cannot be greater than 100 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>5. The event has a body_site_code_system_version and it exceeds 25&nbsp;&nbsp;&nbsp;characters.</td>
    <td>5. 422</td>
    <td>5.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Body&nbsp;&nbsp;&nbsp;site code system version cannot be greater than 25 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_indication</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has an indication code and it exceeds 18 characters.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Indication&nbsp;&nbsp;&nbsp;(reasonCode) code cannot be greater than 18 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td colspan="3">2. The event has an indication code&nbsp;&nbsp;&nbsp;but does not have a system (or vice-versa).</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>2a. 422</td>
    <td>2a.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Indication&nbsp;&nbsp;&nbsp;(reasonCode) has a code but no code system is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>2b. 422</td>
    <td>2b.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Indication&nbsp;&nbsp;&nbsp;(reasonCode) has a code system but no code is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The event has an indication system and it exceeds 100 characters.</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Indication&nbsp;&nbsp;&nbsp;(reasonCode) code system cannot be greater than 100 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The event has a system_version and it exceeds 25 characters.</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Indication&nbsp;&nbsp;&nbsp;(reasonCode) code system version cannot be greater than 25&nbsp;&nbsp;&nbsp;characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_health_worker</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has a health_worker_identification_number and it exceeds 255&nbsp;&nbsp;&nbsp;characters.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker identification number cannot be greater than 255 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td colspan="3">2. The event has a&nbsp;&nbsp;&nbsp;health_worker_identification_number but does not have a&nbsp;&nbsp;&nbsp;health_worker_identification_system (or vice-versa).</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>2a. 422</td>
    <td>2a.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker has identification number but no identification system is&nbsp;&nbsp;&nbsp;specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>2b. 422</td>
    <td>2b.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker has identification system but no identification number is&nbsp;&nbsp;&nbsp;specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The event has a health_worker_identification_system and it exceeds 100&nbsp;&nbsp;&nbsp;characters.</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker identification system cannot be greater than 100 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_health_worker_function</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has a health_worker_function_code and it exceeds 4&nbsp;&nbsp;&nbsp;characters.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker function code cannot be greater than 4 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td colspan="3">2. The event has a&nbsp;&nbsp;&nbsp;health_worker_function_code, but not a health_worker_function_system (or&nbsp;&nbsp;&nbsp;vice-versa).</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>2a. 422</td>
    <td>2a.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker function has a code but no code system is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td>2b. 422</td>
    <td>2b.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker function has a code system but no code is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The event has a health_worker_function_system and it exceeds 100&nbsp;&nbsp;&nbsp;characters.</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker function system cannot be greater than 100 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The event has a health_worker_function_system_version and it exceeds&nbsp;&nbsp;&nbsp;25 characters.</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Health&nbsp;&nbsp;&nbsp;worker function code system version cannot be greater than 25&nbsp;&nbsp;&nbsp;characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_nhi</td>
    <td>An immunisation event is rejected when</td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td>1. the NHI number does not pass checksum.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"NHI&nbsp;&nbsp;&nbsp;did not pass checksum"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. the request does not include an NHI code.</td>
    <td>2. 422</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Rule&nbsp;&nbsp;&nbsp;nz-pat-2: 'if the patient identifier has a system, then it must have a&nbsp;&nbsp;&nbsp;value.' Failed"}]},"diagnostics":"Rule nz-pat-2: 'if the&nbsp;&nbsp;&nbsp;patient identifier has a system, then it must have a value.' Failed","location":["Immunization","Line&nbsp;&nbsp;&nbsp;1, Col 909"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. the request does not include an NHI system.</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Rule&nbsp;&nbsp;&nbsp;nz-pat-3: 'if the patient identifier has a value, then it must have a&nbsp;&nbsp;&nbsp;system.' Failed"}]},"diagnostics":"Rule nz-pat-3: 'if the&nbsp;&nbsp;&nbsp;patient identifier has a value, then it must have a system.' Failed","location":["Immunization","Line&nbsp;&nbsp;&nbsp;1, Col 870"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. the request has more than one NHI code.</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Rule&nbsp;&nbsp;&nbsp;nz-pat-1-1: 'There must be exactly one patient identifier.'&nbsp;&nbsp;&nbsp;Failed"}]},"diagnostics":"Rule nz-pat-1-1: 'There must be&nbsp;&nbsp;&nbsp;exactly one patient identifier.' Failed","location":["Immunization","Line&nbsp;&nbsp;&nbsp;1, Col 825"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_fhir_profile</td>
    <td>An immunisation event is rejected when the request&nbsp;&nbsp;&nbsp;violates the AIR FHIR immunisation profile.</td>
    <td>422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","details":{"coding":[{"system":"http://hl7.org/fhir/java-core-messageId","code":"Rule&nbsp;&nbsp;&nbsp;nz-pat-1-1: 'There must be exactly one patient identifier.'&nbsp;&nbsp;&nbsp;Failed"}]},"diagnostics":"Rule nz-pat-1-1: 'There must be&nbsp;&nbsp;&nbsp;exactly one patient identifier.' Failed","location":["Immunization","Line&nbsp;&nbsp;&nbsp;1, Col 825"]}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_status</td>
    <td>An immunisation event is rejected when it does not have&nbsp;&nbsp;&nbsp;a valid status (i.e. something other than completed, not done, or entered in&nbsp;&nbsp;&nbsp;error).</td>
    <td>400</td>
    <td>{"resourceType":&nbsp;&nbsp;&nbsp;"OperationOutcome","issue": [{"severity":&nbsp;&nbsp;&nbsp;"error","code":&nbsp;&nbsp;&nbsp;"processing","diagnostics": "HAPI-0450: Failed to&nbsp;&nbsp;&nbsp;parse request body as JSON resource. Error was: HAPI-1821:&nbsp;&nbsp;&nbsp;[element=\"status\"] Invalid attribute value \"?\":&nbsp;&nbsp;&nbsp;Unknown ImmunizationStatus code '?'"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>Version_number</td>
    <td>1. An update immunisation event request is rejected&nbsp;&nbsp;&nbsp;when the version of the existing event in the request payload does not match&nbsp;&nbsp;&nbsp;the version of the event being updated.</td>
    <td>412</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"conflict","diagnostics":"Resource&nbsp;&nbsp;&nbsp;version is outdated"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. If-Match header, must be an integer</td>
    <td>400</td>
    <td>2.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"processing","diagnostics":"Version&nbsp;&nbsp;&nbsp;must be an integer"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_mobile_site</td>
    <td>An immunisation event is rejected when the mobile site&nbsp;&nbsp;&nbsp;is provided in must not be longer than 36 characters.</td>
    <td>422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Mobile&nbsp;&nbsp;&nbsp;Site ID cannot be greater than 36 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_dq_ignore</td>
    <td colspan="3">An immunisation&nbsp;&nbsp;&nbsp;event is rejected when the optional header dqIgnore is provided then it must&nbsp;&nbsp;&nbsp;be a boolean value</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>rejection_serology</td>
    <td colspan="3">An immunisation&nbsp;&nbsp;&nbsp;event is rejected when a serology report is provided:</td>
  </tr>
  <tr>
    <td></td>
    <td>1. The event has a serology_result_system and it exceeds 100 characters.</td>
    <td>1. 422</td>
    <td>1.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Serology&nbsp;&nbsp;&nbsp;result value system cannot be greater than 100 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>2. The event has a serology_result_code, but not a serology_result_system&nbsp;&nbsp;&nbsp;(or vice-versa).</td>
    <td>2. 422</td>
    <td>2a.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Serology&nbsp;&nbsp;&nbsp;result value has a code but no code system is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td>2b.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Serology&nbsp;&nbsp;&nbsp;result value has a code system but no code is specified"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>3. The event has a serology_result_code and it exceeds 18 characters.</td>
    <td>3. 422</td>
    <td>3.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Serology&nbsp;&nbsp;&nbsp;result value code cannot be greater than 18 characters"}]}</td>
  </tr>
  <tr>
    <td></td>
    <td>4. The event has a serology_result_system_version and it exceeds 25&nbsp;&nbsp;&nbsp;characters.</td>
    <td>4. 422</td>
    <td>4.&nbsp;&nbsp;&nbsp;{"resourceType":"OperationOutcome","issue":[{"severity":"error","code":"invariant","diagnostics":"Serology&nbsp;&nbsp;&nbsp;result value code system version cannot be greater than 25 characters"}]}</td>
  </tr>
</tbody></table>