terraform {
  required_version = ">= 1.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.30.0"
    }
  }
}

provider "azurerm" {
  
   resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  client_id = var.client_id
  client_secret = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
