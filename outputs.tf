
output "server_id" {
  value = hcloud_server.server.id
}

output "external_ipv4" {
  value = hcloud_server.server.ipv4_address
}

output "external_ipv6" {
  value = hcloud_server.server.ipv6_address
}
