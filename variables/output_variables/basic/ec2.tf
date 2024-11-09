resource "aws_instance" "my_instance" {
  ami                    = "ami-08718895af4dfa033"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = "terraform_key"
  user_data              = file("apache.sh")
  tags = {
    Name = "my_instance"
  }
}