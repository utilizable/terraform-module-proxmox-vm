# main.tf

module "main" {
  // source module
  source = "./modules/base" 

  // pass provider variables to module  - proxmox
  provider_proxmox_username = var.provider_proxmox_username
  provider_proxmox_password = var.provider_proxmox_password
  provider_proxmox_endpoint = var.provider_proxmox_endpoint

  // pass variables to module
}
