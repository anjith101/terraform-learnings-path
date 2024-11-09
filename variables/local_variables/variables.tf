variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}
variable "app_name" {
  description = "APP name"
  type        = string
  default     = "my-s3"
}
variable "environment" {
  description = "Environment"
  type        = string
  default     = "dev"
}