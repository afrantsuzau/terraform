module "eks_nodes" {
  source = "../modules/eks/nodes"

  cluster_name = terraform.workspace
  environment  = terraform.workspace
  vpc_id       = module.eks_vpc.vpc_id
  vpc_subnets  = module.eks_vpc.vpc_subnets_private

  nodes_name           = "nodes"
  nodes_ssh_key        = module.eks_keypair.kms_key_name
  nodes_capacity_type  = "SPOT"
  nodes_disk_size      = 32
  nodes_instance_types = ["t3a.large", "t3.large", "m6a.large", "m5a.large", "t2.large", "m5.large", "m4.large"]

  asg_desired_size = 1
  asg_max_size     = 3
  asg_min_size     = 1

  node_taint = {
    key    = "node_group"
    value  = "nodes"
    effect = "NO_SCHEDULE"
  }

  iam_eks_nodes_role_arn = module.eks_iam.iam_eks_nodes_role_arn

  depends_on = [module.eks_cluster, module.eks_keypair]
}

module "eks_workers" {
  source = "../modules/eks/nodes"

  cluster_name = terraform.workspace
  environment  = terraform.workspace
  vpc_id       = module.eks_vpc.vpc_id
  vpc_subnets  = module.eks_vpc.vpc_subnets_private

  nodes_name           = "workers"
  nodes_ssh_key        = module.eks_keypair.kms_key_name
  nodes_capacity_type  = "SPOT"
  nodes_disk_size      = 32
  nodes_instance_types = ["t3a.large", "t3.large", "m6a.large", "m5a.large", "t2.large", "m5.large", "m4.large"]

  asg_desired_size = 1
  asg_max_size     = 3
  asg_min_size     = 1

  node_taint = {
    key    = "node_group"
    value  = "workers"
    effect = "NO_SCHEDULE"
  }

  iam_eks_nodes_role_arn = module.eks_iam.iam_eks_nodes_role_arn

  depends_on = [module.eks_cluster, module.eks_keypair]
}
