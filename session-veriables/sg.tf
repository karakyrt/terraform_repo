resource "aws_security_group" "my_sg" {
  name        = "SSH"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # in aws only "-1" to define TCP, UDP, ICMP protocols at once
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "our security group-1"
  }
}
