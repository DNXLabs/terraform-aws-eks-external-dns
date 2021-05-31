# module "external_dns" {
#   count  = local.workspace.external_dns.enabled ? 1 : 0
#   source = "git::https://github.com/DNXLabs/terraform-aws-eks-external-dns.git?ref=0.1.4"

#   enabled = true

#   cluster_name                     = data.aws_eks_cluster.cluster.id
#   cluster_identity_oidc_issuer     = data.aws_eks_cluster.cluster.identity[0].oidc[0].issuer
#   cluster_identity_oidc_issuer_arn = local.workspace.oidc_provider_arn
#   policy_allowed_zone_ids          = [data.aws_route53_zone.private_hosted_zone.zone_id, data.aws_route53_zone.cloud_hosted_zone.zone_id]

#   settings = {
#     "policy"        = "sync" # Modify how DNS records are sychronized between sources and providers.
#     "zoneIdFilters" = [data.aws_route53_zone.private_hosted_zone.zone_id, data.aws_route53_zone.cloud_hosted_zone.zone_id]
#   }
# }

# data "aws_route53_zone" "private_hosted_zone" {
#   name = "${local.workspace.environment}.private.mycustomdomain.com"
# }

# data "aws_route53_zone" "cloud_hosted_zone" {
#   name = "${local.workspace.environment}.cloud.mycustomdomain.com"
# }
