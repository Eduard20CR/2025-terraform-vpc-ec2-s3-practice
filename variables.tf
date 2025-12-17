variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.35.0.0/16"
}

variable "amount_subnets" {
  description = "Number of subnets to create in each availability zone"
  type        = number
  default     = 6
}