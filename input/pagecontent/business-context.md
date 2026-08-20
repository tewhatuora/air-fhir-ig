### Introduction

Immunisation is essential to any public health system and generates significant benefits at individual, governmental, and economic levels. The Aotearoa Immunisation Register (AIR) stores information about vaccinations delivered or planned for future delivery in New Zealand.

The AIR is used to help control the spread of infectious diseases by:
- keeping a record of the vaccinations New Zealanders have received or chosen not to receive, and
- providing information about immunisation coverage across the population.

Over their lifetime, New Zealanders can receive vaccinations from a range of health providers. Previously, health providers could not always get a full picture of a person’s vaccination history to help them and the consumer make the best health decisions.

AIR serves as a single point of truth for understanding overall immunisation coverage from a population health perspective or for planning targeted interventions. The AIR enables immunisation healthcare providers to access immunisation health records and make better decisions about whether a person should or should not receive a vaccination.

The Immunisation API is a [RESTful API](https://build.fhir.org/http.html) that provides access to the AIR. The API supports industry-standard [FHIR](http://hl7.org/fhir/)&reg; representations in data of common entities, relationships, artefacts and events encountered in a health context, such as such as [Immunization](StructureDefinition-air-immunization.html), [Patient](StructureDefinition-air-patient.html), [Practitioner](StructureDefinition-air-practitioner.html) and so forth.

For more context please visit the [Immunisation Programme](https://www.healthnz.govt.nz/about-us/what-we-do/programmes-and-initiatives/immunisation-programme) on the Health NZ website.

### History

The [NIR](https://www.tewhatuora.govt.nz/for-the-health-sector/vaccine-information/national-immunisation-registers/national-immunisation-register/) was in place nationwide from 2005 until its retirement with the roll-out of AIR in December, 2023. Its original purpose was to collect comprehensive information about childhood immunisation rates, as well as support the MeNZB immunisation programme. As a consequence, a clear record of childhood immunisation for children born since 2005 was available, however comprehensive information about immunisation for people aged 15 years and over was not.

AIR continues to be developed and expanded to meet the needs of its many stakeholders.

Practice Management Systems (PMS) were developed to work with NIR's legacy HL7 2.0 standard. The AIR project delivered APIs that support these legacy solutions while vendors develop new solutions compatible with the FHIR standard.

### Business Problem

Over their lifetime, New Zealanders can receive vaccinations from a range of health providers. A solution is required that enables health providers to get a full picture of a person’s vaccination history, to help them and the consumer make the best health decisions.

AIR aims to provide an accurate understanding of population immunisation coverage rates. This means programmes can be planned better to support populations with the lowest immunisation rates.

It reduces digital barriers and supports the health sector to deliver better immunisation services. It will also give New Zealanders a way to record and track immunisations they have received and are entitled to.

The following are a few scenarios for which the Immunisation API might be used.
- Immunisation administration (at practices, clinics and so on)
- Consumer portals and apps - view own and dependent immunisation history
- - Workforce onboarding – visibility and sharing of immunisation history
- Hospitals – visibility of immunisation for in-patient care
- Outreach for opportunistic vaccinations

### Key Use Cases

The Immunisation API allows you to:

1. View a consumer’s full immunisation history: [Immunisation Event Search](immunisationEventSearch.html).
1. Retrieve the latest version of an immunisation event: [Read Immunisation Event](immunisationEventRead.html).
1. Submit immunisation records: [Create Immunisation Event](immunisationEventCreate.html)
1. Update immunisation records, where the AIR Identifier is known: [Update Immunisation Event](immunisationEventUpdate.html).
1. Conditionally create or update immunisation records, where the AIR Identifier is not known: [Upsert Immunisation Event](immunisationEventUpsert.html).

In future, support will be provided for retrieving the current immunisation schedule for a consumer: [View Consumer Planned Events](careplanView.html).

### Who Can Access This API

The intended audiences of information the Immunisation API surfaces include:

- healthcare professionals who perform immunisations
- government and non-governmental organisations
- healthcare consumers (only their own information)

### Accessible Data

The Immunisation service holds the following information in relation to an Immunisation Event:

- Immunisation event
- health consumer NHI number
- vaccine product administered, vaccine batch number & expiry,
- route of administration & body site,
- date & time administered,
- status (outcome) of the immunisation event,
- why it was administered (or not), including indication, dose number and matching NIS schedule,
- identifiers of the responsible provider and of other participants in the encounter,
- serology observation result if declined due to immunity,
- contact person(s) who attended the immunisation event,
- facility where the immunisation was administered,
- diluent batch number & expiry if relevant and
- data quality assessment of the immunisation record.

When retrieving an Immunisation record or search results, the following information optionally also is retrieved from the National Health Index and National Enrolment Service Systems, subject to permissions:

- name, demographics and contact details of the patient who received the immunisation,
- facility and organisation location details,
- practitioner name, registration and contact details.

### Expectations and Requirements

Health NZ expects:

- The implementation will meet the relevant compliance requirements.
- The user interface will encourage and support user compliance with standard business processes.
- The user interface will support users in the appropriate and accurate use and management of patient immunisation data.
- An implementation that will make efficient use of the web services and ensure unnecessary load is not created on Health NZ's systems.
- A performant implementation that supports end users who perform immunisations.

These expectations will be measured with a set of compliance requirements, agreed between the integrator and Health NZ.

For further information see [Immunisation programme](https://www.healthnz.govt.nz/about-us/what-we-do/programmes-and-initiatives/immunisation-programme) at [healthnz.govt.nz](https://www.healthnz.govt.nz/).
