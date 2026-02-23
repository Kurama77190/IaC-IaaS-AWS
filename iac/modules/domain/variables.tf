# =============================================================================
# VARIABLES OF MODULE COMPUTE {EC2, DNS, SECURITY GROUPS...}
# =============================================================================
variable "domain_name" {
	description = "Nom de domaine du site internet"
	type		= string
	default		= ""
}

variable "project_name" {
  description = "Nom du projet (utilisé pour les tags)"
  type        = string
  default     = "transcendance"
}

variable "tfstate_bucket_name" {
	description = "Nom du bucket ou se trouvera le backend TF"
	type		= string
	default		= "tfstate-bucket-42"
}
