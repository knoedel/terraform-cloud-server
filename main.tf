resource "hcloud_server" "server" {
  image       = var.server_image
  name        = var.server_name
  server_type = var.server_type
  location    = var.server_location
  ssh_keys = [
    var.ssh_key_id
  ]
  firewall_ids = var.firewall_ids
  labels = {
    type = var.server_name
  }
  user_data = data.cloudinit_config.main.rendered
}

data "cloudinit_config" "main" {
  gzip          = false
  base64_encode = false

  part {
    content = templatefile("${path.module}/data/user-data.yaml.tpl", {
      puppet_role   = var.puppet_role,
      puppet_zone   = var.puppet_zone,
      puppet_server = var.puppet_server,
    })
  }

  part {
    content = templatefile("${path.module}/data/volumes.yaml.tpl", {
      mounts = var.mounts
    })
  }

  part {
    content = var.user_data
  }
}

resource "hcloud_server_network" "internal" {
  server_id  = hcloud_server.server.id
  network_id = var.internal_network_id
}

resource "hcloud_server_network" "external" {
  server_id  = hcloud_server.server.id
  network_id = var.external_network_id
}
