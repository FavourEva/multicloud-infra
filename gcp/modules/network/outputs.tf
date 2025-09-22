output "network_id" {
  description = "ID of the VPC network"
  value       = google_compute_network.main.id
}

output "network_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.main.name
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = google_compute_subnetwork.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = google_compute_subnetwork.private.id
}

output "database_subnet_id" {
  description = "ID of the database subnet"
  value       = google_compute_subnetwork.database.id
}

output "router_id" {
  description = "ID of the Cloud Router"
  value       = google_compute_router.main.id
}

output "nat_id" {
  description = "ID of the Cloud NAT"
  value       = google_compute_router_nat.main.id
}

output "private_vpc_connection" {
  description = "Private VPC connection for Cloud SQL"
  value       = google_service_networking_connection.private_vpc_connection
}
