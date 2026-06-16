
The following headers may be presented in the request.

<table border=2><thead>
  <tr>
    <th>Header Name<br></th>
    <th>Type<br></th>
    <th>Mandatory?<br></th>
    <th>Sample Value<br></th>
    <th>Details<br></th>
  </tr></thead>
<tbody>
  <tr>
    <td>Authorization </td>
    <td>Base64URL encoded string</td>
    <td>yes</td>
    <td>eyJraWQiOiJETW5ZNzV1Nk03ZkZicEFUdkI2bXRlOEJ5dW1jODNpdDRpb2hldW1lWWhrPSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiIzNjYyZ***</td>
    <td>authorization bearer token</td>
  </tr>
  <tr>
    <td>UserId</td>
    <td>String</td>
    <td>Yes</td>
    <td> </td>
    <td>Client provided<br>All requests for all resources must include an http header UserId that uniquely identifies the individual initiating the request.<br>Preferably the hpi-person-id of the user would be provided if known, otherwise a userid that allows the authenticated organisation to identify the individual.</td>
  </tr>
  <tr>
    <td>FacilityId </td>
    <td>String</td>
    <td>Recommended</td>
    <td> </td>
    <td>Client provided<br>It is recommendedthat all requests for all resources must include an http header Facilityid that uniquely identifies the Facility initiating the request.<br>Preferably the HPI-F id of the Facility would be provided if known, otherwise a FacilityId that allows the identification of the Facility.</td>
  </tr>
  <tr>
    <td>x-api-key</td>
    <td>Base64URL encoded string</td>
    <td>yes<br>(to use the Gateway URL)</td>
    <td>KAnHVzZXJJZGVudGlmaWVy4oCdOiDigJx4eXrigJ19</td>
    <td>As per NIA standard, there is an api key requirement. This is used in scenarios like usage plans, etc.<br>API Gateway reads the key and compares it against the keys in the usage plan. If there is a match, API Gateway throttles the requests based on the plan's request limit and quota. Otherwise, it throws an InvalidKeyParameter exception. As a result, the caller receives a 403 Forbidden response.<br><bold>This header is not used by the immunisation Service, only by API Gateway.</bold></td>
  </tr>
  <tr>
    <td>If-Match</td>
    <td>number</td>
    <td>on update</td>
    <td> </td>
    <td>The resource number (version number) </td>
  </tr>
  <tr>
    <td>X-Correlation-ID</td>
    <td>String.<br>UUID recommended, but not required.</td>
    <td>no</td>
    <td>123e4567-e89b-12d3-a456-426614174000<br>this-is-a-valid-id-too</td>
    <td> </td>
  </tr>
  <tr>
    <td>SourceSystemID</td>
    <td>String</td>
    <td>no</td>
    <td>HSAPP0232</td>
    <td>Source System ID</td>
  </tr>
  <tr>
    <td>Api-Version</td>
    <td>String</td>
    <td>no</td>
    <td>1</td>
    <td>Api Version for request and response</td>
  </tr>
</tbody></table>

