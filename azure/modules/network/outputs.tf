output "vnet_id" {
  description = "ID of the VNet"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the VNet"
  value       = azurerm_virtual_network.main.name
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = azurerm_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = azurerm_subnet.private.id
}

output "database_subnet_id" {
  description = "ID of the database subnet"
  value       = azurerm_subnet.database.id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = azurerm_nat_gateway.main.id
}

output "nat_gateway_public_ip" {
  description = "Public IP of the NAT Gateway"
  value       = azurerm_public_ip.nat_gateway.ip_address
}
