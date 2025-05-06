#!/bin/bash

# Обновление системы
echo "update"
apt update
echo "install openssh-server"
sudo DEBIAN_FRONTEND=noninteractive apt install openssh-server -y -o Dpkg::Options::="--force-confold"
echo "upgrade"
apt upgrade -y

echo "upgrade done"

read -p "Введите новый SSH-порт: " ssh_port
read -p "Введите имя пользователя: " username
read -s -p "Введите пароль для $username: " userpass
echo "dfdfdfdf"