module "aws_static_website" {
  source      = "./module/aws_s3_static_website"
  aws_region  = var.aws_region
  bucket_name = var.bucket_name
  tags = {
    "Terraform"   = "true"
    "Environment" = "dev"
  }
  index_path = "./index.html"
}
