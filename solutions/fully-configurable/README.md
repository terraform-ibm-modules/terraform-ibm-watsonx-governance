# IBM watsonx.governance

This architecture creates an instance of IBM watsonx.governance and supports provisioning of the following resources:

- A `resource group` , if one is not passed in.
- A `watsonx.governance` instance.

![watsonx-governance-deployable-architecture](../../reference-architecture/deployable-architecture-watsonx-governance.svg)

:exclamation: **Important:** This solution is not intended to be called by other modules because it contains a provider configuration and is not compatible with the `for_each`, `count`, and `depends_on` arguments. For more information, see [Providers Within Modules](https://developer.hashicorp.com/terraform/language/modules/develop/providers).
