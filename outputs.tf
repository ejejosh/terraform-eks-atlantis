output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "admin_role_arn" {
  value = module.iam.admin_role_arn
}
