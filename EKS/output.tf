output "terraform_workspace" {
  value = terraform.workspace
}

output "eks_bastion_public_ip" {
  sensitive = true
  value     = module.eks_bastion.bastion_instance_public_ip
}

output "eks_cluster_name" {
  value = terraform.workspace
}

output "eks_cluster_region" {
  value = var.region[terraform.workspace]
}

output "eks_cluster_vpc_cidr" {
  value = var.vpc_cidr[terraform.workspace]
}

output "efs_id" {
  value = module.efs.efs_id
}