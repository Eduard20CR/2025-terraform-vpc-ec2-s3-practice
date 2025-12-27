resource "aws_s3_bucket" "assets" {
  bucket = var.bucket_name

  tags = {
    Name = var.bucket_name
  }
}

# resource "aws_s3_bucket_versioning" "assets_versioning" {
#   bucket = aws_s3_bucket.assets.id
#   versioning_configuration {
#     status = "Disabled"
#   }
# }

resource "aws_s3_bucket_ownership_controls" "assets_ownership" {
  bucket = aws_s3_bucket.assets.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "assets_public_access_block" {
  bucket = aws_s3_bucket.assets.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket_ownership_controls.assets_ownership]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "assets_encryption" {
  bucket = aws_s3_bucket.assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}



