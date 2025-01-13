########################################################################################################################
# Outputs
########################################################################################################################

output "account_id" {
  description = "Account ID of the watsonx.governance instance"
  value       = module.watsonx_governance.account_id
}

output "crn" {
  description = "CRN of the watsonx.governance instance"
  value       = module.watsonx_governance.crn
}
output "guid" {
  description = "GUID of the watsonx.governance instance"
  value       = module.watsonx_governance.guid
}
output "name" {
  description = "Name of the watsonx.governance instance"
  value       = module.watsonx_governance.name
}

output "resource_group_id" {
  description = "The resource group ID to provision the watsonx.governance instance."
  value       = module.resource_group.resource_group_id
}
output "resource_group_name" {
  description = "The resource group name to provision the watsonx.governance instance."
  value       = module.resource_group.resource_group_name
}
