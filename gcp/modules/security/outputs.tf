output "web_firewall_rule_id" {
  description = "ID of the web firewall rule"
  value       = google_compute_firewall.web_allow_http_https.id
}

output "ssh_firewall_rule_id" {
  description = "ID of the SSH firewall rule"
  value       = google_compute_firewall.allow_ssh.id
}

output "app_firewall_rule_id" {
  description = "ID of the app firewall rule"
  value       = google_compute_firewall.app_allow_from_web.id
}

output "db_firewall_rule_id" {
  description = "ID of the database firewall rule"
  value       = google_compute_firewall.db_allow_from_app.id
}
