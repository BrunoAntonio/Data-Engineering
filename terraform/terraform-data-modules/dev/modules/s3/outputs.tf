output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket
}

output "s3_object_key" {
  description = "Key of the S3 object"
  value       = aws_s3_object.object.key
}

output "s3_database_key" {
  description = "Key of the S3 database"
  value       = aws_s3_object.database.key
}
