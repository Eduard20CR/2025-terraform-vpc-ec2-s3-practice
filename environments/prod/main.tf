module "vpc" {
  source         = "../../modules/vpc"
  cidr_block     = var.cidr_block
  amount_subnets = var.amount_subnets
}

module "storage" {
  source = "../../modules/s3"
}

module "iam_ec2_s3_readonly" {
  source     = "../../modules/iam_ec2_s3_readonly"
  bucket_arn = module.storage.bucket_arn
}

module "compute" {
  source               = "../../modules/ec2"
  vpc_id               = module.vpc.vpc_id
  subnet_publica_id    = module.vpc.public_subnet_ids[0]
  iam_instance_profile = module.iam_ec2_s3_readonly.instance_profile_name
}
