module "eks_iam" {
  source = "../modules/eks/iam"

  cluster_name = terraform.workspace
}
