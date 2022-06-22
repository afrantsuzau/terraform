output "web_public_ip" {
  description = "Web Instance piblic IP address"
  value       = aws_instance.web.public_ip
  sensitive   = true
}

output "web_private_ip" {
  description = "Web Instance private IP address"
  value       = aws_instance.web.private_ip
  sensitive   = false
}

output "db_public_ip" {
  description = "Database Instance piblic IP address"
  value       = aws_instance.db.public_ip
  sensitive   = true
}

output "db_private_ip" {
  description = "Database Instance private IP address"
  value       = aws_instance.db.private_ip
  sensitive   = false
}