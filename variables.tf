########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The resource group ID where the watsonx Governance instance will be grouped. Required when creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_governance_instance_crn == null ? length(var.resource_group_id) > 0 : true
    error_message = "You must specify a value for 'resource_group_id' if 'existing_watsonx_governance_instance_crn' is null."
  }
}

variable "region" {
  description = "Region where watsonx Governance instance will be provisioned. Required if creating a new instance."
  type        = string
  default     = "us-south"

  validation {
    condition = var.existing_watsonx_governance_instance_crn != null || anytrue([
      var.region == "au-syd",
      var.region == "eu-de",
      var.region == "us-south",
    ])
    error_message = "Region must be specified and set to one of the permitted values ('eu-de', 'us-south', 'au-syd') when provisioning a new instance."
  }
}

variable "resource_tags" {
  description = "Optional list of tags to describe the watsonx Governance instance created by the module."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watsonx Governance instance. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial."
  default     = []

  validation {
    condition = alltrue([
      for tag in var.access_tags : can(regex("[\\w\\-_\\.]+:[\\w\\-_\\.]+", tag)) && length(tag) <= 128
    ])
    error_message = "Tags must match the regular expression \"[\\w\\-_\\.]+:[\\w\\-_\\.]+\", see https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#limits for more details"
  }
}

variable "watsonx_governance_name" {
  description = "The name of the watsonx Governance instance. Required if creating a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_governance_instance_crn == null ? length(var.watsonx_governance_name) > 0 : true
    error_message = "watsonx Governance name must be provided when creating a new instance."
  }
}

variable "existing_watsonx_governance_instance_crn" {
  default     = null
  description = "The CRN of an existing watsonx Governance instance."
  type        = string
}

variable "plan" {
  description = "The plan that is required to provision the watsonx Governance instance. Possible values are: lite, essentials."
  type        = string
  default     = "lite"

  validation {
    condition     = var.existing_watsonx_governance_instance_crn != null || var.plan != null
    error_message = "watsonx Governance plan must be provided when creating a new instance."
  }
  validation {
    condition = anytrue([
      var.plan == "lite",
      var.plan == "essentials",
    ]) || var.existing_watsonx_governance_instance_crn != null
    error_message = "A new watsonx Governance instance requires a 'lite', 'essentials' plan. [Learn more](https://dataplatform.cloud.ibm.com/docs/content/wsj/model/wos-plan-options.html?context=wx&audience=wdp)."
  }
}
