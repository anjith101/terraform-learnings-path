resource "aws_instance" "my_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "terraform_key"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  user_data              = file("apache.sh")
  tags = {
    Name = "my-ec2"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("private_key/terraform_key.pem")
  }
  provisioner "file" {
    source      = "apps/index.html"
    destination = "/home/ec2-user/index.html"
  }
  provisioner "file" {
    source      = "apps"
    destination = "/home/ec2-user"
  }
  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/home/ec2-user/data.log"
  }
}