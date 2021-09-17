output "server_id" {
  description = "The id of your cloud server"
  value       = hcloud_server.server.id
}

output "ipv4" {
  description = "The public IPv4 address of your cloud server"
  value       = hcloud_server.server.ipv4_address
}

output "ipv6" {
  description = "The public IPv6 address of your cloud server"
  value       = hcloud_server.server.ipv6_address
}

output "internal_ip" {
  description = "The internal IPv4 address of your cloud server"
  value       = hcloud_server_network.internal.ip
}

output "external_ip" {
  description = "The external IPv4 address of your cloud server"
  value       = hcloud_server_network.external.ip
}
