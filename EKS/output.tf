output "workspace" {
  value = terraform.workspace
}

output "eks_bastion_public_ip" {
  sensitive = true
  value     = module.eks_bastion.bastion_instance_public_ip
}

output "eks_name" {
  value = terraform.workspace
}

output "eks_region" {
  value = var.region[terraform.workspace]
}

output "eks_vpc_cidr" {
  value = var.vpc_cidr[terraform.workspace]
}