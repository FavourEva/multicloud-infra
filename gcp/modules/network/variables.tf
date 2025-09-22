variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "gcp_region" {
  description = "GCP region for resources"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "database_subnet_cidr" {
  description = "CIDR block for database subnet"
  type        = string
}
