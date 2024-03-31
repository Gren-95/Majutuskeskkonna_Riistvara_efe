#!/bin/bash

# See skript uuendab pakihaldussüsteemi (APT) allikate loendit (sources.list), kustutades eelnevad kirjed ja lisades tasuta saadaolevad repositooriumid

# Tühjendame /etc/apt/sources.list sisu
echo "" > /etc/apt/sources.list

# Lisame repositooriumi read
echo "deb http://ftp.debian.org/debian bookworm main contrib" >> /etc/apt/sources.list
echo "deb http://ftp.debian.org/debian bookworm-updates main contrib" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list  # Lisame tühja rea loetavuse jaoks
echo "# Proxmox VE pve-no-subscription repository provided by proxmox.com" >> /etc/apt/sources.list
echo "deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list  # Lisame tühja rea loetavuse jaoks
echo "# Security updates" >> /etc/apt/sources.list
echo "deb http://security.debian.org/debian-security bookworm-security main contrib" >> /etc/apt/sources.list

echo "Sources have been updated."
