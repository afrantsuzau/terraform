data "aws_ami" "debian_buster" {
  owners      = ["aws-marketplace"]
  most_recent = true
  filter {
    name   = "name"
    values = ["debian-10-amd64*"]
  }
}
