resource "aws_instance" "web" {
  count                  = var.number_of_ec2
  ami                    = var.ami
  //ami                  = data.aws_ami.amazon_linux_2.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data              = file("userdata.sh") 
   
  tags = {
    Name = var.env
  }
}
