# =============================================================================
# BACKEND REMOTE TFSTATE IN BUCKET NETWORK AWS S3
# =============================================================================
terraform {
	backend "s3" {
		bucket = "tfstate-bucket-42"
		key    = "network/terraform.tfstate"
		region = "eu-west-3"
	}
}
