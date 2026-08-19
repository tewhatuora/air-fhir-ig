### Introduction

The FHIR CarePlan resource is a structured representation of a consumer’s assigned immunisation schedule, supporting coordination, tracking, and delivery of vaccinations across various antigen groups. Within the immunisation domain, each CarePlan defines a specific Antigen Group Vaccination (AGV) schedule for an individual and organises all related vaccination activities into a coherent and accessible format.

In this context, the CarePlan serves as a central framework that brings together planned immunisation events and corresponding recorded vaccine administrations. Planned events are represented using ImmunizationRecommendation resources, indicating doses that are scheduled based on clinical guidelines and timing. When a vaccine dose is administered, the corresponding Immunization resource is linked back to the relevant planned activity in the CarePlan.

This approach ensures that each immunisation event is traceable and that care delivery is aligned with national immunisation protocols. Each CarePlan acts as a living record of a consumer's immunisation journey for a particular antigen group, capturing past, present, and future planned doses. The activities within the CarePlan are typically ordered by due date, offering a clear and chronological view of the vaccination schedule. This helps healthcare providers monitor compliance, identify overdue or upcoming vaccinations, and coordinate follow-up actions.

Additionally, the CarePlan supports automation and interoperability. When a consumer is on-boarded into the immunisation system, relevant AGV schedules are automatically assigned. CarePlans are created to reflect the full scope of required immunisations.

This profile on the FHIR R4 CarePlan resource adds two extensions from the R5+ CarePlan, to more easily represent Immunization and ImmunizationRecommendation links, and to be better aligned with the future direction of FHIR.
