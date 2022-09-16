terraform {
  required_providers {
    aws = {
      configuration_aliases = [
        aws.usw2-child,
      ]
    }
  }
}

resource "aws_lambda_function" "lambda" {
  provider      = aws.usw2-child
  function_name = "lambda_function"

  #filename      = "${path.module}/functions/lambda_function.zip"
  s3_bucket = var.s3_bucket_name
  s3_key    = var.s3_object_key

  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"
  role    = var.iam_role_arn
}
