<!-- Update this title with a descriptive name. Use sentence case. -->
# IBM Watson Governance module

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Stable (With quality checks)](https://img.shields.io/badge/Status-Stable%20(With%20quality%20checks)-green)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-watsonx-governance?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-watsonx-governance/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->

The IBM watsonx Governance Terraform module is designed to automate the deployment and configuration of IBM Watson Governance, which is a toolkit which seamlessly integrates with your existing systems to automate and accelerate responsible AI workflows to help save time, reduce costs and comply with regulations.

For further information on IBM Watson Governance, including supported features, plans, and regions, please refer the official Watson Governance [documentation](https://dataplatform.cloud.ibm.com/docs/content/svc-welcome/aiopenscale.html?context=wx)

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-watsonx-governance](#terraform-ibm-watsonx-governance)
* [Examples](./examples)
    * [Basic example](./examples/basic)
    * [Existing instance example](./examples/existing-instance)
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!--
If this repo contains any reference architectures, uncomment the heading below and link to them.
(Usually in the `/reference-architectures` directory.)
See "Reference architecture" in the public documentation at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=reference-architecture
-->
<!-- ## Reference architectures -->


<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-watsonx-governance

This module supports provisioning the watsonx Governance instance with a selectable service plan.

### Usage

```hcl
module "watsonx_governance" {
  source                = "terraform-ibm-modules/watsonx-governance/ibm"
  watsonx_governance_name = "watsonx-governance"
  resource_group_id     = module.resource_group.resource_group_id
}

```

### Required access policies

You need the following permissions to run this module:

* Account Management
  * **Resource Group**
        - `Viewer` role
* IAM Services
  * **watsonx.governance** service
        - `Editor` platform access

To attach access management tags to resources in this module, you need the following permissions.

- IAM Services
    - **Tagging** service
        - `Administrator` platform access

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.70.1, < 2.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_crn_parser"></a> [crn\_parser](#module\_crn\_parser) | terraform-ibm-modules/common-utilities/ibm//modules/crn-parser | 1.1.0 |

### Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.watsonx_governance_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_tag.watsonx_governance_tag](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_tag) | resource |
| [ibm_resource_instance.existing_watsonx_governance_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tags"></a> [access\_tags](#input\_access\_tags) | A list of access tags to apply to the watsonx Governance instance. For more information, see https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial. | `list(string)` | `[]` | no |
| <a name="input_existing_watsonx_governance_instance_crn"></a> [existing\_watsonx\_governance\_instance\_crn](#input\_existing\_watsonx\_governance\_instance\_crn) | CRN of the an existing watsonx.governance instance. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where watsonx Governance instance will be provisioned. Required if creating a new instance. | `string` | `"us-south"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The resource group ID where the watsonx Governance instance will be grouped. Required when creating a new instance. | `string` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Optional list of tags to describe the watsonx Governance instance created by the module. | `list(string)` | `[]` | no |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | Types of the service endpoints that can be set to a watsonx Governance instance. Possible values are : 'public', 'private' or 'public-and-private'. | `string` | `"public-and-private"` | no |
| <a name="input_watsonx_governance_name"></a> [watsonx\_governance\_name](#input\_watsonx\_governance\_name) | The name of the watsonx Governance instance. Required if creating a new instance. | `string` | `null` | no |
| <a name="input_watsonx_governance_plan"></a> [watsonx\_governance\_plan](#input\_watsonx\_governance\_plan) | The plan used to provision the watsonx.governance instance. The available plans depend on the region where you are provisioning the service from the IBM Cloud catalog. | `string` | `"lite"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account ID of the WatsonX Governance instance. |
| <a name="output_crn"></a> [crn](#output\_crn) | The CRN of the WatsonX Governance instance. |
| <a name="output_dashboard_url"></a> [dashboard\_url](#output\_dashboard\_url) | The dashboard URL of the WatsonX Governance instance. |
| <a name="output_guid"></a> [guid](#output\_guid) | The GUID of the WatsonX Governance instance. |
| <a name="output_id"></a> [id](#output\_id) | ID of the WatsonX Governance instance. |
| <a name="output_name"></a> [name](#output\_name) | The name of the WatsonX Governance instance. |
| <a name="output_plan_id"></a> [plan\_id](#output\_plan\_id) | The plan ID of the WatsonX Governance instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
