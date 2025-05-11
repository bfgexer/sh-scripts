sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
#открываем порты:
sudo ufw allow 'Nginx Full'
sudo ufw status verbose
sudo mkdir -p /var/www/test.nabegator3000.site/html
sudo wget -p /var/www/test.nabegator3000.site/html/index.html https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/html/index.html

echo "скрипт скачался и запустился"
SCRIPT_PATH="$(realpath "$0")"
echo "🧹 Удаляю скрипт: $SCRIPT_PATH"
sudo rm -f "$SCRIPT_PATH"