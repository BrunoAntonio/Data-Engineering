
variable "trusted_role_services" {
  description = "AWS Services that can assume these roles"
  type        = list(string)
  default     = ["lambda.amazonaws.com"]
}

variable "poweruser_role_name" {
  description = "IAM role with poweruser access"
  type        = string
  default     = "power_user"
}

variable "poweruser_role_policy_arns" {
  description = "List of policy ARNs to use for poweruser role"
  type        = list(string)
  default     = ["arn:aws:iam::aws:policy/PowerUserAccess", ]
}


