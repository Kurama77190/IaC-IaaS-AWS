output "nameservers" {
  description = "Nameservers à configurer chez Ionos"
  value       = aws_route53_zone.main.name_servers
}
