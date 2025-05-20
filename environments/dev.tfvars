aws_region          = "eu-west-2"
vpc_name            = "luminor-vpc"
vpc_cidr_block      = "10.0.0.0/16"
azs                 = ["eu-west-2a", "eu-west-2b"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

cluster_name        = "luminor-eks-dev"

github_user         = "ejejosh"
repo_name           = "terraform-eks-atlantis"
atlantis_hostname   = "atlantis.test.nip.io"

admin_role_name     = "eks-admin"
readonly_role_name  = "eks-readonly"


