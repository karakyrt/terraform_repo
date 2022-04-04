resource "aws_instance" "main" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = "${var.env}-instance"
        Environment = var.env
        S3_BUCKET_NAME = var.bucket_name
    }
}