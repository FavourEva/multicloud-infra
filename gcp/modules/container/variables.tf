variable "gcp_region" {
  description = "GCP region for resources"
  type        = string
}

variable "private_subnet_name" {
  description = "ID of the private subnet"
  type        = string
}

variable "network_name" {
  description = "name of the VPC network"
  type        = string
}