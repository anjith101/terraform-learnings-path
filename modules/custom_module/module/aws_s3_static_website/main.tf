resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
  tags          = var.tags
}
resource "aws_s3_bucket_website_configuration" "my_bucket_website_config" {
  bucket = aws_s3_bucket.my_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_versioning" "my_vucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_public_access_block" "my_bucket_public_access" {
  bucket                  = aws_s3_bucket.my_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_ownership_controls" "my_bucket_ownership_control" {
  bucket = aws_s3_bucket.my_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_acl" "my_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.my_bucket_ownership_control, aws_s3_bucket_public_access_block.my_bucket_public_access]
  bucket     = aws_s3_bucket.my_bucket.id
  acl        = "public-read"
}
resource "aws_s3_bucket_policy" "my_bucket_policy" {
	depends_on = [ aws_s3_bucket_acl.my_bucket_acl ]
  bucket = aws_s3_bucket.my_bucket.id
  policy = <<EOF
            {
                "Version": "2012-10-17",
                "Statement": [
                    {
                        "Sid": "PublicReadGetObject",
                        "Effect": "Allow",
                        "Principal": "*",
                        "Action": [
                            "s3:GetObject"
                        ],
                        "Resource": [
                            "arn:aws:s3:::${var.bucket_name}/*"
                        ]
                    }
                ]
            }  
            EOF
}
resource "aws_s3_object" "name" {
  depends_on = [aws_s3_bucket.my_bucket]
  bucket     = aws_s3_bucket.my_bucket.bucket
  key        = "index.html"
  source     = var.index_path
	content_type = "text/html"
}