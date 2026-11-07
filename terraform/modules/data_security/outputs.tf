output "dynamodb_table_name" {
  value = aws_dynamodb_table.retail_orders.name
}

output "orders_iam_role_arn" {
  value = module.orders_pod_irsa.iam_role_arn
}
