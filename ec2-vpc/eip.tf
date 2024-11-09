resource "aws_eip" "my_eip" {
  instance   = aws_instance.my_instance.id
  depends_on = [aws_internet_gateway.my_vpc_gateway]
}