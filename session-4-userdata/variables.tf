#input variables

variable "ami" {
type        = string
default     = "ami-0be2609ba883822ec"
description = "this is ami id for ec2 instance, x86"
}
//it means uncoment block(//) and I don't need this "variable ami" block only, becouse I will be using Content and Filters from data_source.tf or block


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
