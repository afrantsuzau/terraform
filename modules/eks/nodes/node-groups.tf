# Resource: aws_eks_node_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group

resource "aws_eks_node_group" "nodes" {
  cluster_name           = var.cluster_name
  node_group_name_prefix = "${var.cluster_name}-${var.nodes_name}-"
  node_role_arn          = var.iam_eks_nodes_role_arn
  subnet_ids             = var.vpc_subnets

  scaling_config {
    desired_size = var.asg_desired_size
    max_size     = var.asg_max_size
    min_size     = var.asg_min_size
  }

  remote_access {
    ec2_ssh_key = var.nodes_ssh_key
  }

  dynamic "taint" {
    for_each = var.node_taint
    content {
      key    = var.node_taint.key
      value  = var.node_taint.value
      effect = var.node_taint.effect
    }
  }

  # Allow external changes without Terraform plan difference
  lifecycle {
    ignore_changes        = [scaling_config.0.desired_size]
    create_before_destroy = true
  }

  ami_type = var.ami_type

  # Type of capacity associated with the EKS Node Group. Valid values: ON_DEMAND, SPOT
  capacity_type = var.nodes_capacity_type

  # Disk size in GiB for worker nodes
  disk_size = var.nodes_disk_size

  # Force version update if existing pods are unable to be drained due to a pod disruption budget issue
  force_update_version = var.force_update_version

  # List of instance types associated with the EKS Node Group. Defaults to ["t3.medium"]
  instance_types = var.nodes_instance_types

  # Key-value map of Kubernetes labels
  labels = {
    role = "nodes"
    name = var.nodes_name
  }

  # Key-value map of resource tags
  tags = {
    "k8s.io/cluster-autoscaler/node-template/label/name"                   = "${var.nodes_name}"
    "k8s.io/cluster-autoscaler/node-template/taint/${var.node_taint.key}"  = "${var.node_taint.value}:${var.node_taint.effect}"
    Name                                                                   = "${var.cluster_name}-${var.nodes_name}"
    Environment                                                            = var.environment
  }

  tags_all = {
    "k8s.io/cluster-autoscaler/node-template/label/name"                   = "${var.nodes_name}"
    "k8s.io/cluster-autoscaler/node-template/taint/${var.node_taint.key}"  = "${var.node_taint.value}:${var.node_taint.effect}"
    Name                                                                   = "${var.cluster_name}-${var.nodes_name}"
    Environment                                                            = var.environment
  }
}
