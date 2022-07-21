resource "local_file" "eks_keypair" {
  content         = module.eks_keypair.tls_key_private_pem
  filename        = "./ssh-keys/${terraform.workspace}.pem"
  file_permission = "0400"

  provisioner "local-exec" {
    command    = "ssh-add ./ssh-keys/${terraform.workspace}.pem"
    on_failure = continue
  }

  depends_on = [module.eks_keypair]
}