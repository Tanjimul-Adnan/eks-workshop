variable "region" { type = string }
variable "cluster_name" { type = string default = "retail-shop-dev" }
variable "kubernetes_version" { type = string default = "1.31" }
variable "aws_account_id" { type = string }
variable "vpc_cidr" { type = string default = "10.30.0.0/16" }
variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.30.0.0/20", "10.30.16.0/20"]
}
variable "private_subnet_cidrs" {
  type = list(string)
  default = ["10.30.128.0/20", "10.30.144.0/20"]
}
variable "node_instance_types" {
  type = list(string)
  default = ["t3.medium"]
}
variable "desired_size" { type = number default = 2 }
variable "min_size" { type = number default = 1 }
variable "max_size" { type = number default = 3 }
variable "single_nat_gateway" {
  description = "Use one NAT Gateway for workshop cost savings; production may use one per AZ."
  type        = bool
  default     = true
}
