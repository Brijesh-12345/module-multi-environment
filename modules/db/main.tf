resource "aws_db_subnet_group" "db" {
  subnet_ids = var.db_subnets
}

resource "aws_db_instance" "rds" {
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  username             = var.username
  password             = var.password
  multi_az             = true
  db_subnet_group_name = aws_db_subnet_group.db.name
  skip_final_snapshot  = true
}
