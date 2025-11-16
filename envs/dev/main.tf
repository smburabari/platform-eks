locals {
  environment  = "dev"
  cluster_name = "eks-dev"

  common_tags = {
    Project     = "platform-eks-lab"
    Environment = local.environment
    Owner       = "soli"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  environment        = local.environment
  cluster_name       = local.cluster_name
  cidr_block         = "10.10.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b"]

  private_subnets = [
    "10.10.1.0/24",
    "10.10.2.0/24",
  ]

  public_subnets = [
    "10.10.3.0/24",
    "10.10.4.0/24",
  ]

  tags = local.common_tags
}

module "eks" {
  source = "../../modules/eks"

  environment        = local.environment
  cluster_name       = local.cluster_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets
  tags               = local.common_tags
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
