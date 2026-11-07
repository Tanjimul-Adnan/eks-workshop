output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "dynamodb_table_name" {
  value = module.data_security.dynamodb_table_name
}

output "orders_iam_role_arn" {
  value = module.data_security.orders_iam_role_arn
}
