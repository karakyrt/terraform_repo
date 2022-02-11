#input variables

//I don't need this block variable "ami" anymore becouse I will be work with Data Source Block it means I will be work with data_source.tf
//becouse I wiil take ami-image not from this variable block how I used to do before, and now I will take Specific ami-image(data "aws_ami" "amazon_linux_2" {
// and "amzn2-ami-hvm-2.0*"-this is specific ami image) directly from data_source.tf and this is reason why I did uncoment(//) this variable block(variable "ami" {)
//Please read this explanation, why you did uncoment this variable block: variable "ami" {

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
