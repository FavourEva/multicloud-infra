output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "cluster_endpoint" {
  value = google_container_cluster.gke.endpoint
}

output "artifact_registry_repo" {
  value = google_artifact_registry_repository.app_repo.id
}