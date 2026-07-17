terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.60.0"
    }
  }
}

provider "proxmox" {
  # This now pulls from your variables instead of being hardcoded
  endpoint = var.proxmox_endpoint 
  insecure = true
}

