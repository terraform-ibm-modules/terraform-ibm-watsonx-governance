##############################################################################
# Outputs
##############################################################################

output "account_id" {
  description = "Account ID of the watsonx.governance instance."
  value       = module.watsonx_governance.account_id
}

output "id" {
  description = "ID of the watsonx.governance instance."
  value       = module.watsonx_governance.id
}

output "crn" {
  description = "The CRN of the watsonx.governance instance."
  value       = module.watsonx_governance.crn
}

output "guid" {
  description = "The GUID of the watsonx.governance instance."
  value       = module.watsonx_governance.guid
}

output "name" {
  description = "The name of the watsonx.governance instance."
  value       = module.watsonx_governance.name
}

output "plan_id" {
  description = "The plan ID of the watsonx.governance instance."
  value       = module.watsonx_governance.plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the watsonx.governance instance."
  value       = module.watsonx_governance.dashboard_url
}
