module "ec2" {
  source        = "github.com/karakyrt/terraform_repo//modules/ec2?ref=v1" # or ..=v2
  ami           = "ami-0affd4508a5d2481b"
  instance_type = "t2.micro"
  env           = "dev"
  bucket_name   = module.s3.s3_name # Reference to output
}

module "s3" {
  source = "../modules/s3"
  env    = "dev"
}



// github.com/ = main domain
// aKs/ = organization 
// terraform_repo/ = repository
// tree/ = branches
// main/ = branch
// modules/ = subdirectory
// ec2/ = subdirectory 

// Tag

// git tag -a v1 -m "version 1"
// git tag -l
// git push origin v1