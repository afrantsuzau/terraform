resource "aws_instance" "amazon_linux" {
  ami           = var.instance_ami
  instance_type = var.instance_type[var.env]
  monitoring    = var.instance_monitoring

  tags = {
    Name        = "amazon-linux-01"
    Environment = var.env
    Owner       = "Terraform"
  }

  provider = aws.frankfurt
}