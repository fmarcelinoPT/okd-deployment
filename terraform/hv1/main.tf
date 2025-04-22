# Create a new VM resource
resource "proxmox_vm_qemu" "master-vm" {
  count = 1
  # vmid  = 31 * 10 + (count.index)
  name  = "okd-master31${count.index}.${var.domain}"

  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = var.target_node

  # The destination resource pool for the new VM
  # pool = "dev"

  agent       = 1
  os_type     = "debian"
  cpu_type    = "host"
  cores       = 4
  memory      = 8192 # Adjust to your needs

  boot        = "order=virtio0;ide0"

  scsihw      = "virtio-scsi-pci"

  # Define the disk settings
  disks {
    ide {
      ide0 {
        cdrom {
          # Define the ISO image (make sure it's available on your Proxmox server)
          iso = "local:iso/master.iso"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          size     = "120G"
          cache    = "writeback"
          storage  = var.target_storage
          iothread = true
          discard  = true
        }
      }
    }
  } # end setup Disks

  # Setup the network interface and assign a mac address
  network {
    id      = 0
    model   = "virtio"
    bridge  = "vmbr0"
    macaddr = var.master_address[count.index]
  }

  # Setup the ip address using cloud-init.
  # Keep in mind to use the CIDR notation for the ip.
  ipconfig0 = "ip=dhcp"

  lifecycle {
    ignore_changes = [
      disk, network
    ]
  }

}
resource "proxmox_vm_qemu" "worker-vm" {
  count = 3
  # vmid  = 31 * 10 + (count.index + 1)
  name  = "okd-worker31${count.index + 1}.${var.domain}"

  # Node name has to be the same name as within the cluster
  # this might not include the FQDN
  target_node = var.target_node

  # The destination resource pool for the new VM
  # pool = "dev"

  agent       = 1
  os_type     = "debian"
  cpu_type    = "host"
  cores       = 8
  memory      = 16384 # Adjust to your needs

  boot        = "order=virtio0;ide0"

  scsihw      = "virtio-scsi-pci"

  # Define the disk settings
  disks {
    ide {
      ide0 {
        cdrom {
          # Define the ISO image (make sure it's available on your Proxmox server)
          iso = "local:iso/worker.iso"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          size     = "120G"
          cache    = "writeback"
          storage  = var.target_storage
          iothread = true
          discard  = true
        }
      }
    }
  } # end setup Disks

  # Setup the network interface and assign a mac address
  network {
    id      = 0
    model   = "virtio"
    bridge  = "vmbr0"
    macaddr = var.worker_address[count.index]
  }

  # Setup the ip address using cloud-init.
  # Keep in mind to use the CIDR notation for the ip.
  ipconfig0 = "ip=dhcp"

  lifecycle {
    ignore_changes = [
      disk, network
    ]
  }

}
