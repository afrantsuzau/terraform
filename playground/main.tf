locals {
  common_tags = {
    Environment = var.env
    Owner       = "Terraform"
  }
}

data "aws_key_pair" "admin" {
  key_name = "admin"
}

resource "random_string" "random_suffix" {
  length  = 6
  upper   = false
  special = false
}
resource "aws_instance" "db" {
  for_each      = var.database_servers
  ami           = var.instance_ami
  instance_type = var.instance_type[var.env]
  monitoring    = var.instance_monitoring

  key_name = data.aws_key_pair.admin.key_name

  tags = merge(
    local.common_tags,
    {
      Name = each.value
    }
  )

  provisioner "local-exec" {
    on_failure = fail
    command    = "echo 'Created a ${each.key} EC2 Instance!' >> terraform_provisioner.log"
  }

  provisioner "local-exec" {
    when       = destroy
    on_failure = continue
    command    = "echo 'Destroyed ${each.key} EC2 Instance!' >> terraform_provisioner.log"
  }

  provider = aws.frankfurt
}
resource "aws_instance" "web" {
  count         = var.webserver_count
  ami           = var.instance_ami
  instance_type = var.instance_type[var.env]
  monitoring    = var.instance_monitoring

  key_name = data.aws_key_pair.admin.key_name

  tags = merge(
    local.common_tags,
    {
      Name = "playground-web-${count.index}-${random_string.random_suffix.result}"
    }
  )

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt -qqy install nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

  depends_on = [
    aws_instance.db
  ]

  provider = aws.frankfurt
}