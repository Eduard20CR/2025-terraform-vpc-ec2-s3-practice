module "vpc" {
  source         = "../../modules/vpc"
  cidr_block     = var.cidr_block
  amount_subnets = var.amount_subnets
}