variable "cluster_name" {
  description = "Kubernetes cluster name"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}
variable "admin_role_arn" {
  description = "Kubernetes cluster admin role arn"
  type        = string
}
variable "readonly_role_arn" {
  description = "Kubernetes cluster readonly role arn"
  type        = string
}
