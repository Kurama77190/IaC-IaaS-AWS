# =============================================================================
# OUTPUTS RACINE - Affichage des résultats
# =============================================================================

output "instance_ids" {
  description = "IDs des instances EC2"
  value       = module.compute.instance_ids
}

output "public_ips" {
  description = "Adresses IP publiques des instances"
  value       = module.compute.public_ips
}

output "private_ips" {
  description = "Adresses IP privées des instances"
  value       = module.compute.private_ips
}

output "security_group_id" {
  description = "ID du security group"
  value       = module.network.security_group_id
}
