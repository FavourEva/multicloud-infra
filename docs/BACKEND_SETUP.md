# Centralized S3 Backend Setup

This repository uses a single AWS S3 bucket for storing Terraform state across all cloud providers (AWS, Azure, GCP).

## Prerequisites

1. **AWS S3 Bucket**: Create a bucket for storing state files
2. **DynamoDB Table**: Create a table for state locking
3. **AWS Credentials**: Configure for all team members

## Setup Instructions

### 1. Create S3 Bucket
\`\`\`bash
aws s3 mb s3://your-terraform-state-bucket
aws s3api put-bucket-versioning --bucket your-terraform-state-bucket --versioning-configuration Status=Enabled
\`\`\`

### 2. Create DynamoDB Table
\`\`\`bash
aws dynamodb create-table \
  --table-name terraform-state-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5
\`\`\`

### 3. Configure AWS Credentials
All team members need AWS credentials configured:
\`\`\`bash
aws configure
\`\`\`

Or set environment variables:
\`\`\`bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
\`\`\`

## State File Organization

- AWS: `s3://your-terraform-state-bucket/aws/terraform.tfstate`
- Azure: `s3://your-terraform-state-bucket/azure/terraform.tfstate`
- GCP: `s3://your-terraform-state-bucket/gcp/terraform.tfstate`

## Benefits

- **Centralized Management**: All state files in one location
- **Consistent Backup**: Unified versioning and backup policies
- **State Locking**: DynamoDB prevents concurrent modifications
- **Cost Optimization**: Single storage provider
- **Access Control**: Manage permissions through AWS IAM

## Authentication Notes

- **AWS**: Uses native AWS credentials
- **Azure**: Requires AWS credentials (cross-cloud access)
- **GCP**: Requires AWS credentials (cross-cloud access)
