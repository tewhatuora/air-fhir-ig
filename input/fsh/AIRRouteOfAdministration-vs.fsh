ValueSet: AIRRouteofAdministrationVS
Id: air-route-of-administration-vs
Title: "AIR Route of Administration Value Set"
Description: "SNOMED Codes for Routes of Administration for use by the immunizstion programme"

// Eventually it may make sense to trim this list down to only the ones we use. But then again, if we integrate across the sector we may need to be a bit more inclusive.

* insert StandardMetadata

* include codes from system $SCT where concept is-a #284009009 "Route of administration value (qualifier value)"