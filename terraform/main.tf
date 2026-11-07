terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  # Replace these placeholder strings with your active AWS configuration elements
  backend "s3" {
    bucket         = "YOUR-RETAIL-STORE-TFSTATE-BUCKET"
    key            = "gitops/retail-store/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "YOUR-RETAIL-STORE-TFSTATE-LOCKS"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

module "vpc" {
  source       = "./modules/vpc"
  environment  = var.environment
  aws_region   = var.aws_region
  cluster_name = var.cluster_name
}

module "eks" {
  source          = "./modules/eks"
  environment     = var.environment
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "data_security" {
  source            = "./modules/data_security"
  environment       = var.environment
  oidc_provider_arn = module.eks.oidc_provider_arn
}
