module "eks_vpc" {
  source = "../modules/vpc"

  cluster_name   = terraform.workspace
  cluster_region = var.region[terraform.workspace]
  environment    = terraform.workspace
  vpc_cidr       = var.vpc_cidr[terraform.workspace]
}