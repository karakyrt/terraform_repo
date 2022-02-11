#input variables

//I don't need this block variable "ami" anymore becouse I will be work with Data Source Block it means I will be work with data_source.tf
//variable "ami" {
//type        = string
//default     = "ami-0be2609ba883822ec"
//description = "this is ami id for ec2 instance, x86"
//}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type for ec2"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "variables for environments"
}

variable "number_of_ec2" {
  type        = number
  default     = "1"
  description = "number of ec2 instances"
}
