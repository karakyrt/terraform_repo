//1. This is first approach how to Fetching the Data from Resoureces(example what kind off resources: ec2 or vpc etc.)

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

//2. This is second approach how to Fetching the Data, but now I will do: Fetching the Data from Files

data "template_file" "user_data" {
  template = file("userdata.sh")
  vars = {
    environment = var.env
  }
}
//this data_source.tf works with variables.tf