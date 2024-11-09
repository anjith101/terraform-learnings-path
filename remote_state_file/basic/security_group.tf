resource "aws_security_group" "security_group" {
  name        = "vpc_sg"
  description = "security group for ssh and web traffic"
  tags = {
    Name = "vpc_sg"
  }
}
resource "aws_vpc_security_group_ingress_rule" "ingress_rules_ssh" {
  security_group_id = aws_security_group.security_group.id
  description       = "security group inbound rules for ssh"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_ingress_rule" "ingress_rules_web" {
  security_group_id = aws_security_group.security_group.id
  description       = "security group inbound rules for web"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}
resource "aws_vpc_security_group_egress_rule" "egress_rules" {
  security_group_id = aws_security_group.security_group.id
  description       = "security group outbound rules"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
}