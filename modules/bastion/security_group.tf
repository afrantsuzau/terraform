resource "aws_security_group" "bastion_ssh" {
  name   = "${var.environment}-bastion-ssh"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.bastion_ingress
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = ingress.value["description"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.environment}-bastion-ssh"
  }
}
