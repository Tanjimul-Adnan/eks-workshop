variable "aws_region" {
  type        = string
  default     = "us-east-2"
  description = "The target AWS Region for all core infrastructure"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment stage tag name prefix"
}

variable "cluster_name" {
  type        = string
  default     = "retail-store-cluster"
  description = "Name designation of the Amazon EKS cluster"
}

variable "argocd_hostname" {
  type        = string
  default     = "argocd.local"
  description = "Hostname used by the Argo CD ingress"
}

variable "gitops_repository_url" {
  type        = string
  default     = "https://github.com/Tanjimul-Adnan/eks-helm.git"
  description = "Git repository containing the Argo CD bootstrap applications"
}

variable "gitops_target_revision" {
  type        = string
  default     = "main"
  description = "Git revision containing the Argo CD bootstrap applications"
}
