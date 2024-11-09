output "public_ip" {
  description = "Public ip of ec2 instance"
  value       = values(module.ec2_instance)[*].public_ip
}