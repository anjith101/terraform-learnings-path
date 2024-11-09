output "public_ip" {
  description = "Public ip of the instance is"
  value       = aws_instance.my_instance.public_ip
}
output "private_ip" {
  description = "Private ip of the instance is"
  value       = aws_instance.my_instance.private_ip
  sensitive = true
}
output "url" {
  description = "URL"
  value       = "http://${aws_instance.my_instance.public_ip}"
}