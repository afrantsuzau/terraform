# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name        = var.cluster_name
    Environment = var.environment
  }

  # EIP may require IGW to exists prior association
  depends_on = [aws_internet_gateway.main]
}
