#input variables

variable "ami" {
  type        = string
  default     = "ami-0be2609ba883822ec"
  description = "this is ami id for ec2 instance, x86"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "instance type for ec2"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "variables for environments"
}

variable "number_of_ec2" {
  type        = number
  default     = "2"
  description = "number of ec2 instances"
}

variable "sg_ports" {
  type        = list(string)
  default     = ["22", "80", "443", "3306", "5432"]
  description = "list of ports for my security groups"
}

variable "ports_cidr" {
  type    = list(string)
  default = ["10.0.0.0/16", "0.0.0.0/0", "0.0.0.0/0", "10.0.0.0/16", "10.0.0.0/16"]
}

######################## type ###############

# - string = ggr647883@#4!!40404::%$&
# - number = 1234567891910
# - bool   = True or False