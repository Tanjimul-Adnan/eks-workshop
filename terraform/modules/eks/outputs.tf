output "cluster_endpoint" {
  value = module.aws_eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.aws_eks.cluster_certificate_authority_data
}

output "cluster_name" {
  value = module.aws_eks.cluster_name
}

output "oidc_provider_arn" {
  value = module.aws_eks.oidc_provider_arn
}
