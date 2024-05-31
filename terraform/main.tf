resource "proxmox_vm_qemu" "efe" {
  count                   = 1
  name                    = "efe-${count.index + 1}"
  vmid                    = "10${count.index + 2}"
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

  ipconfig0 = "ip=192.168.111.13${count.index + 1}/24,gw=192.168.111.1"
  sshkeys   = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDqvYe9/bhP3df5w3d4KzfDdOkxI7XVfNQFP8UpCSM/UcXo/7yrq2+AH3dvhblcizj5piiabj+db/dRsYdOxjlV82GdGfXQmGUqlU0ymgXRhbDLE//cpWIfdDPmjAawiqTPFfdrJZm7K/VuxZJOwCnYX01xXUbw8MHLdCdtyPbHOb+fxi54cjYuYJxxfmCrtZGlzcq4EbwnWO7oYqa1Ke20Yhtl2Gchr1SrmI2VNk62rDnPYw/7N75F6RIM3eGNCpbTPbS4KmZ1vzewfx5PF6177iXzo3SMArbSw1tQajFLzaMH/TtGCQFwJ0MWZo/1F8yMHusz90L/6kYLK+9nYbZFuqr6IuUEh4c4bown5xE0h3yFLsCMZOMKrE/KtuYeREvhmwHn6sWQMk7GOL3C1E2bwZzpHByVnZZrk26+e7iDp1i892jxc6L22jIGNmGmQ66JlQEkg6N+o/2/kZRRFZIIQiZ74ZZUUPha0FbNe7tJbG8dP6+WpJvrkDKsi9lenWk= efe@A326-14
EOF

}
