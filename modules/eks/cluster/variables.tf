variable "cluster_name" {
}

variable "cluster_subnets" {
  type = list(string)
}

variable "kubernetes_version" {
}

variable "iam_eks_cluster_role_arn" {
}
