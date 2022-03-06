# it name is: plugin--with one standart single label, not block--becouse block has 2 labels

terraform {
  backend "s3" {
    bucket = "session-5-backend-secure"
    key    = "session-5/terraform.tfstate" #"path/to/my/key"
    region = "us-east-1"
    //dynamodb_table = "terraform-state-lock" #Create DynamoDB Tables and check Explore Items on Console AWS(type in search string: DynamoDB)
  } #and after run terraform apply or destroy you can see Lock File created in Explore Items on 
}   #DynamoDB on Console AWS and read documentation how to create Lock Files and how to run 
#terraform apply or destroy comands our engineers in order