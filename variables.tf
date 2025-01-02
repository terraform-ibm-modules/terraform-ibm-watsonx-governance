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
  description = "CRN of the an existing watsonx.governance instance."
  type        = string
}

variable "watsonx_governance_plan" {
  default     = "lite"
  description = "The plan used to provision the watsonx.governance instance. The available plans depend on the region where you are provisioning the service from the IBM Cloud catalog."
  type        = string
  validation {
    condition = anytrue([
      var.watsonx_governance_plan == "lite",
      var.watsonx_governance_plan == "essentials",
    ])
    error_message = "You must use a lite or essential plan. Learn more. "
  }
}

variable "service_endpoints" {
  description = "Types of the service endpoints that can be set to a watsonx Governance instance. Possible values are : 'public', 'private' or 'public-and-private'."
  type        = string
  default     = "public-and-private"
  validation {
    condition     = contains(["public", "public-and-private", "private"], var.service_endpoints)
    error_message = "The specified service endpoint is not valid. Supported options are 'public', 'private', 'public-and-private'."
  }
}
