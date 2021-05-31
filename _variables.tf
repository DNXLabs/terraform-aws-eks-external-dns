variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled."
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "cluster_identity_oidc_issuer" {
  type        = string
  description = "The OIDC Identity issuer for the cluster."
}

variable "cluster_identity_oidc_issuer_arn" {
  type        = string
  description = "The OIDC Identity issuer ARN for the cluster that can be used to associate IAM roles with a service account."
}

variable "policy_allowed_zone_ids" {
  type        = list(string)
  default     = ["*"]
  description = "List of the Route53 zone ids for service account IAM role access."
}

variable "helm_chart_name" {
  type        = string
  default     = "external-dns"
  description = "Helm chart name to be installed."
}

variable "helm_chart_version" {
  type        = string
  default     = "5.0.0"
  description = "Version of the Helm chart."
}

variable "helm_release_name" {
  type        = string
  default     = "external-dns"
  description = "Helm release name."
}

variable "helm_repo_url" {
  type        = string
  default     = "https://charts.bitnami.com/bitnami"
  description = "Helm repository."
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create k8s namespace with name defined by `namespace`."
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "The Kubernetes namespace in which the external-dns service account has been created."
}

variable "service_account_name" {
  type        = string
  default     = "external-dns"
  description = "The Kubernetes external-dns service account name."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "settings" {
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://github.com/bitnami/charts/tree/master/bitnami/external-dns#parameters."
}