resource "aws_dynamodb_table" "retail_orders" {
  name         = "${var.environment}-retail-store-orders"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Environment = var.environment
    Application = "retail-store-orders"
  }
}

resource "aws_iam_policy" "orders_dynamodb_policy" {
  name        = "${var.environment}-EKS-Orders-DynamoDB-Access"
  path        = "/"
  description = "Allows the EKS Orders microservice pod to manage transactional data in DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ]
        Resource = aws_dynamodb_table.retail_orders.arn
      }
    ]
  })
}

module "orders_pod_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "${var.environment}-eks-orders-sa-role"

  oidc_providers = {
    main = {
      provider_arn               = var.oidc_provider_arn
      namespace_service_accounts = ["retail-store:orders-service-account"]
    }
  }

  role_policy_arns = {
    dynamodb = aws_iam_policy.orders_dynamodb_policy.arn
  }
}
