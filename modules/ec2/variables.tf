variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "The name tag for the instance"
  type        = string
  default     = "TerraformInstance"
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "TerraformSecurityGroup"

}

variable "vpc_id" {
  description = "The VPC ID to launch the instance in"
  type        = string
}

variable "subnet_publica_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}


variable "keypair_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
  default     = "terraform-pratice"
}
