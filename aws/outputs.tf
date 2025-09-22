# VPC Outputs
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC"
  value       = module.network.vpc_cidr_block
}

# Subnet Outputs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.network.private_subnet_ids
}

output "database_subnet_ids" {
  description = "IDs of the database subnets"
  value       = module.network.database_subnet_ids
}

# Security Group Outputs
output "web_security_group_id" {
  description = "ID of the web security group"
  value       = module.security.web_security_group_id
}

output "app_security_group_id" {
  description = "ID of the app security group"
  value       = module.security.app_security_group_id
}

output "database_security_group_id" {
  description = "ID of the database security group"
  value       = module.security.database_security_group_id
}

# Compute Outputs
output "web_instance_ids" {
  description = "IDs of the web tier instances"
  value       = module.compute.web_instance_ids
}

output "web_instance_public_ips" {
  description = "Public IP addresses of the web tier instances"
  value       = module.compute.web_instance_public_ips
}

output "web_instance_private_ips" {
  description = "Private IP addresses of the web tier instances"
  value       = module.compute.web_instance_private_ips
}

output "app_instance_ids" {
  description = "IDs of the app tier instances"
  value       = module.compute.app_instance_ids
}

output "app_instance_private_ips" {
  description = "Private IP addresses of the app tier instances"
  value       = module.compute.app_instance_private_ips
}

# Database Outputs
output "database_endpoint" {
  description = "RDS instance endpoint"
  value       = module.database.database_endpoint
}

output "database_port" {
  description = "RDS instance port"
  value       = module.database.database_port
}

output "database_name" {
  description = "Database name"
  value       = module.database.database_name
}

# Network Infrastructure Outputs
output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = module.network.internet_gateway_id
}

output "nat_gateway_ids" {
  description = "IDs of the NAT Gateways"
  value       = module.network.nat_gateway_ids
}

output "availability_zones" {
  description = "Availability zones used"
  value       = data.aws_availability_zones.available.names
}
