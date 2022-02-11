resource "aws_instance" "web" {
  count                  = var.number_of_ec2
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data              = data.template_file.user_data.rendered //-----rendered--it means terraform can read any script(userdata.sh)

  tags = {
    Name  = "${var.env}-project_1"          //first approach. Which means call to variables to add tags to yours instances
    Name2 = format("%s-project_2", var.env) //second approach. Which means use terraform format function to add tags to yours Instnces.
  }                                         //And this approach more advance and more handy becouse you can manage 1000 lines of code
}
// How to use prefix or suffix in Tags line in ec2.tf with variables ?
// How to work with Tags using: terraform format function
