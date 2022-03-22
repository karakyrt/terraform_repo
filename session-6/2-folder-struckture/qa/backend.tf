# it name is: plugin--with one standart single label, not block--becouse block has 2 labels

terraform {       # terraform {-----this is: plugin
  backend "s3" {
    bucket = "session-5-backend-secure"
    key    = "session-6/qa/terraform.tfstate" #"path/to/my/key" and name of folders and files wich will be create inside s3 bucket(session-5-backend-secure) 
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock" #Create DynamoDB Tables check Explore Items on Console AWS(type in search string: DynamoDB)
  } #and after run terraform apply or destroy you can see Lock File created in Explore Items on 
}   #DynamoDB on Console AWS and read documentation how to create Lock Files and how to run 
#terraform apply or destroy comands our engineers in order