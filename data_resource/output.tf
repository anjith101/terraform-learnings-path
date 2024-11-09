output "public_ip" {
  description = "Public ip"
  value       = aws_instance.my_instance.public_ip
}
output "ami" {
  description = "AMI id"
  value       = aws_instance.my_instance.ami
}