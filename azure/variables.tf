variable "azure_region" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
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
variable "vnet_cidr" {
  description = "CIDR block for VNet"
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.1.10.0/24"
}

variable "database_subnet_cidr" {
  description = "CIDR block for database subnet"
  type        = string
  default     = "10.1.100.0/24"
}

# Compute Variables
variable "web_vm_size" {
  description = "VM size for web tier"
  type        = string
  default     = "Standard_B1s"
}

variable "app_vm_size" {
  description = "VM size for app tier"
  type        = string
  default     = "Standard_B2s"
}

variable "web_vm_count" {
  description = "Number of web tier VMs"
  type        = number
  default     = 2
}

variable "app_vm_count" {
  description = "Number of app tier VMs"
  type        = number
  default     = 2
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
  default     = "P@ssw0rd123!"
}

# Database Variables
variable "db_sku_name" {
  description = "Database SKU name"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "db_storage_mb" {
  description = "Database storage in MB"
  type        = number
  default     = 20480
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
  default     = "dbadmin"
}

variable "db_backup_retention_days" {
  description = "Database backup retention in days"
  type        = number
  default     = 7
}

variable "db_geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backup"
  type        = bool
  default     = false
}

variable "client_id" {
}
variable "client_secret" {
}
variable "subscription_id" {
}
variable "tenant_id" {
}