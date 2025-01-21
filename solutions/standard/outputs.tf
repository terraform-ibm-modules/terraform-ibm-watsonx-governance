##############################################################################
# Outputs
##############################################################################

output "account_id" {
  description = "Account ID of the Watson Governance instance."
  value       = module.watson_governance.account_id
}

output "id" {
  description = "ID of the Watson Governance instance."
  value       = module.watson_governance.id
}

output "crn" {
  description = "The CRN of the Watson Governance instance."
  value       = module.watson_governance.crn
}

output "guid" {
  description = "The GUID of the Watson Governance instance."
  value       = module.watson_governance.guid
}

output "name" {
  description = "The name of the Watson Governance instance."
  value       = module.watson_governance.name
}

output "plan_id" {
  description = "The plan ID of the Watson Governance instance."
  value       = module.watson_governance.plan_id
}

output "dashboard_url" {
  description = "The dashboard URL of the Watson Governance instance."
  value       = module.watson_governance.dashboard_url
}
