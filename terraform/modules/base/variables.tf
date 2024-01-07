# variables.tf

# PROVIDER VARIABLES
# ------------------

variable "provider_proxmox_username" {
  type        = string
  description = "Proxmox username."
}

variable "provider_proxmox_password" {
  type        = string
  description = "Proxmox password."
}

variable "provider_proxmox_endpoint" {
  type        = string
  description = "Proxmox endpoint."
}

