#!/bin/bash

# Skript loob Ubuntu pilvemasina kettapildist Proxmox-i malli, kus on kõik vajalik paigaldatud ja konfigureeritud

# kontrollib, kas pilvemasina kettapilt juba eksisteerib
if [ ! -f "jammy-server-cloudimg-amd64.img" ]; then
    # kui ei eksisteeri, siis laeb alla Ubuntu Jammy serveri pilvemasina kettapildi
    wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
fi 

qm create 8000 --name ubuntu-server --memory 4096 --net0 virtio,bridge=vmbr0 --agent 1 # loob uue virtuaalmasina nimega ubuntu-server, millel on 4096 MB mälu ja virtuaalne võrguliides vmbr0

qm importdisk 8000 jammy-server-cloudimg-amd64.img local-lvm  # impordib allalaaditud pildi virtuaalmasina kohalikule LVM-le

qm set 8000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-8000-disk-0  # määrab virtuaalmasinale SCSI riistvara ja ühendab selle kohaliku LVM-i ketta vm-8000-disk-0-ga

qm set 8000 --ide2 local-lvm:cloudinit  # määrab virtuaalmasina teise IDE pesa kasutamiseks kohaliku LVM-i cloud-init-iga

qm set 8000 --boot c --bootdisk scsi0  # määrab virtuaalmasina käivitumiseks ketta scsi0

qm set 8000 --serial0 socket --vga serial0  # seadistab virtuaalmasina serial ühenduse ja graafilise adapteri

qm set 8000 --ipconfig0 ip=dhcp  # määrab virtuaalmasinale IP konfiguratsiooni kasutades DHCP-d (hiljem saab IP-aadressi Terraformi kaudu konfigureerida)

qm resize 8000 scsi0 50G  # muudab virtuaalmasina ketta scsi0 suuruseks 50GB

mkdir -p /var/lib/vz/snippets # loob kataloogid, kui need juba eelnevalt olemas ei ole

cd /var/lib/vz/snippets # liigub vajalikku kataloogi

# loob faili nimega vendor.yaml ning sisestab järgmised read (seda faili kasutatakse masina konfigureerimiseks peale loomist)
cat <<EOF > cloud-init.yaml
#cloud-config
# uuendab pakendid ning vajadusel taaskäivitab masina
package_update: true
package_upgrade: true
package_reboot_if_required: true

# paigaldab pakendid
packages:
- qemu-guest-agent

# veendub, et qemu-guest-agent töötab
runcmd:
- systemctl start qemu-guest-agent
EOF

qm set 8000 --cicustom "vendor=local:snippets/cloud-init.yaml"  # cloud-init konfiguratsiooni faili asukoha määramine

qm set 8000 --ciuser sysadmin # cloud-init kasutaja nimi

qm set 8000 --cipassword $(openssl passwd -6 $CLEARTEXT_PASSWORD) # loob Cloud-Init kasutajale parooli ning krüpteerib selle kasutades SHA-512 algoritmi

qm start 8000 # käivitab virtuaalmasina

sleep 120 # ootab 120 sekundit, et masin läheks tööle ja paigaldaks vajalikud pakendid (määratud /var/lib/vz/snippets/vendor.yaml failis)

qm stop 8000 # peatab masina

sleep 10 # ootab 10 sekundit, et masin läheks kinni

qm template 8000 # loob masinast malli