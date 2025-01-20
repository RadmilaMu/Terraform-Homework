provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-radmilam"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "kaizen-bucket1"
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "kaizen-bucket2"
}
#terraform import aws_s3_bucket.bucket1 kaizen-bucket1
#terraform import aws_s3_bucket.bucket1 kaizen-bucket1
#terraform state list 