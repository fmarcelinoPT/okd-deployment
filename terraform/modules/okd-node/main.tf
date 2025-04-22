variable "vms" {
  type = map(object({
    cores   = number
    memory  = number
    disk    = string
    macaddr = string
  }))
}

variable "target_node" {
  type = string
}

variable "vm_template" {}
variable "cloud_init_username" {}
variable "cloud_init_password" {}
variable "cloud_init_sshkeys" {}

resource "proxmox_vm_qemu" "vm" {
  for_each = var.vms

  name        = "okd-${each.key}"
  target_node = var.target_node

  clone_id    = var.vm_template

  agent       = 1
  os_type     = "cloud-init"
  cores       = each.value.cores
  sockets     = 1
  cpu_type    = "host"
  memory      = each.value.memory
  scsihw      = "virtio-scsi-pci"

  # Setup the disk
  boot = "order=scsi0;ide2"

  disks {
    ide {
      ide2 {
        cloudinit {
          storage = "syn-lab"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size     = each.value.disk
          cache    = "writeback"
          storage  = "syn-lab"
          iothread = true
          discard  = true
        }
      }
    }
  } # end setup Disks

  network {
    id      = 0
    model   = "virtio"
    bridge  = "vmbr0"
    macaddr = each.value.macaddr
  }

  ipconfig0 = "ip=dhcp"

  lifecycle {
    ignore_changes = [
      disk, network, ciuser, cipassword, sshkeys
    ]
  }

  # Setup cloud init data
  ciuser     = var.cloud_init_username
  cipassword = var.cloud_init_password
  sshkeys    = var.cloud_init_sshkeys

}