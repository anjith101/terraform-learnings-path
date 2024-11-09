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
  type        = map(string)
  default     = {
    dev = "t2.micro"
    stag = "t3.micro"
    prod = "t3.large"
  }
}