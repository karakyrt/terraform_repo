resource "aws_security_group" "my_sg" {
  name        = "SSH"            //this SSH name of security groups, you will se on Console AWS where is: Security Groups on EC2 instance
  description = "Allow SSH inbound traffic"
}

resource "aws_security_group_rule" "ingress_ssh" {
  count             = 5
  type              = "ingress"
  from_port         = element(var.sg_ports, count.index)    // count.index = 0--always count.index start from 0, 1, 2, 3, 4 = count = 5
  to_port           = element(var.sg_ports, count.index)
  protocol          = "tcp"
  //cidr_blocks       = ["10.0.0.0/16"]                        // CIDER Range related to our VPC and Security Groups, was before
  cidr_blocks       = [element(var.ports_cidr, count.index)]   // read this line in variables.tf, it looks now
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.my_sg.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.my_sg.id
}

