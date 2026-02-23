# =============================================================================
# CONFIGURATION PRINCIPALE - Orchestration des modules
# =============================================================================

# Module Network - VPC, Subnets, IGW (créé en premier)
module "network" {
  source = "./modules/network"

  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

# Module Compute - EC2, SSH Key, Security Groups
module "compute" {
  source = "./modules/compute"

  project_name   = var.project_name
  instance_type  = var.instance_type
  ssh_key_path   = var.ssh_key_path
  volume_size    = var.volume_size
  instance_count = var.instance_count

  depends_on = [module.network]
}
