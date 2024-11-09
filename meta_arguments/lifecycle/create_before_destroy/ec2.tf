//on changeing the availability zone instance will be created in the new availability zone befre destroying the older one
resource "aws_instance" "my_instance" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
#   availability_zone = "ap-south-1b"
  tags = {
    Name =  "my_instance"
  }
  lifecycle {
    create_before_destroy = true
  }
}