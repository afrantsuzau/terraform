resource "null_resource" "eks_kubeconfig" {
  provisioner "local-exec" {
    command    = "aws eks update-kubeconfig --name ${terraform.workspace} --alias eks-${terraform.workspace} --region ${var.region[terraform.workspace]}"
    on_failure = continue
  }

  depends_on = [
    module.eks_cluster
  ]
}