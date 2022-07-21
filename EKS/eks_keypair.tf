module "eks_keypair" {
  source = "../modules/kms"

  environment = terraform.workspace
}