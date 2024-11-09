resource "aws_db_instance" "my_rds_db" {
  allocated_storage   = 5
  engine              = "mysql"
  instance_class      = "db.t2.micro"
  db_name             = "my_rds"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}