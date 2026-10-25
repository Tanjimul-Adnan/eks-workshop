variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
<<<<<<< HEAD
  default     = "vprofile-eks"
=======
  default     = "eks-workshop-cluster"
>>>>>>> staging
}
