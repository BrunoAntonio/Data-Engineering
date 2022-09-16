
output "bucket_name_from_child" {
  description = "Name of the S3 bucket"
  value       = module.s3.s3_bucket_name
}

output "object_key_from_child" {
  description = "Key of the S3 object"
  value       = module.s3.s3_object_key
}

