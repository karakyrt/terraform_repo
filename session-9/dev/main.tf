module "ec2" {
    source = "../../modules/ec2"          # it shows where is your Modules located
    ami = "ami-0affd4508a5d2481b"
    instance_type = "t2.micro"
    env = "dev"
    bucket_name = module.s3.s3_name      # Reference to output
}

module "s3" {
    source = "../../modules/s3"
    env = "dev"
}