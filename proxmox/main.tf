# =========================================================================
# 1. MONITORING DEPLOYMENT: WAZUH SERVER (VLAN 10)
# =========================================================================
resource "proxmox_virtual_environment_vm" "wazuh_server" {
  name        = "wazuh-server"
  description = "Central SIEM & Security Configuration Management"
  node_name   = "pve"

  clone {
    vm_id = 905 
    full  = true 
  }

  agent {
    enabled = true 
  }

  cpu {
    cores = 4
  }

  memory {
    dedicated = 8192 
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "virtio0"
    size         = 50
    file_format  = "raw" 
  }

  network_device {
    bridge  = var.default_bridge
    vlan_id = var.vlan_10_id      
  }

  initialization {
    ip_config {
      ipv4 {
        # Keep the specific IP hardcoded here, it belongs to Wazuh!
        address = "192.168.10.5/24"
        gateway = var.vlan_10_gateway 
      }
    }
  }
}

# =========================================================================
# 2. THREAT INTELLIGENCE: MISP SERVER (VLAN 10)
# =========================================================================
resource "proxmox_virtual_environment_vm" "misp_server" {
  name        = "misp-server"
  description = "MISP Threat Intelligence Platform"
  node_name   = "pve"

  clone {
    vm_id = 905 
    full  = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 4096 
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "virtio0"
    size         = 50
    file_format  = "raw" 
  }

  network_device {
    bridge  = var.default_bridge
    vlan_id = var.vlan_10_id
  }

  initialization {
    ip_config {
      ipv4 {
        # Keep the specific IP hardcoded here, it belongs to MISP!
        address = "192.168.10.6/24"
        gateway = var.vlan_10_gateway 
      }
    }
  }
}
