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

variable "gcp_zone" {
  description = "GCP zone for instances"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "web_machine_type" {
  description = "Machine type for web tier"
  type        = string
}

variable "app_machine_type" {
  description = "Machine type for app tier"
  type        = string
}

variable "web_instance_count" {
  description = "Number of web tier instances"
  type        = number
}

variable "app_instance_count" {
  description = "Number of app tier instances"
  type        = number
}

variable "database_private_ip" {
  description = "Private IP address of the database"
  type        = string
}
