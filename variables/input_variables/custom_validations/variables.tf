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
  validation {
    condition = length(var.ami_id) > 4 && substr(var.ami_id, 0, 3) == "ami-"
    error_message = "Enter a valid ami id, starting with /ami-/"
  }
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
  validation {
    condition = length(var.ami_id) > 4 && substr(var.ami_id, 0, 3) == "ami-"
    error_message = "Enter a valid ami id, starting with /ami-/"
  }
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