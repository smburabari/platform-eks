terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0, < 6.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::054867037641:role/tf-platform-admin"
    session_name = "terraform-eks-dev"
  }
}
