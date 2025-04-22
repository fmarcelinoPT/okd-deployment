module "hera_vms" {
  source = "./modules/okd-node"

  target_node = "hera"
  
  vm_template          = 1000 # var.vm_template
  cloud_init_username  = var.cloud_init_username
  cloud_init_password  = var.cloud_init_password
  cloud_init_sshkeys   = var.cloud_init_sshkeys
  pve_url              = var.pve_url
  pve_token_id         = var.pve_token_id
  pve_token_secret     = var.pve_token_secret

  vms = {
    bootstrap = { cores = 4, memory = 8192,  disk = "50G",  macaddr = "02:1C:57:A9:3E:10" },
    haproxy   = { cores = 2, memory = 4096,  disk = "32G",  macaddr = "3A:BA:62:94:10:CF" },
    master1   = { cores = 4, memory = 8192,  disk = "120G", macaddr = "06:3B:94:2D:71:2F" },
    worker1   = { cores = 8, memory = 16384, disk = "120G", macaddr = "12:59:C7:43:AF:68" },
    worker2   = { cores = 8, memory = 16384, disk = "120G", macaddr = "16:93:D4:0B:E1:97" },
    worker3   = { cores = 8, memory = 16384, disk = "120G", macaddr = "1A:7F:9A:54:2E:30" }
  }

}

module "poseidon_vms" {
  source = "./modules/okd-node"

  target_node = "poseidon"

  vm_template          = 1020 # var.vm_template
  cloud_init_username  = var.cloud_init_username
  cloud_init_password  = var.cloud_init_password
  cloud_init_sshkeys   = var.cloud_init_sshkeys
  pve_url              = var.pve_url
  pve_token_id         = var.pve_token_id
  pve_token_secret     = var.pve_token_secret

  vms = {
    master2 = { cores = 4, memory = 8192,  disk = "120G", macaddr = "0A:6E:29:14:B3:22" },
    worker4 = { cores = 8, memory = 16384, disk = "120G", macaddr = "1E:CC:88:77:01:9B" },
    worker5 = { cores = 8, memory = 16384, disk = "120G", macaddr = "22:0D:EF:66:44:A2" },
    worker6 = { cores = 8, memory = 16384, disk = "120G", macaddr = "26:F2:B3:21:88:74" }
  }

}

module "zeus_vms" {
  source = "./modules/okd-node"

  target_node = "zeus"

  vm_template          = 1030 # var.vm_template
  cloud_init_username  = var.cloud_init_username
  cloud_init_password  = var.cloud_init_password
  cloud_init_sshkeys   = var.cloud_init_sshkeys
  pve_url              = var.pve_url
  pve_token_id         = var.pve_token_id
  pve_token_secret     = var.pve_token_secret


  vms = {
    master3 = { cores = 4, memory = 8192,  disk = "120G", macaddr = "0E:82:4F:9C:10:DD" },
    worker7 = { cores = 8, memory = 16384, disk = "120G", macaddr = "2A:A4:6C:D3:F0:49" },
    worker8 = { cores = 8, memory = 16384, disk = "120G", macaddr = "2E:31:95:EB:AD:15" },
    worker9 = { cores = 8, memory = 16384, disk = "120G", macaddr = "32:7A:8E:C2:3A:53" }
  }

}