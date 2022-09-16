terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
  backend "s3" {
    bucket         = "remote-state-353006047186"
    key            = "terraform/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "remote-state-lock"
  }
}

provider "aws" {
  region = "us-east-2"
}

provider "aws" {
  alias  = "usw2-root"
  region = var.region
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
  providers = {
    aws.usw2-child = aws.usw2-root
  }
}

module "lambda" {
  source = "./modules/lambda"
  providers = {
    aws.usw2-child = aws.usw2-root
  }

  iam_role_arn   = module.iam.iam_role_arn
  s3_bucket_name = module.s3.s3_bucket_name
  s3_object_key  = module.s3.s3_object_key

  depends_on = [
    module.iam,
    module.s3
  ]
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "glue" {
  source = "./modules/glue"

  s3_bucket_name  = module.s3.s3_bucket_name
  s3_database_key = module.s3.s3_database_key

  depends_on = [
    module.s3
  ]
}

