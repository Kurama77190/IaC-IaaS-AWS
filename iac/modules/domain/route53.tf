# =============================================================================
# DNS - ROUTE53 
# =============================================================================
resource "aws_route53_zone" "main" {
	name	= var.domain_name

	tags	= { Name = "${var.project_name}-zone" }
}

resource "aws_route53_record" "main" {
	zone_id = aws_route53_zone.main.zone_id
	name	=	"${var.project_name}.domain_name"
	type	= "A"
	ttl		= 60
	records	= [data.terraform_remote_state.network.outputs.eip-ec2-public-ip]
}
