resource "aws_lightsail_instance" "server1" {
  name              = "lamp-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "centos_stream_9"
  bundle_id         = "nano_3_0"
  key_pair_name =  "lamp"
  user_data = file("resume.sh")
}

