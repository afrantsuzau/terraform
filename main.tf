data "aws_key_pair" "admin" {
  key_name = "admin"
}

resource "random_string" "random_suffix" {
  length  = 6
  upper   = false
  special = false
}
resource "aws_instance" "db" {
  ami           = var.instance_ami
  instance_type = var.instance_type[var.env]
  monitoring    = var.instance_monitoring

  key_name = data.aws_key_pair.admin.key_name

  tags = {
    Name        = "playground-db-${random_string.random_suffix.result}"
    Environment = var.env
    Owner       = "Terraform"
  }

  provider = aws.frankfurt
}
resource "aws_instance" "web" {
  ami           = var.instance_ami
  instance_type = var.instance_type[var.env]
  monitoring    = var.instance_monitoring

  key_name = data.aws_key_pair.admin.key_name

  tags = {
    Name        = "playground-web-${random_string.random_suffix.result}"
    Environment = var.env
    Owner       = "Terraform"
  }

  depends_on = [
    aws_instance.db
  ]

  provider = aws.frankfurt
}