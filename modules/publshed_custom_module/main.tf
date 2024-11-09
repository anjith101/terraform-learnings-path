module "aws_static_website" {
  source      = "app.terraform.io/anjith101/static-website-module/s3"
  version     = "1.0.0"
  aws_region  = var.aws_region
  bucket_name = var.bucket_name
  tags = {
    "Terraform"   = "true"
    "Environment" = "dev"
  }
  index_path = "./index.html"
}
