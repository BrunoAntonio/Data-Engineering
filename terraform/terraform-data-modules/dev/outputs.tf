############ IAM
output "poweruser_name_from_child" {
  description = "Name of poweruser IAM role"
  value       = module.iam.poweruser_iam_role_name
}

############ S3
output "bucket_name_from_child" {
  description = "Name of the S3 bucket"
  value       = module.s3.s3_bucket_name
}

output "object_key_from_child" {
  description = "Key of the S3 object"
  value       = module.s3.s3_object_key
}

########### Lambda
output "lambdafunction_name_from_child" {
  description = "Name of the Lambda Function"
  value       = module.lambda.lambda_function_name
}

########### DynamoDB
output "dynamodb_name_from_child" {
  description = "Name of the DynamoDB table"
  value       = module.dynamodb.dynamodb_function_name
}

output "dynamo_object_id_from_child" {
  description = "ID of the DynamoDB object"
  value       = module.dynamodb.dynamodb_object_id
}

########### Glue
output "glue_database_name_from_child" {
  description = "Name of the Glue database"
  value       = module.glue.glue_database_name
}

output "s3_database_key_from_child" {
  description = "Name of the S3 database"
  value       = module.s3.s3_database_key
}

output "glue_table_name_from_child" {
  description = "Name of the Glue table"
  value       = module.glue.glue_table_name
}

