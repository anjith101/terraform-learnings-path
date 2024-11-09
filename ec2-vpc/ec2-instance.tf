resource "aws_instance" "my_instance" {
  ami                    = "ami-08718895af4dfa033"
  instance_type          = "t2.micro"
  key_name               = "terraform_key"
  subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_vpc_security_group.id]
  provisioner "remote-exec" {
    inline = [ 
        "sudo yum check-update",
        "sudo yum update ",
        "sudo yum -y install httpd",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "sudo systemctl status httpd | grep Active",
        "sudo chown -R $USER:$USER /var/www",
        "cd /var/www/html/",
        "echo '<!DOCTYPE html>' > index.html",
        "echo '<html>' >> index.html",
        "echo '<head>' >> index.html",
        "echo '<title>Level It Up</title>' >> index.html",
        "echo '<meta charset=`UTF-8`>' >> index.html",
        "echo '</head>' >> index.html",
        "echo '<body>' >> index.html",
        "echo '<h1>This is a terraform trial</h1>' >> index.html",
        "echo '</body>' >> index.html",
        "echo '</html>' >> index.html"
     ]
     connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("/home/anjith/terraform-learnings-path/terraform_key.pem")
        host = self.public_ip
     }
  }
}