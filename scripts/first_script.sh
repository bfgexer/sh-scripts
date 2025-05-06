#!/bin/bash

# Обновление системы
echo "update"
apt update
echo "install openssh-server"
apt install openssh-server -y
echo "upgrade"
apt upgrade -y

echo "upgrade done"

