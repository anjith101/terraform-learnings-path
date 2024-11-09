#terraform settings
terraform {
  required_version = "~>1.9.6"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
#provider block
provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}
#resource block
resource "aws_instance" "ec2v1" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
}
