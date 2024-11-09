resource "aws_instance" "my_instance" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  count = 5
  tags = {
    Name =  "aws-instance-${count.index}"
  }
}