# Terraform AWS Infrastructure - VPC + EC2 + S3 (Hands-On Practice)

## Overview

This repository contains a hands-on Terraform project where I provision a complete AWS setup using **Infrastructure as Code (IaC)**.

The goal of this project is to **understand how core AWS resources work together**, rather than relying on pre built modules. Everything is written manually to reinforce fundamentals and real world reasoning.

This project focuses on:

* Networking (VPC and subnets)
* Compute (EC2)
* Security (IAM roles and policies)
* Storage (S3)
* Clean Terraform structure and best practices

## Architecture

The infrastructure includes:

* A custom **VPC** with subnets and routing
* An **EC2 instance** deployed inside the VPC
* An **S3 bucket** used by the EC2 instance
* An **IAM Role + Instance Profile** that allows the EC2 instance to securely access S3 (no hardcoded credentials)
* Security Groups controlling network access

All resources are managed within a **single Terraform state** to keep the project simple and focused.

## Why No Terraform Modules?

This is an intentional design choice.

Since this is a personal learning project, I chose to:

* Write all resources manually
* Avoid abstraction early on
* Fully understand dependencies, references, and AWS behavior

Once patterns are repeated or environments multiply, this project can easily evolve into reusable Terraform modules.

## Project Structure

```text
.
├── providers.tf     # AWS provider configuration
├── variables.tf     # Input variables
├── vpc.tf           # VPC and networking resources
├── security.tf      # Security groups
├── iam.tf           # IAM role, policy, and instance profile
├── s3.tf            # S3 bucket
├── ec2.tf           # EC2 instance configuration
├── outputs.tf       # Useful outputs
└── README.md
```

## Key Concepts Practiced

* Infrastructure as Code (IaC)
* Terraform state management
* Resource dependencies and references
* IAM roles vs credentials
* Secure EC2 → S3 access
* Clean and maintainable Terraform layout

## How to Use

> This project is intended for learning and demonstration purposes.

```bash
terraform init
terraform plan
terraform apply
```

To destroy all resources:

```bash
terraform destroy
```

## Future Improvements

* Extract the VPC into a reusable Terraform module
* Add support for multiple environments (dev / prod)
* Introduce remote state (S3 + DynamoDB or Terraform Cloud)
* Add an Application Load Balancer (ALB)
* Replace EC2 with an Auto Scaling Group
