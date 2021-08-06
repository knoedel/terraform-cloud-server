module "cloud-server" {
  source = "../../"

  server_name = "cloud-server-testing"

  external_network_id = hcloud_network.internal.id
  internal_network_id = hcloud_network.external.id

  ssh_key_id = hcloud_ssh_key.default.id
  user_data  = file("${path.module}/user-data.yaml")
}

resource "hcloud_network" "internal" {
  name     = "internal"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "internal" {
  network_id   = hcloud_network.internal.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = hcloud_network.internal.ip_range
}

resource "hcloud_network" "external" {
  name     = "external"
  ip_range = "10.1.0.0/16"
}

resource "hcloud_network_subnet" "external" {
  network_id   = hcloud_network.external.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = hcloud_network.external.ip_range
}

resource "hcloud_ssh_key" "default" {
  name       = "default"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEAsA+KvUCPVo82M0i+Qqqdw1livUoyksk1xBK1zycnm"
}
