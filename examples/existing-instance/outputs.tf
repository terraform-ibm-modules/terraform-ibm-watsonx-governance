########################################################################################################################
# Outputs
########################################################################################################################

output "crn" {
  description = "CRN of the existing watsonx Governance instance."
  value       = module.existing_watsonx_governance_instance.crn
}

output "account_id" {
  description = "Account ID of the existing watsonx Governance instance"
  value       = module.existing_watsonx_governance_instance.account_id
}

output "id" {
  description = "ID of the watsonx Governance instance."
  value       = module.existing_watsonx_governance_instance.id
}

output "name" {
  description = "Name of the existing watsonx Governance instance"
  value       = module.existing_watsonx_governance_instance.name
}

output "guid" {
  description = "GUID of the existing watsonx Governance instance"
  value       = module.existing_watsonx_governance_instance.guid
}

output "plan_id" {
  description = "Plan ID of the existing watsonx Governance instance."
  value       = module.existing_watsonx_governance_instance.plan_id
}

output "dashboard_url" {
  description = "Dashboard URL of the existing watsonx Governance instance."
  value       = module.existing_watsonx_governance_instance.dashboard_url
}