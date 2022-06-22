resource "aws_instance" "amazon_linux" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "amazon-linux-01"
  }

  provider = aws.frankfurt
}