output "bastion_instance_tags" {
  value = aws_instance.bastion.tags
}

output "bastion_instance_public_ip" {
  sensitive = true
  value     = aws_instance.bastion.public_ip
}

output "bastion_instance_subnet" {
  value = aws_instance.bastion.subnet_id
}