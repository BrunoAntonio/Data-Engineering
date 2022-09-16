data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = var.trusted_role_services
    }
  }
}

resource "aws_iam_role" "poweruser" {
  name                  = var.poweruser_role_name
  force_detach_policies = true
  assume_role_policy    = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "poweruser" {
  role       = aws_iam_role.poweruser.name
  policy_arn = var.poweruser_role_policy_arns[0]
}
