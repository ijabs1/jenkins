# Terraform Azure Project

## Overview
This project is designed to manage and deploy Azure infrastructure using Terraform. It provides a modular and scalable approach to provisioning Azure resources, making it suitable for development, staging, and production environments. 

## Features
- Infrastructure as Code (IaC) using Terraform.
- Support for multiple environments: Dev, Staging, and Production.
- Reusable modules for resources like Virtual Networks, Storage Accounts, and Virtual Machines.
- Automation scripts for streamlined deployment and management.

## Repository Structure
```plaintext
terraform-aztraining-cat-uk/
├── environments/                # Environment-specific configurations
│   ├── dev/                     # Development environment
│   │   ├── main.tf              # Terraform configuration
│   │   ├── variables.tf         # Input variables for the environment
│   │   ├── outputs.tf           # Output variables
│   │   └── backend.tf           # Remote backend configuration
│   ├── staging/                 # Staging environment
│   └── prod/                    # Production environment
├── modules/                     # Reusable Terraform modules
│   ├── vnet/                    # Virtual network module
│   ├── vm/                      # Virtual machine module
│   └── storage-account/         # Storage account module
├── shared-resources/            # Shared resources for all environments
├── scripts/                     # Automation scripts (deploy/destroy)
├── .gitignore                   # Ignore sensitive files
├── README.md                    # Project documentation
└── terraform.tfvars.example     # Example variable values

```
## Contribution Workflow
Clone the repository and create a feature branch:
  ```bash
  git clone <repo-url>
  git checkout -b <feature-branch-name>
