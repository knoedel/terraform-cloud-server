output "server_id" {
  description = "The id of your cloud server"
  value       = hcloud_server.server.id
}

output "external_ipv4" {
  description = "The external IPv4 address of your cloud server"
  value       = hcloud_server.server.ipv4_address
}

output "external_ipv6" {
  description = "The external IPv6 address of your cloud server"
  value       = hcloud_server.server.ipv6_address
}
