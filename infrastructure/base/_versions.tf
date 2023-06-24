# Terraform Settings Block
terraform {
  # Terraform Version
  required_version = "~> 1.5.0"
  
  required_providers {
    # AWS Provider 
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.0.0"
    }
    # Random Provider
    random = {
      source  = "hashicorp/random"
      version = "3.0.0"
    }
  }
}
