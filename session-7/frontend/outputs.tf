output "password" {
  value = data.terraform_remote_state.rds.outputs.rds_db_password
}