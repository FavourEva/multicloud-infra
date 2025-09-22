terraform {
  backend "s3" {
    bucket         = "multicloud-terraform-state-bucket"
    key            = "aws/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
