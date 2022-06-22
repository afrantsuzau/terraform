resource "aws_instance" "amazon_linux" {
  ami           = "ami-0d71ea30463e0ff8d"
  instance_type = "t3.micro"

  tags = {
    Name = "amazon-linux-01"
  }

  provider = aws.frankfurt
}