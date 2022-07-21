# Resource: aws_eks_cluster
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster

resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.iam_eks_cluster_role_arn

  version = var.kubernetes_version

  vpc_config {
    # Enabling EKS API server endpoint is public
    endpoint_public_access = true

    # Subnets required to be at least in two different AZ
    subnet_ids = var.cluster_subnets
  }
}
