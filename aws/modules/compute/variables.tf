variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "web_instance_type" {
  description = "Instance type for web tier"
  type        = string
}

variable "app_instance_type" {
  description = "Instance type for app tier"
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

variable "key_pair_name" {
  description = "Name of the AWS key pair for EC2 instances"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs of the public subnets"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets"
  type        = list(string)
}

variable "web_security_group_id" {
  description = "ID of the web security group"
  type        = string
}

variable "app_security_group_id" {
  description = "ID of the app security group"
  type        = string
}

variable "database_endpoint" {
  description = "Database endpoint"
  type        = string
}
