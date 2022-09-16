output "poweruser_iam_role_name" {
  description = "Name of poweruser IAM role"
  value       = try(aws_iam_role.poweruser.name, "")
}

output "iam_role_arn" {
  description = "ARN of poweruser IAM role"
  value       = aws_iam_role.poweruser.arn
}
