resource "proxmox_vm_qemu" "renee" {
  name                    = "renee"
  vmid                    = "100"
  target_node             = "l6vi"
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
  cloudinit_cdrom_storage = "local-lvm"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 50
        }
      }
    }
  }

  ipconfig0 = "ip=192.168.26.71/24,gw=192.168.26.1"
  sshkeys   = <<EOF
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGxJ4EHJMWVBevnqdfSd4bfz5urCwu3wqXJB/RVjmwNqtQ4Oow9bxpvSxJH+y0nwXz6UA6WaayaeqPrTOnPgjYzLcKZmjwiUbr15ldNgxzZ3qgmZ/l1dfGSuo97jzIVGpat6n1ffYrKWaVw0Ov1xL4k/caIUK8Z9LGZL4TU98RJ8+9Em8hoQ1BzDDc8lIjC+lAST4R8ry2/ufsWofB7MFSrVc7rt9Br2xbCkFpYo2kldOmIT1Nbqac49uwfnEUnUN6tm6fU4C5JWicn7r0P/elkh4BPsbAiCth0lsZNzzK3riNkUKdLPB5yCYx+r1kg9txKQ9RTpONI3WCPGvA10G1c6JN3Z7rm0Rmu54762sgLjkCcbKgefaYyQ/rZdh9c7i9RxCNEngk/F8I5juht9WtHzpyIamxVx1XRhmQZxF5t7P/df1KdrnGGZlt+ZIbLtKexIQc8/GlWNn3KvBYrxjQKzuBll1icx/DeFe5yIyyu6jLSninkZVeJRt01jf/iU0= sysadmin@A326-15-2
  EOF

}

resource "proxmox_vm_qemu" "alex" {
  name                    = "alex"
  vmid                    = "101"
  target_node             = "l6vi"
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
  cloudinit_cdrom_storage = "local-lvm"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 50
        }
      }
    }
  }

  ipconfig0 = "ip=192.168.26.72/24,gw=192.168.26.1"
  sshkeys   = <<EOF
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGxJ4EHJMWVBevnqdfSd4bfz5urCwu3wqXJB/RVjmwNqtQ4Oow9bxpvSxJH+y0nwXz6UA6WaayaeqPrTOnPgjYzLcKZmjwiUbr15ldNgxzZ3qgmZ/l1dfGSuo97jzIVGpat6n1ffYrKWaVw0Ov1xL4k/caIUK8Z9LGZL4TU98RJ8+9Em8hoQ1BzDDc8lIjC+lAST4R8ry2/ufsWofB7MFSrVc7rt9Br2xbCkFpYo2kldOmIT1Nbqac49uwfnEUnUN6tm6fU4C5JWicn7r0P/elkh4BPsbAiCth0lsZNzzK3riNkUKdLPB5yCYx+r1kg9txKQ9RTpONI3WCPGvA10G1c6JN3Z7rm0Rmu54762sgLjkCcbKgefaYyQ/rZdh9c7i9RxCNEngk/F8I5juht9WtHzpyIamxVx1XRhmQZxF5t7P/df1KdrnGGZlt+ZIbLtKexIQc8/GlWNn3KvBYrxjQKzuBll1icx/DeFe5yIyyu6jLSninkZVeJRt01jf/iU0= sysadmin@A326-15-2
  EOF

}

resource "proxmox_vm_qemu" "denis" {
  name                    = "denis"
  vmid                    = "102"
  target_node             = "l6vi"
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
  cloudinit_cdrom_storage = "local-lvm"

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "local-lvm"
          size    = 50
        }
      }
    }
  }

  ipconfig0 = "ip=192.168.26.73/24,gw=192.168.26.1"
  sshkeys   = <<EOF
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGxJ4EHJMWVBevnqdfSd4bfz5urCwu3wqXJB/RVjmwNqtQ4Oow9bxpvSxJH+y0nwXz6UA6WaayaeqPrTOnPgjYzLcKZmjwiUbr15ldNgxzZ3qgmZ/l1dfGSuo97jzIVGpat6n1ffYrKWaVw0Ov1xL4k/caIUK8Z9LGZL4TU98RJ8+9Em8hoQ1BzDDc8lIjC+lAST4R8ry2/ufsWofB7MFSrVc7rt9Br2xbCkFpYo2kldOmIT1Nbqac49uwfnEUnUN6tm6fU4C5JWicn7r0P/elkh4BPsbAiCth0lsZNzzK3riNkUKdLPB5yCYx+r1kg9txKQ9RTpONI3WCPGvA10G1c6JN3Z7rm0Rmu54762sgLjkCcbKgefaYyQ/rZdh9c7i9RxCNEngk/F8I5juht9WtHzpyIamxVx1XRhmQZxF5t7P/df1KdrnGGZlt+ZIbLtKexIQc8/GlWNn3KvBYrxjQKzuBll1icx/DeFe5yIyyu6jLSninkZVeJRt01jf/iU0= sysadmin@A326-15-2
  EOF

}