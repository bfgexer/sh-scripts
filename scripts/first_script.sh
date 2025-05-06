#!/bin/bash

# Обновление системы
echo "update"
apt update
echo "install openssh-server"
sudo DEBIAN_FRONTEND=noninteractive apt install openssh-server -y -o Dpkg::Options::="--force-confold"
echo "upgrade"
apt upgrade -y

echo "upgrade done"

