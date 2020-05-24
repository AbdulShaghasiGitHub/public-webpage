output "instance_public_ip" {
  value = aws_instance.cloud_Server.public_ip
}

output "lb_endpoint" {
  value = aws_lb.cloud_lb.dns_name
}

output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}