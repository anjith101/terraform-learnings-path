variable "aws_region" {
  description = "AWS resion"
  type        = string
  default     = "ap-south-1"
}
variable "instance_count" {
  description = "Count of instance"
  type        = number
  default     = 3
}
variable "ami_id" {
  description = "AMI id of the instance"
  type        = string
  default     = "ami-08718895af4dfa033"
}
variable "instance_type" {
  description = "Type of the instance"
  type        = list(string)
  default     = ["t2.micro", "t3.micro", "t3.large"]
}