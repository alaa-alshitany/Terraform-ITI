resource "aws_s3_bucket" "s3_bucket" {
  bucket = "lab1-devp-rofile-bk" 
}
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock-dev"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}