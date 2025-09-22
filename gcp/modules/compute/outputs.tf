output "web_instance_ids" {
  description = "IDs of the web tier instances"
  value       = google_compute_instance_from_template.web[*].id
}

output "web_instance_names" {
  description = "Names of the web tier instances"
  value       = google_compute_instance_from_template.web[*].name
}

output "web_instance_external_ips" {
  description = "External IP addresses of the web tier instances"
  value       = google_compute_instance_from_template.web[*].network_interface.0.access_config.0.nat_ip
}

output "web_instance_internal_ips" {
  description = "Internal IP addresses of the web tier instances"
  value       = google_compute_instance_from_template.web[*].network_interface.0.network_ip
}

output "app_instance_ids" {
  description = "IDs of the app tier instances"
  value       = google_compute_instance_from_template.app[*].id
}

output "app_instance_names" {
  description = "Names of the app tier instances"
  value       = google_compute_instance_from_template.app[*].name
}

output "app_instance_internal_ips" {
  description = "Internal IP addresses of the app tier instances"
  value       = google_compute_instance_from_template.app[*].network_interface.0.network_ip
}
