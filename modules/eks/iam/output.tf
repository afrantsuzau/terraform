output "iam_eks_cluster_role_arn" {
  description = "EKS Cluster role ARN"
  value       = aws_iam_role.eks_cluster.arn
}

output "iam_eks_nodes_role_arn" {
  description = "EKS Nodes Group role ARN"
  value       = aws_iam_role.eks_node_group.arn
}
