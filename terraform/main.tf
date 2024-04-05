resource "proxmox_vm_qemu" "efe1" {
  name                    = "efe1"
  vmid                    = "100"
  target_node             = "efe"
  clone                   = "ubuntu-server"
  cores                   = 1
  sockets                 = 1
  cpu                     = "host"
  memory                  = 4096
  agent                   = 1
  full_clone              = true
  scsihw                  = "virtio-scsi-pci"
  bootdisk                = "scsi0"
  os_type                 = "cloud-init"
  cloudinit_cdrom_storage = "local-zfs"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-zfs"
          size    = 50
        }
      }
    }
  }

  ipconfig0 = "ip=192.168.111.131/24,gw=192.168.111.1"
  sshkeys   = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC90yfilWy0FXPbZy7rhWXxgfVZGdDhYpXD66NTzewJBGHiBBu03oe+FuqnPqqwU6O6RAiljOGr4kfzak3FJWgnNw4MDNQlsZ1kQlMUIKy1A/R7/LKYYm4ykQj0YBXnYtbf93Z/X7vaqk9wshFR3k5ipDHx7ZHIM+Vpu+Yx+rOUqjPs1ikgYXf8C9+CQPcPK9cTvN+XBwTRILehzjZTHgnj+YORyT3kTjUpdzxkWLj/UoKi1Lehd95IHk/c5QGScIFgoMO0BsObCT3osvT+gerRjLlgL8yUgXQsjWvSzoBDkWcQLAOUCSveCE7s/FfheimBcE+STPwOsArCMM93r1DqU1RuLpNqymTyEkIFrce74j6VSlEh0BQ3xydL0fNTg4Gtl3qphPPoidVUP+6ErUrPMYPB8Ld3hv1mHeXu3vgt3G/VQU1GDzRRUmjE5AIeSQ+7eKPInlgTxIyB/sfeofhfvQ9L04uZJg+RL0y4f2b1dhIMcMaQXPvUZriG4+B4AW0= efe@A326-14  
EOF

}

resource "proxmox_vm_qemu" "efe2" {
  name                    = "efe2"
  vmid                    = "101"
  target_node             = "efe"
  clone                   = "ubuntu-server"
  count                   = 1
  cores                   = 1
  sockets                 = 1
  cpu                     = "host"
  memory                  = 4096
  agent                   = 1
  full_clone              = true
  scsihw                  = "virtio-scsi-pci"
  bootdisk                = "scsi0"
  os_type                 = "cloud-init"
  cloudinit_cdrom_storage = "local-zfs"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-zfs"
          size    = 50
        }
      }
    }
  }

  ipconfig0 = "ip=192.168.111.132/24,gw=192.168.111.1"
  sshkeys   = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC90yfilWy0FXPbZy7rhWXxgfVZGdDhYpXD66NTzewJBGHiBBu03oe+FuqnPqqwU6O6RAiljOGr4kfzak3FJWgnNw4MDNQlsZ1kQlMUIKy1A/R7/LKYYm4ykQj0YBXnYtbf93Z/X7vaqk9wshFR3k5ipDHx7ZHIM+Vpu+Yx+rOUqjPs1ikgYXf8C9+CQPcPK9cTvN+XBwTRILehzjZTHgnj+YORyT3kTjUpdzxkWLj/UoKi1Lehd95IHk/c5QGScIFgoMO0BsObCT3osvT+gerRjLlgL8yUgXQsjWvSzoBDkWcQLAOUCSveCE7s/FfheimBcE+STPwOsArCMM93r1DqU1RuLpNqymTyEkIFrce74j6VSlEh0BQ3xydL0fNTg4Gtl3qphPPoidVUP+6ErUrPMYPB8Ld3hv1mHeXu3vgt3G/VQU1GDzRRUmjE5AIeSQ+7eKPInlgTxIyB/sfeofhfvQ9L04uZJg+RL0y4f2b1dhIMcMaQXPvUZriG4+B4AW0= efe@A326-14  
EOF

}

resource "proxmox_vm_qemu" "efe3" {
  name                    = "efe3"
  vmid                    = "102"
  target_node             = "efe"
  clone                   = "ubuntu-server"
  count                   = 1
  cores                   = 1
  sockets                 = 1
  cpu                     = "host"
  memory                  = 4096
  agent                   = 1
  full_clone              = true
  scsihw                  = "virtio-scsi-pci"
  bootdisk                = "scsi0"
  os_type                 = "cloud-init"
  cloudinit_cdrom_storage = "local-zfs"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-zfs"
          size    = 50
        }
      }
    }
  }

  ipconfig0 = "ip=192.168.111.133/24,gw=192.168.111.1"
  sshkeys   = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC90yfilWy0FXPbZy7rhWXxgfVZGdDhYpXD66NTzewJBGHiBBu03oe+FuqnPqqwU6O6RAiljOGr4kfzak3FJWgnNw4MDNQlsZ1kQlMUIKy1A/R7/LKYYm4ykQj0YBXnYtbf93Z/X7vaqk9wshFR3k5ipDHx7ZHIM+Vpu+Yx+rOUqjPs1ikgYXf8C9+CQPcPK9cTvN+XBwTRILehzjZTHgnj+YORyT3kTjUpdzxkWLj/UoKi1Lehd95IHk/c5QGScIFgoMO0BsObCT3osvT+gerRjLlgL8yUgXQsjWvSzoBDkWcQLAOUCSveCE7s/FfheimBcE+STPwOsArCMM93r1DqU1RuLpNqymTyEkIFrce74j6VSlEh0BQ3xydL0fNTg4Gtl3qphPPoidVUP+6ErUrPMYPB8Ld3hv1mHeXu3vgt3G/VQU1GDzRRUmjE5AIeSQ+7eKPInlgTxIyB/sfeofhfvQ9L04uZJg+RL0y4f2b1dhIMcMaQXPvUZriG4+B4AW0= efe@A326-14  
EOF

}
