#!/bin/bash

# Paketleri güncelleme ve yükseltme
echo "Paketler güncelleniyor ve yükseltiliyor..."
sudo apt update && sudo apt upgrade -y

# İşletim sistemi bilgilerini düzenleme
echo "İşletim sistemi bilgileri düzenleniyor..."

# /etc/lsb-release dosyasını düzenleme
sudo bash -c 'cat <<EOF > /etc/lsb-release
DISTRIB_ID=Mergen
DISTRIB_RELEASE=1.0
DISTRIB_CODENAME=helo
DISTRIB_DESCRIPTION="Mergen OS 1.0"
EOF'

# /usr/lib/os-release dosyasını düzenleme
sudo bash -c 'cat <<EOF > /usr/lib/os-release
NAME="Mergen OS"
VERSION="1.0"
ID=mergen
PRETTY_NAME="Mergen OS 1.0"
VERSION_ID="1.0"
HOME_URL="https://github.com/vastsea0/mergen"
SUPPORT_URL="https://github.com/vastsea0/mergen"
BUG_REPORT_URL="https://github.com/vastsea0/mergen/issues"
EOF'

# /etc/issue dosyasını düzenleme
sudo bash -c 'echo "Mergen OS 1.0 \\n \\l" > /etc/issue'

# /etc/issue.net dosyasını düzenleme
sudo bash -c 'echo "Mergen OS 1.0" > /etc/issue.net'

# GRUB başlığını değiştirme
echo "GRUB başlığı düzenleniyor..."
sudo sed -i 's/^GRUB_DISTRIBUTOR=.*/GRUB_DISTRIBUTOR="Mergen"/' /etc/default/grub

# GRUB 10_linux betiğini düzenleme
echo "GRUB menü girişleri düzenleniyor..."
sudo sed -i 's/os="\$(lsb_release -i 2> \/dev\/null | cut -f 2)"/os="Mergen"/' /etc/grub.d/10_linux

# GRUB'u güncelleme
echo "GRUB yapılandırması güncelleniyor..."
sudo update-grub

echo "Tüm işlemler başarıyla tamamlandı."
