# PVE configuration
variable "pve_url" {
  type        = string
  description = "Get API URL for the PVE"
}
variable "pve_tls_insecure" {
  type        = string
  description = "Get the tls_insecure for authenticate with Proxmox"
}
variable "pve_token_id" {
  type        = string
  description = "Get the token id for authenticate with Proxmox"
}
variable "pve_token_secret" {
  type        = string
  description = "Get the token secret for authenticate with Proxmox"
}

# VM's properties
variable "domain" {
  type        = string
  description = "Gets the domain to build the VM's FQDN"
}

variable "target_node" {
  type        = string
  description = "Gets the PVE node where to deploy VM's"
}
variable "target_storage" {
  type        = string
  description = "Gets the target PVE storage for nodes"
}

# Cloud Platform properties
variable "bootstrap_address" {
  type        = list(string)
  description = "The address of the bootstrap node"
}
variable "master_address" {
  type        = list(string)
  description = "The address of the master nodes"
}
variable "worker_address" {
  type        = list(string)
  description = "The address of the worker nodes"
}
