# ./modules/../backend.tf

# CONFIGURATION - BACKEND 
# ------------------

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}
