//ignores the manual changes made in the cloud provider othervise those changes will be removed on apply 
resource "aws_instance" "my_instance" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  tags = {
    Name =  "my_instance"
  }
  lifecycle {
    //ignore manual changes to tags and kepp them
    ignore_changes = [ tags ]
  }
}