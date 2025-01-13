########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "CRN of the existing watsonx.governance instance."
  value       = module.existing_watsonx_governance_instance.crn
}

output "account_id" {
  description = "Account ID of the existing watsonx.governance instance"
  value       = module.existing_watsonx_governance_instance.account_id
}

output "id" {
  description = "ID of the watsonx.governance instance."
  value       = module.existing_watsonx_governance_instance.id
}

output "name" {
  description = "Name of the existing watsonx.governance instance"
  value       = module.existing_watsonx_governance_instance.name
}

output "guid" {
  description = "GUID of the existing watsonx.governance instance"
  value       = module.existing_watsonx_governance_instance.guid
}
