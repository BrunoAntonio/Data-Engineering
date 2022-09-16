output "lambda_function_name" {
  description = "Lambda function name"
  value       = aws_lambda_function.lambda.function_name
}