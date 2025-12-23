# Terraform AWS Infrastructure Practice

## Overview

This repository contains a **hands-on Terraform project** created to **learn and apply Terraform fundamentals and best practices** while provisioning AWS infrastructure using Infrastructure as Code (IaC).

The goal of this project is to **build a solid understanding of Terraform concepts**, including modules, environments, variables, outputs, and state management, through practical, real-world examples.


## What's Included

* **VPC** with public and private subnets
* **EC2** instance deployed inside the VPC
* **S3** bucket accessed securely from EC2
* **IAM Role + Instance Profile** (no hardcoded credentials)
* Security Groups and routing

## Terraform Approach

* **Modules** contain reusable, environment-agnostic logic
* **Environments (`dev`, `prod`)** act as root modules
* Providers and state are defined at the environment level
* Data sources live where they are used

This structure mirrors how Terraform is used in real teams.

## Project Structure

```text
.
├── environments
│   ├── dev
│   │   ├── main.tf          # Root module for dev environment
│   │   ├── variables.tf     # Dev-specific inputs
│   │   ├── outputs.tf       # Dev outputs
│   │   ├── providers.tf    # AWS provider configuration
│   │   └── backend.tf      # (Optional) Remote state configuration
│   └── prod
│       ├── main.tf          # Root module for prod environment
│       ├── variables.tf     # Prod-specific inputs
│       ├── outputs.tf       # Prod outputs
│       ├── providers.tf    # AWS provider configuration
│       └── backend.tf      # (Optional) Remote state configuration
│
├── modules
│   ├── vpc
│   │   ├── main.tf          # VPC, subnets, routing
│   │   ├── data.tf          # Availability Zones data source
│   │   ├── variables.tf    # VPC inputs
│   │   └── outputs.tf      # VPC outputs
│   ├── ec2
│   │   ├── main.tf          # EC2 resources
│   │   ├── variables.tf    # EC2 inputs
│   │   └── outputs.tf      # EC2 outputs
│   └── s3
│       ├── main.tf          # S3 bucket
│       ├── variables.tf    # S3 inputs
│       └── outputs.tf      # S3 outputs
│
├── .gitignore
└── README.md

```

## How to Use

```bash
cd environments/prod
terraform init
terraform plan
terraform apply
```

To destroy resources:

```bash
terraform destroy
```

