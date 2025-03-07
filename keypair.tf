# Generates a secure private key and encodes it as PEM
resource "tls_private_key" "aws_lightsail_instance_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create key pair
resource "aws_lightsail_key_pair" "aws_lightsail_instance_key2" {
  name   = "lamp"
  public_key = tls_private_key.aws_lightsail_instance_key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "lamp.pem"
  content  = tls_private_key.aws_lightsail_instance_key.private_key_pem
}