# IBM watsonx.governance

This architecture creates an instance of IBM watsonx.governance and supports provisioning of the following resources:

- A `resource group` , if one is not passed in.
- A `watsonx.governance` instance.

![watsonx-governance-deployable-architecture](../../reference-architecture/deployable-architecture-watsonx-governance.svg)

:exclamation: **Important:** This solution is not intended to be called by other modules because it contains a provider configuration and is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information, see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.78.4 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform-ibm-modules/resource-group/ibm | 1.2.0 |
| <a name="module_watsonx_governance"></a> [watsonx\_governance](#module\_watsonx\_governance) | ../../ | n/a |

### Resources

No resources.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tags"></a> [access\_tags](#input\_access\_tags) | A list of access tags to apply to the watsonx.governance instance. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial). | `list(string)` | `[]` | no |
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | The name of an existing resource group to provision the watsonx.governance in. | `string` | `"Default"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | The IBM Cloud API key to deploy resources. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The prefix to be added to all resources created by this solution. To skip using a prefix, set this value to null or an empty string. The prefix must begin with a lowercase letter and may contain only lowercase letters, digits, and hyphens '-'. It should not exceed 16 characters, must not end with a hyphen('-'), and can not contain consecutive hyphens ('--'). Example: `prod-0205-wxgo`. [Learn more](https://terraform-ibm-modules.github.io/documentation/#/prefix.md). | `string` | n/a | yes |
| <a name="input_provider_visibility"></a> [provider\_visibility](#input\_provider\_visibility) | Set the visibility value for the IBM terraform provider. Supported values are `public`, `private`, `public-and-private`. [Learn more](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/guides/custom-service-endpoints). | `string` | `"private"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where you want to deploy your instance. | `string` | `"us-south"` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Optional list of tags to describe the newly created watsonx.governance instance. | `list(string)` | `[]` | no |
| <a name="input_service_plan"></a> [service\_plan](#input\_service\_plan) | The plan that is required to provision the watsonx.governance instance. Possible values are: lite, essentials.[Learn more](https://dataplatform.cloud.ibm.com/docs/content/wsj/model/wos-plan-options.html?context=wx&audience=wdp). | `string` | `"essentials"` | no |
| <a name="input_watsonx_governance_instance_name"></a> [watsonx\_governance\_instance\_name](#input\_watsonx\_governance\_instance\_name) | The name of the watsonx.governance instance. If a prefix input variable is specified, the prefix is added to the name in the `<prefix>-<name>` format. | `string` | `"governance"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account ID of the watsonx.governance instance. |
| <a name="output_crn"></a> [crn](#output\_crn) | The CRN of the watsonx.governance instance. |
| <a name="output_dashboard_url"></a> [dashboard\_url](#output\_dashboard\_url) | The dashboard URL of the watsonx.governance instance. |
| <a name="output_guid"></a> [guid](#output\_guid) | The GUID of the watsonx.governance instance. |
| <a name="output_id"></a> [id](#output\_id) | ID of the watsonx.governance instance. |
| <a name="output_name"></a> [name](#output\_name) | The name of the watsonx.governance instance. |
| <a name="output_plan_id"></a> [plan\_id](#output\_plan\_id) | The plan ID of the watsonx.governance instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
