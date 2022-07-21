output "kms_key_name" {
  value = aws_key_pair.kms_key.key_name
}

output "tls_key_private_openssh" {
  sensitive = true
  value     = tls_private_key.tls_key.private_key_openssh
}

output "tls_key_private_pem" {
  sensitive = true
  value     = tls_private_key.tls_key.private_key_pem
}