resource "helm_release" "atlantis" {
  name       = "atlantis"
  repository = "https://runatlantis.github.io/helm-charts"
  chart      = "atlantis"
  version    = "4.16.0"
  namespace  = "atlantis"
  create_namespace = true

  set {
    name  = "vcsSecretName"
    value = "atlantis-vcs"
  }

  set {
    name  = "orgWhitelist"
    value = var.github_user
  }

  set {
    name  = "repoWhitelist"
    value = "github.com/${var.github_user}/${var.repo_name}"
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0].host"
    value = var.atlantis_hostname
  }

  set {
    name  = "ingress.hosts[0].paths[0].path"
    value = "/"
  }

  set {
    name  = "ingress.hosts[0].paths[0].pathType"
    value = "Prefix"
  }
}

resource "kubernetes_secret" "vcs_token" {
  metadata {
    name      = "atlantis-vcs"
    namespace = "atlantis"
  }

  data = {
    "gh-token" = var.github_token
  }

  type = "Opaque"
}
