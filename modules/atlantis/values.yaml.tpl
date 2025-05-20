vcsSecretName: null

secrets:
  - name: ATLANTIS_GH_TOKEN
    value: "${github_token}"

environment:
  - name: ATLANTIS_REPO_WHITELIST
    value: "github.com/${github_user}/${repo_name}"
  - name: ATLANTIS_GH_USER
    value: "${github_user}"

ingress:
  enabled: true
  className: "nginx"
  annotations:
    kubernetes.io/ingress.class: nginx
  hosts:
    - host: ${atlantis_hostname}
      paths:
        - path: /
          pathType: Prefix
