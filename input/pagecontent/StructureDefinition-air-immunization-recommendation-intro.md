### Introduction
The Aotearoa Immunisation Register (AIR) holds a collection of "Scheduled Events", where each Scheduled Event represents a dose of vaccine to be administered to a person in the future. As an example, when a newborn is enrolled into AIR, a Scheduled Event is created for each dose listed in the [National Immunisation Schedule](https://www.healthnz.govt.nz/health-topics/immunisations/national-immunisation-schedule).

This AIRImmunizationRecommendation profile is the primary vehicle used by the AIR FHIR API to transmit information about each Scheduled Event.

Each recommendation element has a [AIR Planned Event Type](CodeSystem-air-planned-event-type-terms.html), supplied in the [AIR Scheduled Event](StructureDefinition-air-scheduled-event.html) extension:

- Consumer Planned Event - created for a Consumer to plan the delivery of an immunisation as described in an Immunisation Schedule.
- Expected Event - created when the expected delivery date for a Consumer Planned Event must change as a result of an Immunisation Event for a prior dose.

Examples of these are provided in [AIRBundleCarePlanExample](Bundle-AIRBundleCarePlanExample.html).

For more information about Scheduled Events in AIR, see the [AIR Care Plan Profile](StructureDefinition-air-careplan.html) and [View Consumer Planned Events](careplanView.html) use case.
