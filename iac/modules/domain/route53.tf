# =============================================================================
# DNS - ROUTE53 
# =============================================================================
resource "aws_route53_zone" "main" {
	name	= var.domain_name

	tags	= { Name = "${var.project_name}-zone" }
}

# records transcendance.samybentayeb.fr -> A
resource "aws_route53_record" "main" {
	zone_id = aws_route53_zone.main.zone_id
	name	=	"${var.project_name}.${var.domain_name}"
	type	= "A"
	ttl		= 60
	records	= [data.terraform_remote_state.network.outputs.eip-ec2-public-ip]
}

# records grafana.samybentayeb.fr -> A
resource "aws_route53_record" "grafana" {
	zone_id = aws_route53_zone.main.id
	name	= "grafana.${var.domain_name}"
	type	= "A"
	ttl		= 60
	records = [data.terraform_remote_state.network.outputs.eip-ec2-public-ip]
}

# records prometheus.samybentayeb.fr -> A
resource "aws_route53_record" "prometheus" {
	zone_id = aws_route53_zone.main.id
	name	= "prometheus.${var.domain_name}"
	type	= "A"
	ttl		= 60
	records = [data.terraform_remote_state.network.outputs.eip-ec2-public-ip]
}
