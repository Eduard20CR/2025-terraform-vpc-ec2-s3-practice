module "vpc" {
  source         = "../../modules/vpc"
  cidr_block     = var.cidr_block
  amount_subnets = var.amount_subnets
}

module "storage" {
  source = "../../modules/s3"
}

module "compute" {
  source = "../../modules/ec2"
}
