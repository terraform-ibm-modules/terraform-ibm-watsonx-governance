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

output "next_steps_text" {
  value       = "Now, you can use the watsonx.governance to train, validate, tune and deploy AI models."
  description = "Next steps text"
}

output "next_step_primary_label" {
  value       = "Go to the IBM watsonx.governance dashboard"
  description = "Primary label"
}

output "next_step_primary_url" {
  value       = module.watsonx_governance.dashboard_url
  description = "Primary URL"
}

output "next_step_secondary_label" {
  value       = "Learn more about IBM watsonx.governance"
  description = "Secondary label"
}

output "next_step_secondary_url" {
  value       = "https://dataplatform.cloud.ibm.com/docs/content/svc-welcome/aiopenscale.html?context=wx&audience=wdp"
  description = "Secondary URL"
}
