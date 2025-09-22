output "database_endpoint" {
  description = "RDS instance endpoint"
  value       = aws_db_instance.main.endpoint
}

output "database_port" {
  description = "RDS instance port"
  value       = aws_db_instance.main.port
}

output "database_name" {
  description = "Database name"
  value       = aws_db_instance.main.db_name
}
