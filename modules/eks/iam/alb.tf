# IAM Role for AWS Load Balancer Controller
data "http" "eks_nodes_alb_policy_json" {
  url = "https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json"
}

resource "aws_iam_policy" "eks_nodes_alb_policy" {
  name   = "AWSLoadBalancerControllerIAMPolicy_${var.cluster_name}"
  policy = data.http.eks_nodes_alb_policy_json.body
}

resource "aws_iam_role_policy_attachment" "eks_nodes_alb_policy_attachment" {
  role       = aws_iam_role.eks_node_group.name
  policy_arn = aws_iam_policy.eks_nodes_alb_policy.arn
}
