variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
  type = string
}
variable "ami_id" {
  description = "EC2 instance AMI id"
  default     = "ami-08718895af4dfa033"
  type = string
}
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
  type = string
}