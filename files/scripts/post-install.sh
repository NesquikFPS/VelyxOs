#!/usr/bin/env bash
set -oue pipefail

echo "Aplicando DNA Velyx..."

# 1. Melhora a performance em jogos pesados (Starfield, Cyberpunk)
mkdir -p /etc/sysctl.d
echo "vm.max_map_count=2147483642" > /etc/sysctl.d/99-velyx.conf

# 2. Reduz o uso de Swap para o sistema ficar mais responsivo
echo "vm.swappiness=10" >> /etc/sysctl.d/99-velyx.conf

# 3. Muda o nome do sistema no painel de controle
sed -i 's/PRETTY_NAME=.*/PRETTY_NAME="Velyx OS"/' /usr/lib/os-release

# 4. Ativa o GameMode por padrão
systemctl enable gamemoded.service

echo "Velyx configurado!"
