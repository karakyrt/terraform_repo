output "rds_db_hostname" {
  value = aws_db_instance.default.address
}

output "rds_db_name" {
  value = aws_db_instance.default.name
}

output "rds_db_password" {
  value     = random_password.password.result
  sensitive = true
}