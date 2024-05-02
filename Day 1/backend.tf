terraform {
  backend "s3" {
    bucket         = "lab1-devp-rofile-bk" 
    key            = "terraform.tfstate" 
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-dev"
  }
}