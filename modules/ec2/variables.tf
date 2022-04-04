variable "ami" {
    type = string
    description = "This is AMI for EC2 instance"
}

variable "instance_type" {
    type = string
    description = "This is a size of the EC2 instance"
}

variable "env" {
    type = string
    description = "This represents the environment"
}

variable "bucket_name" {
    type = string
    description = "This is a storage bucket name"
}