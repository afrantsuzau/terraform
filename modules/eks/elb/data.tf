data "aws_route53_zone" "main" {
  name = var.zone
}

data "aws_lb" "current" {
  name = var.load_balancer
}
