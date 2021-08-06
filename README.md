# Manages Cloud Server

## Usage

### Put an example usage of the module here

```hcl
module "example" {
  source = "terraform/registry/path"

  <variables>
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | 2.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | 2.2.0 |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.28.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_server.server](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_server_network.external](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |
| [hcloud_server_network.internal](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |
| [cloudinit_config.main](https://registry.terraform.io/providers/hashicorp/cloudinit/2.2.0/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_external_network_id"></a> [external\_network\_id](#input\_external\_network\_id) | n/a | `any` | n/a | yes |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | n/a | `list` | `[]` | no |
| <a name="input_internal_network_id"></a> [internal\_network\_id](#input\_internal\_network\_id) | n/a | `any` | n/a | yes |
| <a name="input_mounts"></a> [mounts](#input\_mounts) | n/a | <pre>list(object({<br>    device = string,<br>    path   = string<br>  }))</pre> | `[]` | no |
| <a name="input_server_image"></a> [server\_image](#input\_server\_image) | n/a | `string` | `"ubuntu-20.04"` | no |
| <a name="input_server_location"></a> [server\_location](#input\_server\_location) | n/a | `string` | `"nbg1"` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | n/a | `any` | n/a | yes |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | n/a | `string` | `"cx11"` | no |
| <a name="input_ssh_key_id"></a> [ssh\_key\_id](#input\_ssh\_key\_id) | n/a | `any` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ipv4"></a> [external\_ipv4](#output\_external\_ipv4) | n/a |
| <a name="output_external_ipv6"></a> [external\_ipv6](#output\_external\_ipv6) | n/a |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
make ensure_pre_commit
```

### Testing

[Terratest](https://github.com/gruntwork-io/terratest) is being used for
automated testing with this module. Tests in the `test` folder can be run
locally by running the following command:

```text
make test
```
