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

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.35.0.0/18", "10.35.64.0/18"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.35.128.0/18", "10.35.192.0/18"]
}

variable "amount_subnets" {
  description = "Number of subnets to create in each availability zone"
  type        = number
  default     = 2
}