resource "aws_instance" "web" { 
  count         = var.number_of_ec2                                    # Reference to Input Variables
  ami           = var.ami                                      # Reference to Input Variables
  instance_type = var.instance_type                            # Reference to Input Variables
  vpc_security_group_ids = [aws_security_group.my_sg.id]       # References to Resource

  tags = {
    Name = var.env
  }
}
