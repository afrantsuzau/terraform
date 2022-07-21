# Resource: aws_iam_role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

# Create IAM role for EKS Node Groups
resource "aws_iam_role" "eks_node_group" {
  name = "${var.cluster_name}-eks-node-group"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

# Resource: aws_iam_role_policy_attachment
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment

resource "aws_iam_role_policy_attachment" "eks_nodes_worker_policy" {
  # https://github.com/SummitRoute/aws_managed_policies/blob/master/policies/AmazonEKSWorkerNodePolicy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "eks_nodes_cni_policy" {
  # https://github.com/SummitRoute/aws_managed_policies/blob/master/policies/AmazonEKS_CNI_Policy
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "eks_nodes_ecr_ro_policy" {
  # https://github.com/SummitRoute/aws_managed_policies/blob/master/policies/AmazonEC2ContainerRegistryReadOnly
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node_group.name
}

# Resource: aws_iam_instance_profile
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile

resource "aws_iam_instance_profile" "eks_node_profile" {
  name = "${var.cluster_name}-eks-node"
  role = aws_iam_role.eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "eks_nodes_cni_metrics_policy" {
  # https://docs.aws.amazon.com/eks/latest/userguide/cni-metrics-helper.html
  policy_arn = "arn:aws:iam::647811644138:policy/CNIMetricsHelperPolicy"
  role       = aws_iam_role.eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "eks_nodes_cluster_autoscaler_policy" {
  # https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html
  policy_arn = "arn:aws:iam::647811644138:policy/AmazonEKSClusterAutoscalerPolicy"
  role       = aws_iam_role.eks_node_group.name
}

resource "aws_iam_role_policy_attachment" "eks_nodes_ebs_csi_policy" {
  # https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html
  policy_arn = "arn:aws:iam::647811644138:policy/AmazonEKS_EBS_CSI_Driver_Policy"
  role       = aws_iam_role.eks_node_group.name
}