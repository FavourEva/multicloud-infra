# Project Outputs
output "project_id" {
  description = "GCP project ID"
  value       = var.gcp_project_id
}

output "region" {
  description = "GCP region"
  value       = var.gcp_region
}

output "zone" {
  description = "GCP zone"
  value       = var.gcp_zone
}

# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.network_id
}

output "vpc_name" {
  description = "Name of the VPC"
  value       = module.network.network_name
}

# Subnet Outputs
output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.network.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.network.private_subnet_id
}

output "database_subnet_id" {
  description = "ID of the database subnet"
  value       = module.network.database_subnet_id
}

# Compute Outputs
output "web_instance_names" {
  description = "Names of the web tier instances"
  value       = module.compute.web_instance_names
}

output "web_instance_external_ips" {
  description = "External IP addresses of the web tier instances"
  value       = module.compute.web_instance_external_ips
}

output "web_instance_internal_ips" {
  description = "Internal IP addresses of the web tier instances"
  value       = module.compute.web_instance_internal_ips
}

output "app_instance_names" {
  description = "Names of the app tier instances"
  value       = module.compute.app_instance_names
}

output "app_instance_internal_ips" {
  description = "Internal IP addresses of the app tier instances"
  value       = module.compute.app_instance_internal_ips
}

# Database Outputs
output "database_instance_name" {
  description = "Name of the Cloud SQL instance"
  value       = module.database.database_instance_name
}

output "database_connection_name" {
  description = "Connection name of the Cloud SQL instance"
  value       = module.database.database_connection_name
}

output "database_private_ip" {
  description = "Private IP address of the Cloud SQL instance"
  value       = module.database.database_private_ip_address
}

output "database_name" {
  description = "Name of the database"
  value       = module.database.database_name
}

output "database_username" {
  description = "Database username"
  value       = module.database.database_username
  sensitive   = true
}

output "database_password" {
  description = "Database password"
  value       = random_password.db_password.result
  sensitive   = true
}

# Network Infrastructure Outputs
output "router_name" {
  description = "Name of the Cloud Router"
  value       = module.network.router_id
}

output "nat_name" {
  description = "Name of the Cloud NAT"
  value       = module.network.nat_id
}
