output "database_server_name" {
  description = "Name of the MySQL server"
  value       = azurerm_mysql_flexible_server.main.name
}

output "database_fqdn" {
  description = "FQDN of the MySQL server"
  value       = azurerm_mysql_flexible_server.main.fqdn
}

output "database_name" {
  description = "Name of the database"
  value       = azurerm_mysql_flexible_database.main.name
}

output "database_username" {
  description = "Database administrator username"
  value       = azurerm_mysql_flexible_server.main.administrator_login
  sensitive   = true
}
