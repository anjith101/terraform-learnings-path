resource "aws_instance" "my_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  count                  = var.instance_count
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = "terraform_key"
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum check-update
    sudo yum update
    sudo yum -y install httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo systemctl status httpd | grep Active
    sudo chown -R $USER:$USER /var/www
    cd /var/www/html/
    echo '<!DOCTYPE html>' > index.html
    echo '<html>' >> index.html
    echo '<head>' >> index.html
    echo '<title>Level It Up</title>' >> index.html
    echo '<meta charset=`UTF-8`>' >> index.
    echo '</head>' >> index.html
    echo '<body>' >> index.html
    echo '<h1>This is a terraform trial</h1>' >> index.html
    echo '</body>' >> index.html
    echo '</html>' >> index.html
    EOF
  tags = {
    Name = "my_instance"
  }
}