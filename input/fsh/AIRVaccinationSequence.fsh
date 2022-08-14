Extension: AIRVaccinationSequence
Id: air-vacc-sequence
Description: "The sequence of this vaccination within the plan"

* ^url = "http://standards.digital.health.nz/fhir/StructureDefinition/AIRVaccinationSequence"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context.type = #element
* ^context.expression = "PlanDefinition.action.action"

* extension contains
    series 1..1 and
    sequence 1..1

* extension[series].url = "series" (exactly) // this doesn't seem like a useful thing to have here
* extension[series].value[x]  only string
* extension[series] ^short = "The name of the sequence of vaccines. Defaults to the vaccine antigen/s"    

* extension[sequence].url = "sequence" (exactly) // this doesn't seem like a useful thing to have here
* extension[sequence].value[x]  only positiveInt
* extension[sequence] ^short = "The sequence of this vaccine administration within the series"    

