output "dynamodb_function_name" {
  description = "dynamodb name"
  value       = aws_dynamodb_table.dynamodb.name
}

output "dynamodb_object_id" {
  description = "dynamodb object name"
  value       = aws_dynamodb_table_item.dynamodb-item.id
}
