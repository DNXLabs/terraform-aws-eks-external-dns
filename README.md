# terraform-aws-eks-external-dns

[![Lint Status](https://github.com/DNXLabs/terraform-aws-eks-external-dns/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-eks-external-dns/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-eks-external-dns)](https://github.com/DNXLabs/terraform-aws-eks-external-dns/blob/master/LICENSE)

Terraform module for deploying [External DNS](https://github.com/kubernetes-sigs/external-dns) inside a pre-existing EKS cluster.

## Usage

```
module "external_dns" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-external-dns.git"

  cluster_name                     = module.eks_cluster.cluster_id
  cluster_identity_oidc_issuer     = module.eks_cluster.cluster_oidc_issuer_url
  cluster_identity_oidc_issuer_arn = module.eks_cluster.oidc_provider_arn

  settings = {
    "policy" = "sync" # Modify how DNS records are sychronized between sources and providers.
  }
}
```

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 3.13 |
| helm | >= 1.0, < 3.0 |
| kubernetes | >= 1.10.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.13 |
| helm | >= 1.0, < 3.0 |
| kubernetes | >= 1.10.0, < 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_identity\_oidc\_issuer | The OIDC Identity issuer for the cluster. | `string` | n/a | yes |
| cluster\_identity\_oidc\_issuer\_arn | The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account. | `string` | n/a | yes |
| cluster\_name | The name of the cluster. | `string` | n/a | yes |
| create\_namespace | Whether to create k8s namespace with name defined by `namespace`. | `bool` | `true` | no |
| enabled | Variable indicating whether deployment is enabled. | `bool` | `true` | no |
| helm\_chart\_name | Helm chart name to be installed. | `string` | `"external-dns"` | no |
| helm\_chart\_version | Version of the Helm chart. | `string` | `"6.10.2"` | no |
| helm\_release\_name | Helm release name. | `string` | `"external-dns"` | no |
| helm\_repo\_url | Helm repository. | `string` | `"https://charts.bitnami.com/bitnami"` | no |
| mod\_dependency | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable. | `any` | `null` | no |
| namespace | The Kubernetes namespace in which the external-dns service account has been created. | `string` | `"kube-system"` | no |
| policy\_allowed\_zone\_ids | List of the Route53 zone ids for service account IAM role access. | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| service\_account\_name | The Kubernetes external-dns service account name. | `string` | `"external-dns"` | no |
| settings | Additional settings which will be passed to the Helm chart values, see https://github.com/bitnami/charts/tree/master/bitnami/external-dns#parameters. | `map` | `{}` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-eks-external-dns/blob/master/LICENSE) for full details.