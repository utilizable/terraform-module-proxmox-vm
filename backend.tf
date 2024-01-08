terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      configuration_aliases = [ proxmox.pve ]   
    }
  }
}
