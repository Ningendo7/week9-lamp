resource "aws_route53_record" "rc1" {
  zone_id = "Z0884625F84PS8V6JYON"
  name    = "resume.tendo.pro"
  type    = "A"
  ttl     = 300
  records = [aws_lightsail_instance.server1.public_ip_address]
}

output "dns-name" {
  value = aws_route53_record.rc1.name
}