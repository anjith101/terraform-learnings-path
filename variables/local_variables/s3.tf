resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = local.bucket_name
  tags = {
    Name = local.bucket_name
  }
}
resource "aws_s3_bucket_ownership_controls" "my_buket_owner" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "my_bucket_acl" {
  acl    = "private"
  bucket = aws_s3_bucket.my_s3_bucket.id
  depends_on = [ aws_s3_bucket_ownership_controls.my_buket_owner ]
}
locals {
  bucket_name = "${var.app_name}-${var.environment}-bucket-v1"
}