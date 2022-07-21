output "name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks.name
}
