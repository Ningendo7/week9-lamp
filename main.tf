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

resource "aws_lightsail_instance" "server1" {
  name              = "lamp-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "centos_stream_9"
  bundle_id         = "nano_3_0"
  key_pair_name =  "lamp"
  tags = {
    Team = "DevOps"
    env = "dev"
    create_by = "terraform"
  }
}

