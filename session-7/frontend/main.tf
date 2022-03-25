resource "aws_instance" "1" {
  count                  = var.number_of_ec2
  ami                    = var.ami                       
  instance_type          = var.instance_type            

  tags = {
    Name = replace(local.name, "rtype", "EC2-0") #we start create EC2-0,1,2(total is: 3 instances) from "0--zero" because this is Terraform Index
    Tags = local.common_tags
  }
}

resource "aws_instance" "2" {
  count                  = var.number_of_ec2
  ami                    = var.ami                       
  instance_type          = var.instance_type             

  tags = {
    Name = replace(local.name, "rtype", "EC2-1") #we start create EC2-0,1,2(total is: 3 instances) from "0--zero" because this is Terraform Index
    Tags = local.common_tags
  }
}

resource "aws_instance" "3" {
  count                  = var.number_of_ec2
  ami                    = var.ami                       
  instance_type          = var.instance_type             
  
  tags = {
    Name =replace(local.name, "rtype", "EC2-2") #we start create EC2-0,1,2(total is: 3 instances) from "0--zero" because this is Terraform Index
    Tags = local.common_tags
  }
}