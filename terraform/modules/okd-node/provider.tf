terraform {
  required_version = ">= 1.10.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc8" # Replace with the latest stable version
    }
  }
}

variable "pve_url" {}
variable "pve_token_id" {}
variable "pve_token_secret" {}

provider "proxmox" {
  pm_api_url          = var.pve_url
  pm_api_token_id     = var.pve_token_id
  pm_api_token_secret = var.pve_token_secret
  pm_tls_insecure     = true # Only for testing with self-signed certs
  pm_parallel         = 20
  pm_timeout          = 1200 # Increase timeout for large deployments
}