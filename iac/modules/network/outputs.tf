# =============================================================================
# OUTPUTS NETWORK
# =============================================================================
output "vpc_id" {
  description = "ID du VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR du VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs des subnets publics"
  value       = aws_subnet.public[*].id
}

output "internet_gateway_id" {
  description = "ID de l'Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "sg-ec2-id" {
  description = "ID security_groupe for ec2"
  value       = aws_security_group.main.id
}

output "eip-ec2-id" {
  description = "ID eip-ec2 for ec2"
  value       = aws_eip.main.id
}

output "eip-ec2-public-ip" {
  description = "Public IP of EIP for ec2"
  value       = aws_eip.main.public_ip
}
