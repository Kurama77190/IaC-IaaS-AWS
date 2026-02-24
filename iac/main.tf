# =============================================================================
# CONFIGURATION PRINCIPALE - Orchestration des modules
# =============================================================================

# Module Network - VPC, Subnets, IGW (créé en premier)
module "network" { source = "./modules/network" }

# Module Compute - EC2, SSH Key, Security Groups
module "compute" {
  source = "./modules/compute"

  depends_on = [module.network]
}


module "domain" {
  source = "./modules/domain"

  depends_on = [module.network]
}
