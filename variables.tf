variable "aws_region" {
  description = "AWS region for the EKS cluster and VPC resources."
  type        = string
  default     = "us-east-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster and base naming prefix for resources."
  type        = string
  default     = "demo-eks"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.31"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"

}

variable "remote_network_cidr" {
  description = "CIDR of the remote on-prem or hybrid node network."
  type        = string
  default     = "10.10.0.0/16"
}

variable "remote_pod_cidr" {
  description = "CIDR of the remote pod network for hybrid networking."
  type        = string
  default     = "10.20.0.0/16"
}

variable "ami_release_version" {
  description = "EKS AMI release version for managed node groups."
  type        = string
  default     = "1.31.x-2"
}
