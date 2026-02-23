# =============================================================================
# BACKEND REMOTE TFSTATE IN BUCKET COMPUTE AWS S3
# =============================================================================
terraform {
  backend "s3" {
	bucket = "tfstate-bucket-42"
	key	   = "domain/terraform.tfstate"
	region = "eu-west-3"
  }
}
