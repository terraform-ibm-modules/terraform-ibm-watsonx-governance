########################################################################################################################
# Watsonx Governance
########################################################################################################################

module "existing_watsonx_governance_instance" {
  source                                   = "../../"
  access_tags                              = var.access_tags
  existing_watsonx_governance_instance_crn = var.existing_watsonx_governance_instance_crn
}
