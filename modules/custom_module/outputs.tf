# Output variable definitions
output "name" {
  description = "Name (id) of the bucket"
  value       = module.aws_static_website.name
}

output "arn" {
  description = "ARN of the S3 Bucket"
  value       = module.aws_static_website.arn
}

output "bucket_domain_name" {
  description = "Bucket Domain Name of the S3 Bucket"
  value       = module.aws_static_website.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Regional Domain Name of the S3 Bucket"
  value       = module.aws_static_website.bucket_regional_domain_name
}

output "bucket_region" {
  description = "S3 Bucket Region"
  value       = module.aws_static_website.bucket_region
}


# Static Website URL
output "static_website_url" {
  description = "URL"
  value       = module.aws_static_website.static_website_url
}