terraform {
  backend "s3" {
    bucket = "session-5-backend-secure"
    key    = "session-10/terraform.tfstate"
    region = "us-east-1"
  }
}