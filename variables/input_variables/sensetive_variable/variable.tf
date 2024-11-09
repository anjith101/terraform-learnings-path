variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}
variable "db_username" {
  description = "Username for the RDS DB"
  type        = string
  sensitive   = true
}
variable "db_password" {
  description = "Password for RDS DB"
  type        = string
  sensitive   = true
}