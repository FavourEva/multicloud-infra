variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_id" {
  description = "ID of the VNet"
  type        = string
}

variable "database_subnet_id" {
  description = "ID of the database subnet"
  type        = string
}

variable "db_sku_name" {
  description = "Database SKU name"
  type        = string
}

variable "db_storage_mb" {
  description = "Database storage in MB"
  type        = number
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database administrator username"
  type        = string
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

variable "db_backup_retention_days" {
  description = "Database backup retention in days"
  type        = number
}

variable "db_geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backup"
  type        = bool
}
