//this meta tag will prevent the instance from being destroyed under any condetion
resource "aws_instance" "my_instance" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  tags = {
    Name =  "my_instance"
  }
  lifecycle {
    prevent_destroy = true
  }
}