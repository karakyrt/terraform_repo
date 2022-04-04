resource "aws_s3_bucket" "main" {
    bucket = "${var.env}-terraform-module-bmw"
    acl = "private"
}

output "s3_name" {
    value = aws_s3_bucket.main.id
}

output "s3_arn" {
    value = aws_s3_bucket.main.arn
}