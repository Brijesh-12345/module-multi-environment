output "public_subnets" {
  value = [aws_subnet.public_1a.id, aws_subnet.public_1b.id]
}

output "private_app_subnets" {
  value = [aws_subnet.private_app_1a.id, aws_subnet.private_app_1b.id]
}

output "db_subnets" {
  value = [aws_subnet.db_1a.id, aws_subnet.db_1b.id]
}

output "app_sg_id" {
  value = aws_security_group.app_sg.id
}

output "private_rt_id" {
  value = aws_route_table.private_rt.id
}
