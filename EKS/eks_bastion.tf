module "eks_bastion" {
  source                  = "../modules/bastion"
  environment             = terraform.workspace
  vpc_id                  = module.eks_vpc.vpc_id
  bastion_kms_key_name    = module.eks_keypair.kms_key_name
  bastion_private_key_pem = module.eks_keypair.tls_key_private_pem
  bastion_ingress = [
    {
      description = "My Public IP"
      cidr_blocks = ["83.0.37.150/32"]
    }
  ]
  depends_on = [
    module.eks_vpc,
    module.eks_keypair,
    local_file.eks_keypair
  ]
}
