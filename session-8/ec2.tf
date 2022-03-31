resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name               = aws_key_pair.terraform_server.key_name

  tags = {
    Name = var.env
  }

  provisioner "file" {
    source      = "/home/centos/terraform_repo/session-8/index.html" #where file is existing ?
    destination = "/tmp/index.html"                                  #where you whant to send this file ?

    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("~/.ssh/id_rsa")

    }
  }

  provisioner "remote-exec" { #provisioner "remote-exec" runs only instance gets bootstrapped, but it does not replace chanches to the resource. Provisioner Remote Exec, this act, is similar to CloudInit 
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      host        = self.public_ip
      private_key = file("~/.ssh/id_rsa")
    }
  }
}

resource "aws_key_pair" "terraform_server" {
  key_name   = "terraform_server_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "null_resource" "local_script" { # Null Resource means do not write to tfstate file

  provisioner "local-exec" {
    command = "echo 'this is bmw' >> local-exec.txt"
  }
}
