resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "my_vpc_tag"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "my_vpc_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    "Name" = "my_vpc_gateway_tag"
  }
}

resource "aws_route_table" "my_vpc_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "my_vpc_public_route" {
  route_table_id         = aws_route_table.my_vpc_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_vpc_gateway.id
}

resource "aws_route_table_association" "my_vpc_route_table_subnet_association" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_security_group" "my_vpc_security_group" {
  name        = "my_secutiry_group"
  description = "allow ssh and tcp from all ip and all outbound traffinc"
  vpc_id      = aws_vpc.my_vpc.id
  tags = {
    "Name" = "my_security_group_tag"
  }
}

resource "aws_vpc_security_group_ingress_rule" "my_seurity_group_inbound_rules_ssh" {
  description       = "Allow ssh from all ip address range"
  security_group_id = aws_security_group.my_vpc_security_group.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "my_seurity_group_inbound_rules_tcp" {
  description       = "Allow HTTP from all address ranges"
  security_group_id = aws_security_group.my_vpc_security_group.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "my_seurity_group_outbound_rules" {
  description       = "Allow access to all outbound traffic"
  security_group_id = aws_security_group.my_vpc_security_group.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
}
