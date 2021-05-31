resource "helm_release" "external_dns" {
  depends_on = [var.mod_dependency, kubernetes_namespace.external_dns]
  count      = var.enabled ? 1 : 0
  chart      = var.helm_chart_name
  namespace  = var.namespace
  name       = var.helm_release_name
  version    = var.helm_chart_version
  repository = var.helm_repo_url

  set {
    name  = "aws.region"
    value = data.aws_region.current.name
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = var.service_account_name
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.external_dns[0].arn
  }

  values = [
    yamlencode(var.settings)
  ]
}
