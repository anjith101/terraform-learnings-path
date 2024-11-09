//for_each using map
resource "aws_instance" "my_instance" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  for_each = tomap({
    "dev" = "dev-instance"
    "stag" = "stag-instance"
    "prod" = "prod-instance"
  })
  tags = {
    Name = each.value
    env = each.key
  }
}

//for_each using set
resource "aws_iam_user" "aws_users" {
  for_each = toset(["Anjith", "Padmanabhan"])
  name = each.key
}