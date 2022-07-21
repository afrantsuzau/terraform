resource "aws_security_group" "allow_vpc_peer" {
  name        = "EKS-${var.cluster_name}-${var.nodes_name}-vpc-peer"
  description = "Allow traffic from peering VPC"
  vpc_id      = var.vpc_id

  ingress {
    description = "VPC peerring"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.nodes_sg_inbound_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "EKS-${var.cluster_name}-${var.nodes_name}-VPC-peering"
    Environment = var.environment
  }
}
