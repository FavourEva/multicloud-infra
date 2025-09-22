output "web_vm_ids" {
  description = "IDs of the web tier VMs"
  value       = azurerm_linux_virtual_machine.web[*].id
}

output "web_vm_public_ips" {
  description = "Public IP addresses of the web tier VMs"
  value       = azurerm_public_ip.web[*].ip_address
}

output "web_vm_private_ips" {
  description = "Private IP addresses of the web tier VMs"
  value       = azurerm_network_interface.web[*].private_ip_address
}

output "app_vm_ids" {
  description = "IDs of the app tier VMs"
  value       = azurerm_linux_virtual_machine.app[*].id
}

output "app_vm_private_ips" {
  description = "Private IP addresses of the app tier VMs"
  value       = azurerm_network_interface.app[*].private_ip_address
}
