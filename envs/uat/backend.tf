terraform {
  backend "s3" {
    bucket         = "soli-platform-tf-state-001"
    key            = "envs/uat/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-state-locks"
    encrypt        = true
  }
}
