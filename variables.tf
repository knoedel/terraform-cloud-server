variable "server_name" {
  description = "The name of your cloud server. Must be unique per project and a valid hostname as per RFC 1123."
  type        = string
}

variable "domain" {
  description = "The domain name of your cloud server."
  type        = string
}

variable "server_type" {
  description = "The type of your cloud server."
  default     = "cx11"
  type        = string
}

variable "server_image" {
  description = "The name or id of the image of your cloud server."
  default     = "ubuntu-20.04"
  type        = string
}

variable "server_location" {
  description = "The location where to place your cloud server in."
  default     = "nbg1"
  type        = string
}

variable "internal_network_id" {
  description = "The id of the internal network to connect your cloud server to."
  type        = number
}

variable "external_network_id" {
  description = "The id of the external network to connect your cloud server to."
  type        = number
}

variable "firewall_ids" {
  description = "The ids of the firewall rule sets to apply on your cloud server."
  type        = list(number)
  default     = []
}

variable "ssh_key_id" {
  description = "The id of the ssh key that is allowed to connect to your cloud server."
  type        = number
}

variable "user_data" {
  description = "The cloud-init configuration to apply to your cloud server."
  type        = string
}

variable "mounts" {
  description = "The list of volumes to mount on your cloud server."
  type = list(object({
    device = string,
    path   = string
  }))
  default = []
}

variable "puppet_role" {
  description = "The Puppet role to assign to your cloud server."
  type        = string
}

variable "puppet_zone" {
  description = "The Puppet zone to assign to your cloud server."
  type        = string
}

variable "puppet_server" {
  description = "The address of your Puppet server that your cloud server should connect to."
  type        = string
}
