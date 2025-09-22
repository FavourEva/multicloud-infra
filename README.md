# Multi-Cloud 3-Tier Infrastructure with Terraform

This repository contains Terraform configurations for provisioning a standard **3-tier infrastructure** (network, compute, and database) across three major cloud providers: **Amazon Web Services (AWS)**, **Microsoft Azure**, and **Google Cloud Platform (GCP)**.  

The design emphasizes **modularity, reusability, and secure state management**, allowing teams to consistently deploy equivalent architectures across multiple clouds.

---

## Repository Structure

```bash
├── .gitignore
├── Architecture/        # Architectural diagrams and design references
├── docs/                # Supporting documentation
│   ├── BACKEND_SETUP.md # Instructions for backend configuration
│   └── MODULES.md       # Documentation for individual modules
├── aws/                 # AWS-specific Terraform configuration
├── azure/               # Azure-specific Terraform configuration
└── gcp/                 # GCP-specific Terraform configuration

```

Each cloud provider directory follows the same structure:

- **backend.tf** → Remote backend configuration for state storage  
- **main.tf** → Root configuration invoking modules  
- **providers.tf** → Provider setup and authentication  
- **variables.tf** → Input variable definitions  
- **terraform.tfvars.example** → Example variable file for customization  
- **outputs.tf** → Output values for referencing provisioned resources  
- **modules/** → Encapsulated modules (network, compute, database, security)  
- **user_data/** → Bootstrap scripts for initializing compute instances  

---

## Modules Overview

Each module encapsulates a distinct layer of the architecture:

- **Network Module**  
  Provisions VPCs/VNets, subnets, and routing components.  

- **Security Module**  
  Configures security groups, firewall rules, or network security groups (NSGs).  

- **Compute Module**  
  Deploys virtual machines (EC2, Azure VM, GCE) with optional bootstrap scripts in `user_data/`.  

- **Database Module**  
  Provisions managed database services (AWS RDS, Azure SQL Database, GCP Cloud SQL).  

Detailed inputs, outputs, and examples for each module are available in [`docs/MODULES.md`](docs/MODULES.md).

---

## Prerequisites

1. **Terraform** v1.5+ (or the version specified in `required_version`).
2. Cloud CLIs installed and authenticated:
   - AWS CLI (`aws sts get-caller-identity` should succeed).
   - Azure CLI (`az login` and `az account show`).
   - GCP SDK (`gcloud auth application-default login`).
3. Credentials with sufficient permissions to create networking, compute, database, and storage resources in the chosen cloud provider.
4. A remote backend for storing Terraform state. Setup instructions are available in [`docs/BACKEND_SETUP.md`](docs/BACKEND_SETUP.md).

---

## Getting Started

### 1. Select Cloud Provider
Navigate into the directory of the provider you want to deploy (`aws/`, `azure/`, or `gcp/`).

```bash
cd aws   # or azure / gcp
2. Configure Variables
Copy the example variable file and update it with your environment-specific values:

cp terraform.tfvars.example terraform.tfvars
Edit terraform.tfvars to define parameters such as region, VPC CIDR, instance sizes, and database settings.

3. Initialize Terraform
Initialize the working directory and configure the backend:

terraform init
4. Manage Workspaces (Optional)
Create or select a workspace (e.g., dev, stage, prod):

terraform workspace new dev || terraform workspace select dev
5. Review Planned Changes
Generate and review the execution plan:

terraform plan -var-file="terraform.tfvars" -out=plan.out
6. Apply the Configuration
Apply the configuration to provision resources:


terraform apply "plan.out"
7. Destroy Resources
When resources are no longer required, ensure they are properly destroyed:

terraform destroy -var-file="terraform.tfvars"
Example terraform.tfvars
environment        = "dev"
region             = "us-east-1"
vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]

instance_type_web  = "t3.micro"
instance_type_app  = "t3.small"

db_engine          = "postgres"
db_engine_version  = "14"
db_instance_class  = "db.t3.micro"
Outputs
After a successful deployment, Terraform will output key information, including:

Public/private IP addresses of web and application servers

Database connection endpoint

VPC/VNet identifiers

Security group or firewall rule identifiers

Best Practices
Use remote backends with state locking (S3 + DynamoDB, Azure Storage, GCS).

Keep sensitive data out of source control. Never commit terraform.tfvars containing secrets.

Apply the principle of least privilege when configuring IAM roles or service principals.

Use consistent tagging across all resources for cost allocation and management.

Always review the execution plan before applying changes.

Clean up unused infrastructure using terraform destroy to prevent unnecessary costs.

Documentation
docs/BACKEND_SETUP.md — Instructions for configuring Terraform backends.

docs/MODULES.md — Detailed documentation of modules and their variables.

Terraform Documentation

Cloud provider Terraform provider references:

AWS Provider

AzureRM Provider

Google Provider

Notes
Users are encouraged to:

Work in isolated workspaces per environment.

Regularly destroy unused resources to avoid costs.

Extend or customize modules to meet additional requirements.
