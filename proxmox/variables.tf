variable "proxmox_endpoint" {
  type        = string
  description = "The URL of the Proxmox API (e.g., https://192.168.0.20:8006/)"
}

variable "vlan_10_gateway" {
  type        = string
  default     = "192.168.10.1"
  description = "Default gateway for VLAN 10"
}

variable "vlan_10_id" {
  type        = number
  default     = 10
  description = "VLAN ID for the monitoring network"
}

variable "default_bridge" {
  type        = string
  default     = "vmbr0"
}
