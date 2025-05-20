module "eks" {
    source          = "terraform-aws-modules/eks/aws"
    version         = "~> 20.0"

    cluster_name    = var.cluster_name
    cluster_version = "1.29"
    vpc_id          = var.vpc_id
    subnet_ids      = var.subnet_ids
    enable_irsa     = true

    eks_managed_node_groups = {
        default = {
        min_size       = 1
        max_size       = 2
        desired_size   = 1
        instance_types = ["t3.medium"]
        }
    }

    access_entries = {
    admin = {
      principal_arn     = var.admin_role_arn
      kubernetes_groups = ["admin-group"]

      access_policies = [
        {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSAdminPolicy"
          access_scope = {
            type       = "cluster"
            namespaces = []
          }
        }
      ]
    }

    readonly = {
      principal_arn     = var.readonly_role_arn
      kubernetes_groups = ["readonly-group"]

      access_policies = [
        {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            type       = "cluster"
            namespaces = []
          }
        }
      ]
    }
  }
}
