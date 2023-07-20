# Configure the AWS Provider
# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default" # Defining it for default profile is Optional
}