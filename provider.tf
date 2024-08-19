provider "aws" {
  region  = "us-east-1" # You can choose your preferred AWS region
  profile = "default"  # The AWS CLI profile to use
}

# Optionally, you can specify version constraints for the AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" # Use a specific version or range
    }
  }

  # Specifies the minimum required version of Terraform for this configuration
  required_version = ">= 0.12"
}
