terraform {
  required_version = "~> 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
  alias   = "aws_us_east_2"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
  alias   = "aws_ap_south_1"
}

resource "aws_vpc" "my_vpc_ap_south_1" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.aws_ap_south_1
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_vpc" "my_vpc_us_east_2" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.aws_us_east_2
  tags = {
    Name = "my_vpc"
  }
}
