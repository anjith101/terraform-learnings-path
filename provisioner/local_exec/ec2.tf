resource "aws_instance" "my_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "terraform_key"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  tags = {
    Name = "my-ec2"
  }
  provisioner "local-exec" {
   command = "echo ${aws_instance.my_ec2.private_ip} >> create_text.txt"
   working_dir = "output_dir/"
  }
  provisioner "local-exec" {
   when = destroy
   command = "echo Instance destroyed at `date` >> destroy_text.txt"
   working_dir = "output_dir/"
  }
}