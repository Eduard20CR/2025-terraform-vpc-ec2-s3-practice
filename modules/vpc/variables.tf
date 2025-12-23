variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.35.0.0/16"
}

variable "amount_subnets" {
  description = "Number of subnets to create in each availability zone"
  type        = number
  default     = 4
}