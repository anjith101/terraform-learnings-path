resource "aws_instance" "my_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "terraform_key"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  user_data              = file("apache.sh")
  tags = {
    Name = "my-ec2"
  }
}

resource "time_sleep" "sleep_90_sec" {
  depends_on      = [aws_instance.my_ec2]
  create_duration = "90s"
}

resource "null_resource" "manage_connection" {
  depends_on = [time_sleep.sleep_90_sec]
  triggers   = {
    always = timestamp()
  }
  connection {
    type        = "ssh"
    host        = aws_instance.my_ec2.public_ip
    user        = "ec2-user"
    private_key = file("private_key/terraform_key.pem")
  }
  provisioner "file" {
    source      = "apps/index.html"
    destination = "/home/ec2-user/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo cp /home/ec2-user/index.html /var/www/html/index.html"
    ]
  }
}
