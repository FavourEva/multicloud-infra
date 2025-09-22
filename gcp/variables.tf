variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region for resources"
  type        = string
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "GCP zone for resources"
  type        = string
  default     = "us-central1-a"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "multi-cloud-terraform"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "DevOps Team"
}

variable "cost_center" {
  description = "Cost center for billing"
  type        = string
  default     = "Engineering"
}

# Network Variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.2.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.2.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.2.10.0/24"
}

variable "database_subnet_cidr" {
  description = "CIDR block for database subnet"
  type        = string
  default     = "10.2.100.0/24"
}

# Compute Variables
variable "web_machine_type" {
  description = "Machine type for web tier"
  type        = string
  default     = "e2-micro"
}

variable "app_machine_type" {
  description = "Machine type for app tier"
  type        = string
  default     = "e2-small"
}

variable "web_instance_count" {
  description = "Number of web tier instances"
  type        = number
  default     = 2
}

variable "app_instance_count" {
  description = "Number of app tier instances"
  type        = number
  default     = 2
}

# Database Variables
variable "db_tier" {
  description = "Database tier"
  type        = string
  default     = "db-f1-micro"
}

variable "db_disk_size" {
  description = "Database disk size in GB"
  type        = number
  default     = 20
}

variable "db_disk_type" {
  description = "Database disk type"
  type        = string
  default     = "PD_SSD"
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "dbadmin"
}

variable "db_version" {
  description = "Database version"
  type        = string
  default     = "MYSQL_8_0"
}

variable "db_backup_enabled" {
  description = "Enable database backups"
  type        = bool
  default     = true
}

variable "db_backup_start_time" {
  description = "Database backup start time"
  type        = string
  default     = "03:00"
}
