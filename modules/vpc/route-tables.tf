# Resource: aws_route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # Default route to IGW
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.cluster_name}-public"
    Environment = var.environment
  }
}

# Routing tables for private NAT gateways
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  # Default route to NAT GW
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name        = "${var.cluster_name}-private"
    Environment = var.environment
  }
}
