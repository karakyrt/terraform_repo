# it name is: plugin--with one standart single label, not block--becouse block has 2 labels

terraform {
  backend "s3" {
    bucket         = "session-5-backend-secure"
    key            = "session-web-coding/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock" #Create DynamoDB Tables and check Explore Items on Console AWS(type in search string: DynamoDB)
  }
}