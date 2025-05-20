module "network" {
  source              = "./modules/network"
  vpc_name            = var.vpc_name
  vpc_cidr_block      = var.vpc_cidr_block
  azs                 = var.azs
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "iam" {
  source             = "./modules/iam"
  admin_role_name    = var.admin_role_name
  readonly_role_name = var.readonly_role_name
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = var.cluster_name
  vpc_id             = module.network.vpc_id
  subnet_ids         = module.network.public_subnet_ids
  admin_role_arn     = module.iam.admin_role_arn
  readonly_role_arn  = module.iam.readonly_role_arn
}

data "aws_eks_cluster_auth" "token" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

module "atlantis" {
  source            = "./modules/atlantis"
  atlantis_hostname = var.atlantis_hostname
  repo_name         = var.repo_name
  github_user       = var.github_user
  github_token      = var.github_token

  kubernetes_host   = module.eks.cluster_endpoint
  ca_cert           = module.eks.cluster_ca_certificate
  token             = data.aws_eks_cluster_auth.token.token
}


