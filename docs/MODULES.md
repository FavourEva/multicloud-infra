# Terraform Modules Documentation

This document describes the modular structure and reusable components used across the multi-cloud infrastructure.

## Module Structure

Each cloud provider (AWS, Azure, GCP) follows a consistent modular architecture:

\`\`\`
<provider>/
├── modules/
│   ├── compute/     # Virtual machines, instances, scaling groups
│   ├── database/    # Managed databases, storage solutions
│   ├── network/     # VPCs, subnets, routing, load balancers
│   └── security/    # IAM, security groups, firewalls
├── main.tf          # Root module configuration
├── variables.tf     # Input variables
├── outputs.tf       # Output values
└── terraform.tfvars.example  # Example configuration
\`\`\`

## Core Modules

### Compute Module
**Purpose**: Manages virtual machines, auto-scaling, and compute resources

**AWS Resources**:
- EC2 instances
- Launch Templates

**Azure Resources**:
- Virtual Machines
- Availability Sets

**GCP Resources**:
- Compute Engine instances
- Instance Templates

### Database Module
**Purpose**: Provisions managed database services and storage

**AWS Resources**:
- RDS instances


**Azure Resources**:
- Azure SQL Database


**GCP Resources**:
- Cloud SQL instances


### Network Module
**Purpose**: Creates network infrastructure and connectivity

**AWS Resources**:
- VPC and subnets
- Internet/NAT Gateways
- Route tables
- Security Groups

**Azure Resources**:
- Virtual Networks
- Subnets
- Network Security Groups
- Public IP addresses

**GCP Resources**:
- VPC networks
- Subnets
- Firewall rules
- Cloud NAT

### Security Module
**Purpose**: Manages identity, access control, and security policies

**AWS Resources**:
- IAM roles and policies
- KMS keys
- Secrets Manager
- CloudTrail

**Azure Resources**:
- Azure AD applications
- Key Vault
- Role assignments
- Activity Log

**GCP Resources**:
- IAM bindings
- Cloud KMS
- Secret Manager
- Cloud Logging

## Module Usage

### Input Variables
Each module accepts standardized input variables:

```hcl
module "compute" {
  source = "./modules/compute"
  
  # Common variables
  environment     = var.environment
  project_name    = var.project_name
  region         = var.region
  
  # Module-specific variables
  instance_type  = var.instance_type
  min_size       = var.min_size
  max_size       = var.max_size
}
