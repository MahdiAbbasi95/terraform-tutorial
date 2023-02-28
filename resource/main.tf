resource "aws_s3_bucket" "s3_bucket" {
  bucket = "my-bucket"

  tags = {
    "Name" = "my-bucket"
  }
}