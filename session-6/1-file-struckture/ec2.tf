resource "aws_instance" "my_ec2" {
  count                  = var.number_of_ec2
  ami                    = var.ami                       # Reference to Input Variable
  instance_type          = var.instance_type             # Reference to Input Variable
  vpc_security_group_ids = [aws_security_group.my_sg.id] # Reference to Resource
  # when you reference to resource = first-label.second-label.attribute

  tags = {
    Name = var.env
  }
}


 