# main.tf

#provider "proxmox" {
#  alias    = "pve"
#  username = var.provider_proxmox_username
#  password = var.provider_proxmox_password
#  endpoint = var.provider_proxmox_endpoint
#  insecure = true
#  ssh {
#    agent = true
#  }
#}

#provider "proxmox" {
#  alias  = "module_provider"
#  # Use the provided proxmox provider configuration
#  username = var.proxmox_provider["username"]
#  password = var.proxmox_provider["password"]
#  endpoint = var.proxmox_provider["endpoint"]
#
#  insecure = true
#  ssh {
#    agent = true
#  }
#}

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.43.0"
    }
  }
}

resource "proxmox_virtual_environment_vm" "resource_vm" {

  // required
  vm_id     = var.vm_id
  node_name = var.node_name
  name      = var.name
  // optional
  tags            = var.tags
  description     = var.description
  started         = var.started
  machine         = var.machine
  stop_on_destroy = var.stop_on_destroy
  bios            = var.bios

  dynamic "disk" {
    for_each = var.disk == null ? [] : tolist(var.disk)
    content {
      datastore_id = disk.value.datastore_id
      interface    = disk.value.interface
    }
  }

  dynamic "efi_disk" {
    for_each = var.efi_disk == null ? [] : tolist(var.efi_disk)
    content {
      datastore_id = efi_disk.value.datastore_id
      file_format  = efi_disk.value.file_format
    }
  }

  dynamic "network_device" {
    for_each = var.network_device == null ? [] : tolist(var.network_device)
    content {
      bridge = network_device.value.bridge
    }
  }

  operating_system {
    type = var.operating_system
  }

  memory {
    dedicated = var.memory
  }

  dynamic "cpu" {
    for_each = var.cpu == null ? [] : tolist(var.cpu)
    content {
      type  = cpu.value.type
      cores = cpu.value.cores
    }
  }

  dynamic "hostpci" {
    for_each = var.hostpci == null ? [] : tolist(var.hostpci)
    content {
      device = hostpci.value.device
      xvga   = hostpci.value.xvga
    }
  }

  boot_order = var.cdrom != null && length(var.cdrom) > 0 ? ["ide0", var.disk[0].interface] : [var.disk[0].interface]

  dynamic "cdrom" {
    for_each = var.cdrom != null && length(var.cdrom) > 0 ? tolist(var.cdrom) : []
    content {
      enabled   = cdrom.value.enabled
      file_id   = proxmox_virtual_environment_file.resource_iso[0].id
      interface = "ide0"
    }
  }
}

resource "proxmox_virtual_environment_file" "resource_iso" {
  count = var.cdrom != null && length(var.cdrom) > 0 ? 1 : 0

  datastore_id = var.disk[0].datastore_id
  node_name    = var.node_name

  source_file {
    path = var.cdrom[0].file_id
  }
}
