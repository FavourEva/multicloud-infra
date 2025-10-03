variable "location" {
  description = "Azure region for resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}