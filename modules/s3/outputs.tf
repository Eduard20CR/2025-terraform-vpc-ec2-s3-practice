output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.assets.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.assets.arn
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = aws_s3_bucket.assets.bucket_domain_name
}

output "bucket_region" {
  description = "The region where the S3 bucket is created"
  value       = aws_s3_bucket.assets.region
}
