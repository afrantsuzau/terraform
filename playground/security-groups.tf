resource "aws_security_group" "backend-sg" {
  name        = "backend-sg"
  description = "Backend Security Group"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "backend-sg-to-ports" {
  value = aws_security_group.backend-sg.ingress[*].to_port
}