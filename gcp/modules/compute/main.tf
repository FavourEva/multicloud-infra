# Web Tier Instance Template
resource "google_compute_instance_template" "web" {
  name_prefix  = "${var.project_name}-web-template-"
  machine_type = var.web_machine_type
  region       = var.gcp_region

  tags = ["web-server", "ssh-server"]

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
    disk_size_gb = 20
    disk_type    = "pd-standard"
  }

  network_interface {
    subnetwork = var.public_subnet_id
    access_config {
      # Ephemeral public IP
    }
  }

  metadata = {
    startup-script = templatefile("${path.module}/user_data/web_user_data.sh", {
      instance_id = "web"
    })
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  labels = var.common_labels

  lifecycle {
    create_before_destroy = true
  }
}

# App Tier Instance Template
resource "google_compute_instance_template" "app" {
  name_prefix  = "${var.project_name}-app-template-"
  machine_type = var.app_machine_type
  region       = var.gcp_region

  tags = ["app-server", "ssh-server"]

  disk {
    source_image = "debian-cloud/debian-12"
    auto_delete  = true
    boot         = true
    disk_size_gb = 20
    disk_type    = "pd-standard"
  }

  network_interface {
    subnetwork = var.private_subnet_id
  }

  metadata = {
    startup-script = templatefile("${path.module}/user_data/app_user_data.sh", {
      instance_id = "app"
      db_endpoint = var.database_private_ip
    })
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  labels = var.common_labels

  lifecycle {
    create_before_destroy = true
  }
}

# Web Tier Instances
resource "google_compute_instance_from_template" "web" {
  count = var.web_instance_count

  name = "${var.project_name}-web-${count.index + 1}"
  zone = var.gcp_zone

  source_instance_template = google_compute_instance_template.web.id

  labels = merge(var.common_labels, {
    tier = "web"
    type = "webserver"
  })
}

# App Tier Instances
resource "google_compute_instance_from_template" "app" {
  count = var.app_instance_count

  name = "${var.project_name}-app-${count.index + 1}"
  zone = var.gcp_zone

  source_instance_template = google_compute_instance_template.app.id

  labels = merge(var.common_labels, {
    tier = "app"
    type = "appserver"
  })
}