# Manages Cloud Server

This module provisions a [Hetzner Cloud](https://www.hetzner.com/cloud) server instance.

## Usage

### Put an example usage of the module here

```hcl
module "cloud-server" {
  source = "github.com/knoedel/terraform-cloud-server"

  <variables>
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | 2.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.31.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | 2.2.0 |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.31.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_server.server](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.1/docs/resources/server) | resource |
| [hcloud_server_network.external](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.1/docs/resources/server_network) | resource |
| [hcloud_server_network.internal](https://registry.terraform.io/providers/hetznercloud/hcloud/1.31.1/docs/resources/server_network) | resource |
| [cloudinit_config.main](https://registry.terraform.io/providers/hashicorp/cloudinit/2.2.0/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_external_network_id"></a> [external\_network\_id](#input\_external\_network\_id) | The id of the external network to connect your cloud server to. | `number` | n/a | yes |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | The ids of the firewall rule sets to apply on your cloud server. | `list(number)` | `[]` | no |
| <a name="input_internal_network_id"></a> [internal\_network\_id](#input\_internal\_network\_id) | The id of the internal network to connect your cloud server to. | `number` | n/a | yes |
| <a name="input_mounts"></a> [mounts](#input\_mounts) | The list of volumes to mount on your cloud server. | <pre>list(object({<br>    device = string,<br>    path   = string<br>  }))</pre> | `[]` | no |
| <a name="input_puppet_role"></a> [puppet\_role](#input\_puppet\_role) | The Puppet role to assign to your cloud server. | `string` | n/a | yes |
| <a name="input_puppet_server"></a> [puppet\_server](#input\_puppet\_server) | The address of your Puppet server that your cloud server should connect to. | `string` | n/a | yes |
| <a name="input_puppet_zone"></a> [puppet\_zone](#input\_puppet\_zone) | The Puppet zone to assign to your cloud server. | `string` | n/a | yes |
| <a name="input_server_image"></a> [server\_image](#input\_server\_image) | The name or id of the image of your cloud server. | `string` | `"ubuntu-20.04"` | no |
| <a name="input_server_location"></a> [server\_location](#input\_server\_location) | The location where to place your cloud server in. | `string` | `"nbg1"` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The name of your cloud server. Must be unique per project and a valid hostname as per RFC 1123. | `string` | n/a | yes |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | The type of your cloud server. | `string` | `"cx11"` | no |
| <a name="input_ssh_key_id"></a> [ssh\_key\_id](#input\_ssh\_key\_id) | The id of the ssh key that is allowed to connect to your cloud server. | `number` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The cloud-init configuration to apply to your cloud server. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | The external IPv4 address of your cloud server |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | The internal IPv4 address of your cloud server |
| <a name="output_ipv4"></a> [ipv4](#output\_ipv4) | The public IPv4 address of your cloud server |
| <a name="output_ipv6"></a> [ipv6](#output\_ipv6) | The public IPv6 address of your cloud server |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | The id of your cloud server |
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
