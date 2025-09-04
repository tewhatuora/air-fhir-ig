# Introduction

The **Immunisation API** provides access to the Aotearoa Immunisation Register (AIR), New Zealand’s national record of vaccination activity. It allows approved health applications to retrieve and submit immunisation records for individuals across the country in real time.

Organisations developing systems that consume the API must register with the Health New Zealand Digital Services Hub (DSH), nominate delegated authorities and developers, and demonstrate compliance with requirements for integrating with the AIR system.

Access to digital assets will be provided once relevant agreements are in place.

## Who can apply for access?

### To the test environment
All approved organisations and software vendors will be given access to all the Immunisation API operations in Mock+ and the Compliance environment, for testing and training after completing the on-boarding process described below.

### To the production environment
Access to **Immunisation Get** and **Search** operations is available to approved health providers, responsible authorities and organisations who provide services that support immunisation.

(Definitions: A health provider means a person or an organisation that provides, or arranges the provision of, personal health services or public health services-reference section 2, Health Act 1956. A responsible authority is an organisation responsible for the registration of practitioners-reference section 5, Health Practitioners Competence Assurance Act 2003).

Health providers and responsible authorities with existing Immunisation Data Access and Provision Agreements will be given access to Get and Search Immunisation under those agreements.

Health providers without an agreement wanting access to **Get, Search, Update** and **Create Immunisation** will need to apply to Te Whatu Ora / Health New Zealand (HNZ). The application will be assessed by HNZ sector digital channels. If granted, an access agreement may be required prior to credentials being issued to production.

## Onboarding process

### Organisation Registration and Developer Portal Access
1. Register your organisation with DSH, add developers and/or Delegated Authorities to your organisation and ensure they obtain access to the Developer Portal with identification to Level 2. They must ensure Full Name, Middle Name, and Last Name on identity documents exactly match names used to register for the Developer Portal.
   - [Introduction to the Digital Services Hub](https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/introduction)
   - [My Health Account Workforce](https://workforce.identity.health.nz/)
2. Log into the Developer Portal and complete all three onboarding forms.
    - Organisation Risk Assessment Form
    - Register Product Form
    - Product Risk Assessment Form
3. Review which APIs and operations your application requires to integrate with. For example, AIR Search requires a valid NHI number - better user experience may be provided by accessing the NHI prior to requesting a consumer’s immunisation history. If your application requires enrichment of Immunisation data with Patient or Location resources, then NHI and/or HPI compliance is required.
    - [Explore APIs and digital services](https://www.tewhatuora.govt.nz/health-services-and-programmes/digital-health/digital-services-hub/explore-apis-digital-services)
    - Review the \[API\]\(API.html\)  page in this Implementation Guide to determine which API operations your application requires.
4. <mark><u>Request access to digital assets, providing application and use case details using the [Digital Services Hub Support form](https://mohapis.atlassian.net/servicedesk/customer/portal/3/group/35/create/122).</u></mark>
5. Ensure that your own firewall changes have been requested for Test and Production environments.

### Integration and Testing
1. Complete your development and testing using the Mock+ environment.
2. When you are ready for compliance testing, log a ticket using the [Digital Services Hub Support & Feedback form](https://mohapis.atlassian.net/servicedesk/customer/portal/3/group/35/create/112).
    - Compliance Test environment access will be provided in coordination with AIR product team support.
    - Preview the AIR compliance tests in this Implementation Guide under the Compliance Testing menu item.
    - Test evidence to be provided includes screen shots and API responses. A demo of your application to an AIR test analyst may be requested.
    - <mark><u>Estimates of expected loads and volumes will be required for HNZ capacity planning and rate limiting. Load and volume testing could be required depending on use case.</u></mark>
    - Coordination will be required if HPI and NHI compliance is required.
    - Regular catch-ups and escalation pathways will be available.
3. Submit the results of the compliance tests using this form [HIP Compliance Submission](https://mohapis.atlassian.net/servicedesk/customer/portal/3/group/11/create/129). You will be required to submit the following Documents:
    - Production Assessment Questionnaire
    - API Access and Use Agreement
    - Information Access and Use Agreement
    - Clinical Management Risk Plan
    - Signed Privacy Agreement, Terms of Use, Access, and Use Agreements.
4. Subject to approval, the integration team will issue a test compliance report. Your application will receive certification to be used in production or additional requirements will need to be met.
    - This can be an iterative process, so please get in touch as needed to discuss the compliance testing process.
5. *Each organisation* using your application with integrated services must apply individually for access to the production environment (and receive their own set of credentials) by completing the production form, please email [NHI Access](mailto:NHI_Access@tewhatuora.govt.nz).

## Production Preparation and Go-live
- Sign off receipt of credentials.
- Consult with AIR product team to develop roll-out, communications, monitoring and PVT plans.
- AIR product team will advise production go-live (availability) date.
- Before launch, conduct validation tests. Verify API URL and credentials are working.
- Launch your application.
**Notes**
- Please allow at least 5 working days for compliance environment applications to be processed.
- Please allow at least 2 weeks for compliance testing to be signed off and returned.
- If Production credentials are required by a large number of organisations accessing your product, please get in touch to discuss options around bulk credential requests and how we can streamline this process.

## Assistance
For help during the registration and on-boarding process, please fill in the [Digital Services Hub Support and Feedback form](https://mohapis.atlassian.net/servicedesk/customer/portal/3/group/35/create/112).
