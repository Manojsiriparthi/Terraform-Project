# Terraform Project 2024

## Overview
This repository contains the Terraform code for managing infrastructure resources for the 2024 project, utilizing AWS as the primary cloud provider.

## Project Structure
- `main.tf`: Contains the main set of Terraform configuration files.
- `outputs.tf`: Defines outputs after Terraform deployment.
- `backend.tf`: Configures the S3 backend for Terraform state management.

## Prerequisites
- AWS Account
- Terraform installed (version >= 1.0.0)
- AWS CLI installed and configured

## Configuration
### Backend
This project uses Amazon S3 as a backend for storing the Terraform state file:
- **Bucket**: `manoj.terraform-project2024`
- **Region**: `us-east-1`

### Providers
The project primarily uses the following provider:
- AWS (Amazon Web Services)

## Usage
To use these Terraform scripts, follow these steps:

### Initialization
Initialize Terraform to download the necessary plugins and configure the backend:
```bash
terraform init
terraform plan
terraform apply
terraform destroy
