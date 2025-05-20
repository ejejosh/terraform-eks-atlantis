variable "aws_region" {
  description = "AWS Region"
  type        = string
}
variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
}
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}
variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}
variable "public_subnet_cidrs" {
  description = "Public Subnet CIDRs"
  type        = list(string)
}

variable "admin_role_name" {
  description = "Kubernetes cluster admin role name"
  type        = string
}
variable "readonly_role_name" {
  description = "Kubernetes cluster readonly role name"
  type        = string
}

variable "github_user" {
  description = "Github username"
  type        = string
}
variable "github_token" {
  description = "Github token"
  type        = string
  sensitive   = true
}

variable "atlantis_hostname" {
  description = "Kubernetes cluster endpoint "
  type        = string
}
variable "repo_name" {
  description = "Github repository name"
  type        = string
}
