# =============================================================================
# VARIABLES OF MODULE COMPUTE {EC2, DNS, SECURITY GROUPS...}
# =============================================================================
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3" # Paris
}

variable "project_name" {
  description = "Nom du projet (utilisé pour les tags)"
  type        = string
  default     = "transcendance"
}

variable "instance_type" {
  description = "Type d'instance EC2 (t2.micro = gratuit, t2.small = 2Go RAM)"
  type        = string
  default     = "t2.micro"
}

variable "ssh_key_path" {
  description = "Chemin vers la clé SSH publique"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "volume_size" {
  description = "Taille du disque en Go"
  type        = number
  default     = 20
}

variable "instance_count" {
  description = "Nombre d'instances à déployer (scaling)"
  type        = number
  default     = 1
}

variable "tfstate_bucket_name" {
	description = "Nom du bucket ou se trouvera le backend TF"
	type		= string
	default		= "tfstate-bucket"
}
