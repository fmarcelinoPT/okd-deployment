variable "pve_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://your-pve-server:8006/api2/json"
}
variable "pve_token_id" {
  description = "Proxmox API token ID"
  type        = string
}
variable "pve_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "cloud_init_username" {
  type        = string
  description = "Username for cloud-init setup"
}
variable "cloud_init_password" {
  type        = string
  description = "Password for cloud-init setup"
}
variable "cloud_init_sshkeys" {
  type        = string
  description = "SSH Keys for cloud-init setup"
}

variable "vm_template" {
  description = "Name of the VM template to clone"
  type        = string
  default     = "ubuntu-server-24-04"
}
variable "okd_cluster_name" {
  description = "OKD cluster name"
  type        = string
  default     = "okd-cluster"
}
