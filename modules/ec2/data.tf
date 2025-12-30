data "aws_region" "current" {}

data "aws_ami" "aws_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}


data "aws_ec2_managed_prefix_list" "eic" {
  name = "com.amazonaws.${data.aws_region.current.region}.ec2-instance-connect"
}
