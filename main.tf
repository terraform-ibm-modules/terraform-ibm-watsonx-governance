########################################################################################################################
# watsonx.governance
########################################################################################################################
locals {
  account_id                       = var.existing_watsonx_governance_instance_crn != null ? module.crn_parser[0].account_id : ibm_resource_instance.watsonx_governance_instance[0].account_id
  watsonx_governance_id            = var.existing_watsonx_governance_instance_crn != null ? data.ibm_resource_instance.existing_watsonx_governance_instance[0].id : ibm_resource_instance.watsonx_governance_instance[0].id
  watsonx_governance_crn           = var.existing_watsonx_governance_instance_crn != null ? data.ibm_resource_instance.existing_watsonx_governance_instance[0].crn : ibm_resource_instance.watsonx_governance_instance[0].crn
  watsonx_governance_guid          = var.existing_watsonx_governance_instance_crn != null ? data.ibm_resource_instance.existing_watsonx_governance_instance[0].guid : ibm_resource_instance.watsonx_governance_instance[0].guid
  watsonx_governance_name          = var.existing_watsonx_governance_instance_crn != null ? data.ibm_resource_instance.existing_watsonx_governance_instance[0].resource_name : ibm_resource_instance.watsonx_governance_instance[0].resource_name
  watsonx_governance_plan_id       = var.existing_watsonx_governance_instance_crn != null ? null : ibm_resource_instance.watsonx_governance_instance[0].resource_plan_id
  watsonx_governance_dashboard_url = var.existing_watsonx_governance_instance_crn != null ? null : ibm_resource_instance.watsonx_governance_instance[0].dashboard_url
}

module "crn_parser" {
  count   = var.existing_watsonx_governance_instance_crn != null ? 1 : 0
  source  = "terraform-ibm-modules/common-utilities/ibm//modules/crn-parser"
  version = "1.4.2"
  crn     = var.existing_watsonx_governance_instance_crn
}

data "ibm_resource_instance" "existing_watsonx_governance_instance" {
  count      = var.existing_watsonx_governance_instance_crn != null ? 1 : 0
  identifier = var.existing_watsonx_governance_instance_crn
}

resource "ibm_resource_instance" "watsonx_governance_instance" {
  count             = var.existing_watsonx_governance_instance_crn != null ? 0 : 1
  name              = var.watsonx_governance_name
  service           = "aiopenscale"
  plan              = var.plan
  location          = var.region
  resource_group_id = var.resource_group_id
  tags              = var.resource_tags

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

########################################################################################################################
# Attach Access Tags
########################################################################################################################

resource "ibm_resource_tag" "watsonx_governance_tag" {
  count       = length(var.access_tags) == 0 ? 0 : 1
  resource_id = var.existing_watsonx_governance_instance_crn != null ? var.existing_watsonx_governance_instance_crn : ibm_resource_instance.watsonx_governance_instance[0].crn
  tags        = var.access_tags
  tag_type    = "access"
}
