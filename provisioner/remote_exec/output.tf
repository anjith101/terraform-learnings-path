output "public_ip" {
  description = "This is the public ip"
  value       = aws_instance.my_ec2.public_ip
}