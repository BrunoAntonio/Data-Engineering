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

module "s3" {
  source = "./modules/s3"
  providers = {
    aws.usw2-child = aws.usw2-root
  }
}



