Instance: create-immunisation-operation-outcome-response
Description: "Example create immunisation OperationOutcome message"
InstanceOf: OperationOutcome
Usage: #example
* issue.severity = #error
* issue.code = #invariant
* issue.diagnostics = "Vaccine lot number cannot be greater than 50 characters"