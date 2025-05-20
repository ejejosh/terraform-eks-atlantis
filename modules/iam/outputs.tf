output "admin_role_arn" {
  value = aws_iam_role.eks_admin.arn
}

output "readonly_role_arn" {
  value = aws_iam_role.eks_readonly.arn
}
