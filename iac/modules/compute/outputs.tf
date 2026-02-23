# =============================================================================
# OUTPUT MODULE COMPUTE
# =============================================================================
output "public_ips" {
  description = "Adresses IP publiques des instances"
  value       = aws_instance.main[*].public_ip
}

output "private_ips" {
  description = "Adresses IP privées des instances"
  value       = aws_instance.main[*].private_ip
}

output "instance_ids" {
  description = "IDs des instances EC2"
  value       = aws_instance.main[*].id
}
