module "eks_cluster" {
  source = "../modules/eks/cluster"

  cluster_name       = terraform.workspace
  cluster_subnets    = module.eks_vpc.vpc_subnets
  kubernetes_version = var.kubernetes_version

  iam_eks_cluster_role_arn = module.eks_iam.iam_eks_cluster_role_arn

  depends_on = [module.eks_iam, module.eks_vpc]
}
