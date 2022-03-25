data "terraform_remote_state" "rds" {
  backend = "s3"
  config = {
    bucket         = "session-5-backend-secure"
    key            = "session-7/backend/terraform.tfstate"
    region         = "us-east-1"
  } 
}
