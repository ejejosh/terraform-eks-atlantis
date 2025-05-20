variable "atlantis_hostname" {
  description = "Atlantis hostname"
  type        = string
}
variable "repo_name" {
  description = "Github repository name"
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
variable "kubernetes_host" {
  description = "Kubernetes cluster endpoint "
  type        = string
}
variable "ca_cert" {
  description = "Kubernetes cluster ca cert "
  type        = string
}
variable "token" {
  description = "Kubernetes cluster auth token "
  type        = string
}
