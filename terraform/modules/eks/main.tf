module "aws_eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  eks_managed_node_groups = {
    general = {
      desired_size   = 3
      min_size       = 2
      max_size       = 5
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

  enable_cluster_creator_admin_permissions = true

  tags = {
    Environment = var.environment
    Application = "retail-store-gitops"
  }
}
