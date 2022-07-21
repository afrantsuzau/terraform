resource "aws_instance" "bastion" {
  ami           = data.aws_ami.debian_buster.id
  instance_type = var.bastion_instance_type

  key_name                    = var.bastion_kms_key_name
  monitoring                  = true
  vpc_security_group_ids      = [aws_security_group.bastion_ssh.id]
  subnet_id                   = sort(data.aws_subnets.public.ids)[0]
  associate_public_ip_address = true

  tags = {
    Name        = "${var.environment}-bastion"
    Environment = var.environment
  }

  lifecycle {
    ignore_changes = [ami, subnet_id]
  }
}
