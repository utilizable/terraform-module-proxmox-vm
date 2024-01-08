# ./provider.tf

# ROOT - PROVIDERS
# ------------------

provider "proxmox" {
  username = var.provider_proxmox_username
  password = var.provider_proxmox_password
  endpoint = var.provider_proxmox_endpoint

  insecure = true
  ssh {
    agent = true
  }
}
