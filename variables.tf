variable "server_name" {}

variable "server_type" {
  default = "cx11"
}

variable "server_image" {
  default = "ubuntu-20.04"
}

variable "server_location" {
  default = "nbg1"
}

variable "internal_network_id" {}

variable "external_network_id" {}

variable "firewall_ids" {
  default = []
}

variable "ssh_key_id" {}

variable "user_data" {}

variable "mounts" {
  type = list(object({
    device = string,
    path   = string
  }))
  default = []
}
