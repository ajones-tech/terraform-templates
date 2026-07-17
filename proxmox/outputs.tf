output "wazuh_server_ip" {
  value       = proxmox_virtual_environment_vm.wazuh_server.ipv4_addresses[1][0]
  description = "The static IP address of the Wazuh server"
}

output "misp_server_ip" {
  value       = proxmox_virtual_environment_vm.misp_server.ipv4_addresses[1][0]
  description = "The static IP address of the MISP server"
}

