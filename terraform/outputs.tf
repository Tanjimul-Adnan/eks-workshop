variable "region" {
  description = "AWS region"
  type        = string
}

output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "API Endpoint for cluster administration"
}

output "dynamodb_table_name" {
  value       = module.data_security.dynamodb_table_name
  description = "The target data table identity hook for your orders application profile"
}

output "orders_iam_role_arn" {
  value       = module.data_security.orders_iam_role_arn
  description = "IAM Role ARN to attach as an annotation onto the Kubernetes ServiceAccount config"
}
