output "public" {
  value = tls_private_key.private_key_pair.public_key_openssh
}

output "private" {
  value = tls_private_key.private_key_pair.private_key_pem
}