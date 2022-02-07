resource "aws_instance" "web" {                          
  ami           = "ami-0be2609ba883822ec"                
  instance_type = "t2.micro"                             
  vpc_security_group_ids = [aws_security_group.my_sg.id] # References to Resource

  tags = {
    Name = "Instance-1"
  }
}
 

 