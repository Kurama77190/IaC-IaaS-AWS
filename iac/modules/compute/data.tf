# =============================================================================
# LINK TO TFSTATE IN BUCKET NETWORK AWS S3
# =============================================================================
data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "tfstate-bucket-42"
    key    = "network/terraform.tfstate"
    region = "eu-west-3"
  }
}
