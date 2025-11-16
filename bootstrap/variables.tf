variable "region" {
  description = "AWS region for Terraform state resources"
  type        = string
  default     = "us-east-1"
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket to store Terraform remote state"
  type        = string
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
  default     = "tf-state-locks"
}
