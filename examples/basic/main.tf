# module "external_dns" {
#   source = "../../"

#   cluster_name                     = module.eks_cluster.eks_cluster_id
#   cluster_identity_oidc_issuer     = module.eks_cluster.eks_cluster_identity_oidc_issuer
#   cluster_identity_oidc_issuer_arn = module.eks_cluster.eks_cluster_identity_oidc_issuer_arn

#   settings = {
#     # Examples:

#     ## sources:
#     ## - service
#     ## - ingress

#     "source[0]" = "service"
#     "source[1]" = "ingress"

#     ## coredns:
#     ##   etcdTLS:
#     ##     enabled: false

#     "coredns.etcdTLS.enabled" = "false"

#     ## extraEnv:
#     ## - name: var1
#     ##   value: value1
#     ## - name: var2
#     ##   value: value2

#     "extraEnv[0].name"  = "var1"
#     "extraEnv[0].value" = "value1"
#     "extraEnv[1].name"  = "var2"
#     "extraEnv[1].value" = "value2"

#     ## extraEnv:
#     ## - name: var3
#     ##   valueFrom:
#     ##     secretKeyRef:
#     ##       name: existing-secret
#     ##       key: varname3-key

#     # "extraEnv[2].name" = "var3"
#     # "extraEnv[2].valueFrom.secretKeyRef.name" = "existing-secret"
#     # "extraEnv[2].valueFrom.secretKeyRef.key" = "varname3-key"

#   }

# }