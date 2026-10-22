variable "region" { type = string }
variable "cluster_name" { type = string }
variable "kubernetes_version" { type = string default = "1.31" }
variable "vpc_cidr" { type = string default = "10.20.0.0/16" }
variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.20.0.0/20", "10.20.16.0/20"]
}
variable "node_instance_types" {
  type = list(string)
  default = ["t3.medium"]
}
variable "desired_size" { type = number default = 2 }
variable "min_size" { type = number default = 1 }
variable "max_size" { type = number default = 3 }
variable "helm_repo_url" { type = string }
variable "helm_repo_path" { type = string default = "bootstrap" }
variable "helm_repo_target_revision" { type = string default = "main" }
