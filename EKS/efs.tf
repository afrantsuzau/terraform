module "efs" {
  source = "../modules/efs"

  cluster_name    = terraform.workspace
  environment     = terraform.workspace
  vpc_id          = module.eks_vpc.vpc_id
  vpc_subnets     = module.eks_vpc.vpc_subnets
  vpc_cidr_blocks = [module.eks_vpc.vpc_cidr_block]

  depends_on = [
    module.eks_vpc
  ]
}
