##############################################################################
# Input Variables
##############################################################################

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud API key to deploy resources."
  sensitive   = true
}

variable "provider_visibility" {
  description = "Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints)."
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "public-and-private"], var.provider_visibility)
    error_message = "Invalid visibility option. Allowed values are 'public', 'private', or 'public-and-private'."
  }
}

variable "existing_resource_group_name" {
  type        = string
  description = "The name of an existing resource group to provision the watsonx.governance in."
}

variable "prefix" {
  type        = string
  nullable    = true
  description = "The prefix to add to all resources that this solution creates (e.g `prod`, `test`, `dev`). To not use any prefix value, you can set this value to `null` or an empty string.`"
}

variable "name" {
  type        = string
  description = "The name of the watsonx.governance instance. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format."
  default     = "governance"
}

variable "region" {
  description = "The region where you want to deploy your instance."
  type        = string
  default     = "us-south"
}

variable "plan" {
  type        = string
  description = "The plan that is required to provision the watsonx.governance instance. Possible values are: lite, essentials.[Learn more](https://dataplatform.cloud.ibm.com/docs/content/wsj/model/wos-plan-options.html?context=wx&audience=wdp)."
  default     = "essentials"
}

variable "resource_tags" {
  type        = list(string)
  description = "Optional list of tags to describe the newly created watsonx.governance instance."
  default     = []
}

variable "access_tags" {
  type        = list(string)
  description = "A list of access tags to apply to the watsonx.governance instance. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial)."
  default     = []
}
