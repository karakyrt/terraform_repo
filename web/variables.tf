variable "base_domain" {
  type    = string
  default = "autopowerstation.com"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_id" {
  type    = string
  default = "vpc-2979d853"
}

variable "subnets" {
  type    = list(string)
  default = ["subnet-170a9f70", "subnet-ea39a9c4"]
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "asg_max" {
  type    = number
  default = 5
}

variable "asg_desired" { # asg_desired or asg_min this is the same meaning
  type    = number
  default = 3
}


