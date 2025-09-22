variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "network_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}
