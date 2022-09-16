terraform {
  required_providers {
    aws = {
      configuration_aliases = [
        aws.usw2-child,
      ]
    }
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  provider      = aws.usw2-child
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_object" "object" {
  provider = aws.usw2-child
  bucket   = aws_s3_bucket.s3_bucket.id
  key      = "lambda_functions/lambda_function.zip"
  source   = "${path.module}/files/lambda_function.zip"
  etag     = filemd5("${path.module}/files/lambda_function.zip")
}
