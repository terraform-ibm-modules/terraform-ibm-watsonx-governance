########################################################################################################################
# Input Variables
########################################################################################################################

variable "resource_group_id" {
  description = "The ID of the resource group that contains the watsonx.governance instance. Required to create an instance of watsonx.governance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_governance_instance_crn == null ? length(var.resource_group_id) > 0 : true
    error_message = "You must specify a value for 'resource_group_id' if 'existing_watsonx_governance_instance_crn' is set to `null`."
  }
}

variable "region" {
  description = "Region where the watsonx.governance instance is provisioned. Required to create an instance of watsonx.governance."
  type        = string
  default     = "us-south"

  validation {
    condition = var.existing_watsonx_governance_instance_crn != null || anytrue([
      var.region == "au-syd",
      var.region == "eu-de",
      var.region == "us-south",
    ])
    error_message = "Region must be specified and set to one of the possible values ('eu-de', 'us-south', or 'au-syd') when an instance is provisioned."
  }
}

variable "resource_tags" {
  description = "Optional list of tags to describe the watsonx.governance instance."
  type        = list(string)
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watsonx.governance instance. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial)."
  default     = []

  validation {
    condition = alltrue([
      for tag in var.access_tags : can(regex("[\\w\\-_\\.]+:[\\w\\-_\\.]+", tag)) && length(tag) <= 128
    ])
    error_message = "Tags must match the regular expression `\"[\\w\\-_\\.]+:[\\w\\-_\\.]+\"`. [Learn more](https://cloud.ibm.com/docs/account?topic=account-tag&interface=ui#limits)."
  }
}

variable "watsonx_governance_name" {
  description = "The name of the watsonx.governance instance. Required to create a new instance."
  type        = string
  default     = null
  validation {
    condition     = var.existing_watsonx_governance_instance_crn == null ? length(var.watsonx_governance_name) > 0 : true
    error_message = "Provide a name for the watsonx.governance instance to create it."
  }
}

variable "existing_watsonx_governance_instance_crn" {
  default     = null
  description = "The CRN of an existing watsonx.governance instance."
  type        = string
}

variable "plan" {
  description = "The watsonx.governance plan to create the watsonx.governance instance. Possible values are `lite` or `essentials`."
  type        = string
  default     = "lite"

  validation {
    condition     = var.existing_watsonx_governance_instance_crn != null || var.plan != null
    error_message = "The plan must be provided to create a watsonx.governance instance. Possible values are `lite` or `essentials`."
  }
  validation {
    condition = anytrue([
      var.plan == "lite",
      var.plan == "essentials",
    ]) || var.existing_watsonx_governance_instance_crn != null
    error_message = "A new watsonx.governance instance requires a 'lite' or 'essentials' plan. [Learn more](https://dataplatform.cloud.ibm.com/docs/content/wsj/model/wos-plan-options.html?context=wx&audience=wdp)."
  }
}
