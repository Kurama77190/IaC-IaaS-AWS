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

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDRs des subnets publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Zones de disponibilité"
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b"]
}

# IONOS DNS
variable "ionos_api_key" {
  description = "Clé API IONOS (DNS)"
  type        = string
  sensitive   = true
}
