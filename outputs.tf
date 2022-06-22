output "instance_public_ip" {
  description = "EC2 Instance piblic IP address"
  value       = aws_instance.amazon_linux.public_ip
  sensitive   = true
}

output "instance_private_ip" {
  description = "EC2 Instance private IP address"
  value       = aws_instance.amazon_linux.private_ip
  sensitive   = false
}