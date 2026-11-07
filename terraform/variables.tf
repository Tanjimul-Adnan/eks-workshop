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
