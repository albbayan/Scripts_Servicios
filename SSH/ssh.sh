#!/bin/bash

# Actualizar sistema
sudo apt update && sudo apt update

# Instalar SSH
sudo apt install -y openssh-server

# Activar SSH
sudo systemctl enable --now ssh

while true
do
  echo ""
  echo "===== MENU ====="
  echo "1) Poner IP en enp0s8 (red interna)"
  echo "2) Ver IP de la red interna (enp0s8)"
  echo "3) Estado del servicio SSH"
  echo "4) Cambiar puerto SSH a 356"
  echo "0) Salir"
  read -p "Opcion: " op

  if [ "$op" = "1" ]; then
    read -p "Escribe la IP (ej: 192.168.56.10/24): " IP

    if [[ "$IP" != */* ]]; then
      IP="$IP/24"
    fi

    sudo tee /etc/netplan/50-network.yaml >/dev/null <<EOF
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3:
      dhcp4: true

    enp0s8:
      dhcp4: no
      addresses:
        - $IP
EOF

    sudo chmod 600 /etc/netplan/50-network.yaml
    sudo netplan apply

    echo "IP puesta en enp0s8: $IP"

  elif [ "$op" = "2" ]; then
    ip a show enp0s8

  elif [ "$op" = "3" ]; then
    systemctl status ssh

  elif [ "$op" = "4" ]; then
    echo "Cambiando puerto SSH a 356..."

    sudo sed -i 's/^#\?Port .*/Port 356/' /etc/ssh/sshd_config
    sudo systemctl restart ssh

    echo "Puerto SSH cambiado a 356"

  elif [ "$op" = "0" ]; then
    echo "Saliendo..."
    exit 0

  else
    echo "Opcion incorrecta"
  fi
done
