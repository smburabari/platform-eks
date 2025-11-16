variable "environment" {
  description = "Environment name (dev, uat, prod)"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the cluster will live"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for worker nodes"
  type        = list(string)
}

variable "tags" {
  description = "Common tags to apply to EKS resources"
  type        = map(string)
  default     = {}
}
