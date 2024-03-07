resource "tls_private_key" "private_key_pair" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "google_storage_bucket_object" "tls_private_key" {
  name = "env:/${var.env}/ssh-keys/${var.tls-name}-keypair.pem"
  bucket = var.gcs
  content = tls_private_key.private_key_pair.private_key_pem
}

