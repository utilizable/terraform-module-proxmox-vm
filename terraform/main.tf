# main.tf

module "main" {
  // source module
  source = "./modules/base" 

  // pass provider variables to module  - proxmox
  provider_proxmox_username = var.provider_proxmox_username
  provider_proxmox_password = var.provider_proxmox_password
  provider_proxmox_endpoint = var.provider_proxmox_endpoint

  // pass variables to module
  name            = "example"
  node_name       = "pve"
  vm_id           = "100"
  description     = ""
  tags            = ["terraform"]
  stop_on_destroy = true

  cdrom = [
    {
      enabled = "true"
      file_id = "https://mirror.accum.se/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso"
    }
  ]
}
