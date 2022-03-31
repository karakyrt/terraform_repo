resource "aws_instance" "web" {
  count                  = var.number_of_ec2

  //ami                  = var.ami------I don't need this anymore(variables) I will be using Content and Filters from data_source.tf also will do References to ec2.tf

  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  //user_data            = file("userdata.sh")-----I don't need this anymore I will be using Fetching the Data from Files
  //or use user_data = data.template_file.user_data.rendered or use user_data = file("userdata.sh"), both ways works good

  user_data = data.template_file.user_data.rendered //-----rendered--it means terraform can read and do run any script(userdata.sh)

  tags = {
    Name = var.env
  }
}
//ec2.tf works with data_source.tf, with useradd.sh and with variables.tf 
