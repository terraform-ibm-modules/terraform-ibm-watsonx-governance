########################################################################################################################
# Outputs
########################################################################################################################

output "account_id" {
  description = "Account ID of the watsonx Governance instance."
  value       = local.account_id
}

output "id" {
  description = "ID of the watsonx Governance instance."
  value       = local.watsonx_governance_id
}

output "crn" {
  description = "The CRN of the watsonx Governance instance."
  value       = local.watsonx_governance_crn
}

output "guid" {
  description = "The GUID of the watsonx Governance instance."
  value       = local.watsonx_governance_guid
}

output "name" {
  description = "The name of the watsonx Governance instance."
  value       = local.watsonx_governance_name
}

output "plan_id" {
  description = "The plan ID of the watsonx Governance instance."
  value       = local.watsonx_governance_plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the watsonx Governance instance."
  value       = local.watsonx_governance_dashboard_url
}
