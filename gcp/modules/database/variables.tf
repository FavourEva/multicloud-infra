variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "common_labels" {
  description = "Common labels to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "gcp_region" {
  description = "GCP region for resources"
  type        = string
}

variable "network_id" {
  description = "ID of the VPC network"
  type        = string
}

variable "private_vpc_connection" {
  description = "Private VPC connection for Cloud SQL"
}

variable "db_version" {
  description = "Database version"
  type        = string
}

variable "db_tier" {
  description = "Database tier"
  type        = string
}

variable "db_disk_size" {
  description = "Database disk size in GB"
  type        = number
}

variable "db_disk_type" {
  description = "Database disk type"
  type        = string
}

variable "db_backup_enabled" {
  description = "Enable database backups"
  type        = bool
}

variable "db_backup_start_time" {
  description = "Database backup start time"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
