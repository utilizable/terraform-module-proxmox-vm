# variables.tf

# PROVIDER VARIABLES
# ------------------

#variable "provider_proxmox_username" {
#  type        = string
#  description = "Proxmox username."
#}
#
#variable "provider_proxmox_password" {
#  type        = string
#  description = "Proxmox password."
#}
#
#variable "provider_proxmox_endpoint" {
#  type        = string
#  description = "Proxmox endpoint."
#}

#variable "proxmox_provider" {
#  description = "Proxmox provider configuration"
#}

# MODULE VARIABLES
# ------------------

variable "vm_id" {
  type        = string
  description = "ID of the virtual machine."
}

variable "node_name" {
  type        = string
  description = "Name of the Proxmox node where the virtual machine will be created."
}

variable "name" {
  type        = string
  description = "Name of the virtual machine."
}

variable "description" {
  type        = string
  description = "Description of the virtual machine."
  default     = ""
}

variable "tags" {
  type        = list(string)
  description = "Tags for the virtual machine."
  default     = ["terraform", "auto"]
}

variable "started" {
  type        = bool
  description = "Flag to indicate if the virtual machine should be started."
  default     = false
}

variable "machine" {
  type        = string
  description = "Machine type for the virtual machine."
  default     = "q35"
}

variable "stop_on_destroy" {
  type        = bool
  description = "Flag to stop the virtual machine on destroy."
  default     = false
}

variable "bios" {
  type        = string
  description = "BIOS type for the virtual machine."
  default     = "ovmf"
}

variable "disk" {
  type = list(object({
    datastore_id = string
    interface    = string
    file_format  = string
  }))
  description = "List of disks for the virtual machine."
  default = [
    {
      datastore_id = "local"
      interface    = "scsi0"
      file_format  = "qcow2"
    }
  ]
}

variable "efi_disk" {
  type = list(object({
    datastore_id = string
    file_format  = string
  }))
  description = "List of EFI disks for the virtual machine."
  default = [
    {
      datastore_id = "local"
      file_format  = "raw"
    }
  ]
}

variable "network_device" {
  type = list(object({
    bridge = string
  }))
  description = "List of network devices for the virtual machine."
  default = [
    {
      bridge = "vmbr0"
    }
  ]
}

variable "operating_system" {
  type        = string
  description = "Type of the operating system for the virtual machine."
  default     = "l26"
}

variable "memory" {
  type        = number
  description = "Dedicated memory for the virtual machine."
  default     = 2048
}

variable "cpu" {
  type = list(object({
    type  = string
    cores = number
  }))
  description = "List of CPU configurations for the virtual machine."
  default = [
    {
      type  = "qemu64"
      cores = "2"
    }
  ]
}

variable "hostpci" {
  type = list(object({
    device = string
    xvga   = string
  }))
  description = "List of host PCI configurations for the virtual machine."
  default     = []
}

variable "cdrom" {
  type = list(object({
    enabled = string
    file_id = string
  }))
  description = ""
  default     = []
}
