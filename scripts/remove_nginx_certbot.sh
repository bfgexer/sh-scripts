#!/bin/bash

echo "🛑 Остановка служб..."
sudo systemctl stop nginx

echo "🧹 Удаление Nginx..."
sudo apt purge -y nginx nginx-common nginx-core
sudo rm -rf /etc/nginx /var/www /var/log/nginx /etc/systemd/system/nginx.service

echo "🧹 Удаление Certbot..."
sudo apt purge -y certbot python3-certbot-nginx
sudo rm -rf /etc/letsencrypt /var/log/letsencrypt /var/lib/letsencrypt

echo "🧽 Очистка системы..."
sudo apt autoremove --purge -y
sudo apt autoclean

echo "✅ Удаление завершено."
SCRIPT_PATH="$(realpath "$0")"
echo "🧹 Удаляю скрипт: $SCRIPT_PATH"
sudo rm -f "$SCRIPT_PATH"