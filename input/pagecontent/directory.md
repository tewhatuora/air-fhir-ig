---
notes: |
  I couldn't get the table to render properly just using markdown, 
  I tried a combination of html and markdown and that didn't work
  so I went full html - for the table
---

<style>
.index-links {
    white-space: nowrap;
    hyphens: none;
    overflow-wrap: normal;
    word-break: normal;
}

.index-links a[href$="index.html"]::after {
    content: url(assets/images/page.png);
    display: inline-block;
    text-decoration: none;
    padding-left: 3px;
}

.index-links a[href$=".yaml"]:after {
  content: "";
  display: inline-block;
  text-decoration: none;
  padding-left: 3px;
  height: 16px;
  width: 16px;
  background: url(assets/images/openapi.png) center / contain no-repeat;
  vertical-align: middle;
}

thead tr {
    border-bottom: 1px solid #000;
}
</style>    

# Publication (Version) History

This table provides a list of versions of the Aotearoa Immunisation Register (AIR) FHIR Implementation Guide that are available. Only the latest version for each API version is available.


<table>
<thead>
    <tr>    
        <th>Date</th><th>API Version</th><th>Implementation Guide Version</th><th>Description</th><th>Links</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td>2026&#8209;07&#8209;15</td><td>2</td><td> <a href="/api/index.html">2.0.0</a></td><td>
        <p>Latest version of the AIR API, to be used for any new integrations.</p>
        <p>Clients access the version 2 API by sending requests to the v2 URL given in the Open API Specification.</p>
        <p>The following changes were introduced in API version 2:</p>
<ol>
    <li>
        Dose number in Immunization and ImmunizationRecommendation is now <code>doseNumberString</code>, previously <code>doseNumberPositiveInt</code>.
    </li>
    <li>
        The latest existing record is returned if an exact duplicate is submitted via the Create API.
        <ol>
            <li>
                Given a POST to <code>/Immunization</code> (Create operation), when AIR detects an exact duplicate of the record submitted, then no change is made and AIR returns HTTP status code 201. The Immunization resource in the response contains the AIR Identifier (Immunization.id) of the most recent existing record and contains a meta tag that indicates what has occurred.
            </li>
            <li>
                Previously, the status in the response was entered-in-error with HTTP status code 200.
            </li>
        </ol>
    </li>
</ol></td><td style="text-align: right;" class="index-links">
    <a href="/api/index.html">api&#8209;v2&nbsp;Home</a><br/>
    <a href="/api/full-ig.zip">download&nbsp;api&#8209;v2&nbsp;FHIR&nbsp;IG</a><br/>
    <a href="/api/ImmSoTAPI.yaml">openapi&nbsp;spec</a>
 </td>
    </tr>
    <tr>
        <td>2026&#8209;07&#8209;15</td><td>1</td><td><a href="/api-v1/index.html">1.28.0</a></td>
        <td>
            <p>Latest version of the original AIR API.</p>
            <p>Clients access the v1 API by sending requests to the v1 URL given in the Open API Specification.</p>
        </td>
        <td style="text-align: right;" class="index-links">
            <a href="/api-v1/index.html">api&#8209;v1&nbsp;Home</a><br/>
            <a href="/api-v1/full-ig.zip">download&nbsp;api&#8209;v1&nbsp;FHIR IG</a><br/>
            <a href="/api-v1/ImmSoTAPI.yaml">openapi&nbsp;spec</a>
        </td>
    </tr>
</tbody>
</table>

