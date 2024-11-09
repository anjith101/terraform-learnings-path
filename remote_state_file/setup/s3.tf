resource "aws_s3_bucket" "bucket" {
  bucket              = "anjith-terraform-state-bucket"
  object_lock_enabled = true
  tags = {
    Name = "anjith-terraform-state-bucket"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "aws_s3_bucket_server_side_encryption_configuration" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
resource "aws_s3_bucket_versioning" "name" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}