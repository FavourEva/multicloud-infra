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

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "web_vm_size" {
  description = "VM size for web tier"
  type        = string
}

variable "app_vm_size" {
  description = "VM size for app tier"
  type        = string
}

variable "web_vm_count" {
  description = "Number of web tier VMs"
  type        = number
}

variable "app_vm_count" {
  description = "Number of app tier VMs"
  type        = number
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
}

variable "database_fqdn" {
  description = "FQDN of the database server"
  type        = string
}
