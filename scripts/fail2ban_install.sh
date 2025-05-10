#!/bin/bash


sudo apt update && sudo apt install fail2ban
sudo systemctl enable fail2ban 
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo sed -i '/^\[sshd\]/a enabled = true\nmaxretry = 3\nbantime = 1h\nfindtime = 10m' /etc/fail2ban/jail.local
sudo sed -i '/^\[nginx-http-auth\]/a enabled = true\nmaxretry = 3\nbantime = 1h\nfindtime = 10m' /etc/fail2ban/jail.local
sudo systemctl restart fail2ban



echo "скрипт скачался и запустился"
SCRIPT_PATH="$(realpath "$0")"
echo "🧹 Удаляю скрипт: $SCRIPT_PATH"
sudo rm -f "$SCRIPT_PATH"