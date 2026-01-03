variable "role_name" {
  description = "The name of the IAM role to create"
  type        = string
  default     = "ec2_s3_readonly_role"
}

variable "bucket_arn" {
  description = "The ARN of the S3 bucket to grant read-only access to"
  type        = string
}
