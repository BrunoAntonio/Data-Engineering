variable "iam_role_arn" {
  description = "ARN of poweruser IAM role"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "s3_object_key" {
  description = "Key of the S3 object"
  type        = string
}
