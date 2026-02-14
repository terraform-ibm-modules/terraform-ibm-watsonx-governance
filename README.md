<!-- Update this title with a descriptive name. Use sentence case. -->
# IBM watsonx.governance module

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Graduated (Supported)](https://img.shields.io/badge/status-Graduated%20(Supported)-brightgreen?style=plastic)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
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

The IBM watsonx.governance Terraform module is designed to automate the deployment and configuration of IBM watsonx.governance, which is a toolkit which seamlessly integrates with your existing systems to automate and accelerate responsible AI workflows to help save time, reduce costs and comply with regulations.

For further information on IBM watsonx.governance, including supported features, plans, and regions, please refer the official watsonx.governance [documentation](https://dataplatform.cloud.ibm.com/docs/content/svc-welcome/aiopenscale.html?context=wx)

<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-watsonx-governance](#terraform-ibm-watsonx-governance)
* [Examples](./examples)
:information_source: Ctrl/Cmd+Click or right-click on the Schematics deploy button to open in a new tab
    * <a href="./examples/basic">Basic example</a> <a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=watsonx-governance-basic-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-watsonx-governance/tree/main/examples/basic"><img src="https://img.shields.io/badge/Deploy%20with IBM%20Cloud%20Schematics-0f62fe?logo=ibm&logoColor=white&labelColor=0f62fe" alt="Deploy with IBM Cloud Schematics" style="height: 16px; vertical-align: text-bottom; margin-left: 5px;"></a>
    * <a href="./examples/existing-instance">Existing instance example</a> <a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=watsonx-governance-existing-instance-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-watsonx-governance/tree/main/examples/existing-instance"><img src="https://img.shields.io/badge/Deploy%20with IBM%20Cloud%20Schematics-0f62fe?logo=ibm&logoColor=white&labelColor=0f62fe" alt="Deploy with IBM Cloud Schematics" style="height: 16px; vertical-align: text-bottom; margin-left: 5px;"></a>
* [Deployable Architectures](./solutions)
    * <a href="./solutions/fully-configurable">Cloud automation for watsonx.governance (Fully configurable)</a>
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

This module supports provisioning the watsonx.governance instance with a selectable service plan.

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
| <a name="module_crn_parser"></a> [crn\_parser](#module\_crn\_parser) | terraform-ibm-modules/common-utilities/ibm//modules/crn-parser | 1.4.1 |

### Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.watsonx_governance_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_tag.watsonx_governance_tag](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_tag) | resource |
| [ibm_resource_instance.existing_watsonx_governance_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tags"></a> [access\_tags](#input\_access\_tags) | A list of access tags to apply to the watsonx.governance instance. [Learn more](https://cloud.ibm.com/docs/account?topic=account-access-tags-tutorial). | `list(string)` | `[]` | no |
| <a name="input_existing_watsonx_governance_instance_crn"></a> [existing\_watsonx\_governance\_instance\_crn](#input\_existing\_watsonx\_governance\_instance\_crn) | The CRN of an existing watsonx.governance instance. | `string` | `null` | no |
| <a name="input_plan"></a> [plan](#input\_plan) | The watsonx.governance plan to create the watsonx.governance instance. Possible values are `lite` or `essentials`. | `string` | `"lite"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region where the watsonx.governance instance is provisioned. Required to create an instance of watsonx.governance. | `string` | `"us-south"` | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group that contains the watsonx.governance instance. Required to create an instance of watsonx.governance. | `string` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | Optional list of tags to describe the watsonx.governance instance. | `list(string)` | `[]` | no |
| <a name="input_watsonx_governance_name"></a> [watsonx\_governance\_name](#input\_watsonx\_governance\_name) | The name of the watsonx.governance instance. Required to create a new instance. | `string` | `null` | no |

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

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
