resource "aws_security_group" "my_sg" {
  name        = "SSH" //this SSH name of security groups, you will se on Console AWS where is: Security Groups on EC2 instance
  description = "Allow SSH inbound traffic"
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = 22 // count.index = 0--always count.index start from 0, 1, 2, 3, 4 = count = 5
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] // CIDER Range related to our VPC and Security Groups, was before  
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.my_sg.id
}

resource "aws_security_group_rule" "ingress_apache" {
  type              = "ingress"
  from_port         = 80 // count.index = 0--always count.index start from 0, 1, 2, 3, 4 = count = 5
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] // CIDER Range related to our VPC and Security Groups, was before  
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
