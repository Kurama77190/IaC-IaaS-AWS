# IONOS DNS
# ionos_api_key = définie via TF_VAR_ionos_api_key [API KEY] 9fb88fca12c541d99e17bc5907fc970f.FfgyWJXbVpwP910S8A3EqWQ9N9doVimFE9Nf_y0Jc1E2cbNjQWN4ina99J1EigAHUhccyP38ikF2263R2YjPzg
# =============================================================================
# VARIABLES'S VALUE OF NETWORK COMPUTE
# =============================================================================

# VPC Configuration
project_name         = "transcendance"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
availability_zones   = ["eu-west-3a", "eu-west-3b"]