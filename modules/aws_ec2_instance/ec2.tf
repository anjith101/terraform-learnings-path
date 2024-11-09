module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  for_each               = toset(["one", "two"])
  name                   = "my-instance-${each.key}"
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = "terraform_key"
  monitoring             = true
  vpc_security_group_ids = ["sg-03f3eece22688b047"]
  subnet_id              = "subnet-07d4f4cb49be12be3"
  user_data              = file("apache.sh")
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}