variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type    = string
  default = "retail-store-cluster"
}
