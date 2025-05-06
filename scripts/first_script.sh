#!/bin/bash

# Обновление системы
apt update && DEBIAN_FRONTEND=noninteractive apt upgrade -y -o Dpkg::Options::="--force-confold"


# Запрос данных
read -p "Введите новый SSH-порт: " ssh_port
read -p "Введите имя пользователя: " username
read -s -p "Введите пароль для $username: " userpass
echo

# Создание пользователя
adduser --disabled-password --gecos "" "$username"
echo "$username:$userpass" | chpasswd

# Добавление в sudo
usermod -aG sudo "$username"

# Изменение порта в /etc/ssh/sshd_config
sed -i "s/^#\?Port .*/Port $ssh_port/" /etc/ssh/sshd_config

# Отключить root-доступ и вход по паролю для root
sed -i "s/^#\?PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config

# Перезапуск SSH
systemctl restart ssh

echo "✅ Готово. SSH-порт: $ssh_port, пользователь: $username"


# Настройка SSH-ключей для пользователя
echo "установка ssh ключа"
mkdir -p /home/"$username"/.ssh
wget -qO /home/"$username"/.ssh/authorized_keys https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/scripts/authorized_keys
chown -R "$username":"$username" /home/"$username"/.ssh
chmod 700 /home/"$username"/.ssh
chmod 600 /home/"$username"/.ssh/authorized_keys

echo "🔐 Публичный ключ добавлен в /home/$username/.ssh/authorized_keys"


