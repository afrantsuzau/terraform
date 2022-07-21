output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_subnets" {
  value = data.aws_subnets.eks_subnets.ids
}

output "vpc_subnets_private" {
  value = data.aws_subnets.eks_subnets_private.ids
}

output "vpc_subnets_public" {
  value = data.aws_subnets.eks_subnets_public.ids
}
