# ./modules/../backend.tf

# MODULE - BACKEND 
# ------------------

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
  }
}
