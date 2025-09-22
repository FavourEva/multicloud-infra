# Firewall Rule - Allow HTTP/HTTPS to Web Tier
resource "google_compute_firewall" "web_allow_http_https" {
  name    = "${var.project_name}-web-allow-http-https"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web-server"]

  description = "Allow HTTP and HTTPS traffic to web servers"
}

# Firewall Rule - Allow SSH from VPC
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.project_name}-allow-ssh"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.vpc_cidr]
  target_tags   = ["ssh-server"]

  description = "Allow SSH access from within VPC"
}

# Firewall Rule - Allow App Traffic from Web Tier
resource "google_compute_firewall" "app_allow_from_web" {
  name    = "${var.project_name}-app-allow-from-web"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_tags = ["web-server"]
  target_tags = ["app-server"]

  description = "Allow traffic from web tier to app tier"
}

# Firewall Rule - Allow Database Traffic from App Tier
resource "google_compute_firewall" "db_allow_from_app" {
  name    = "${var.project_name}-db-allow-from-app"
  network = var.network_name

  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  source_tags = ["app-server"]
  target_tags = ["database-server"]

  description = "Allow MySQL traffic from app tier to database tier"
}

# Firewall Rule - Allow Health Checks
resource "google_compute_firewall" "allow_health_checks" {
  name    = "${var.project_name}-allow-health-checks"
  network = var.network_name

  allow {
    protocol = "tcp"
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["web-server", "app-server"]

  description = "Allow Google Cloud health checks"
}

# Firewall Rule - Deny All Other Traffic
resource "google_compute_firewall" "deny_all" {
  name     = "${var.project_name}-deny-all"
  network  = var.network_name
  priority = 65534

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]

  description = "Deny all other traffic"
}
