sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
#открываем порты:
sudo ufw allow 'Nginx Full'
sudo ufw status verbose



echo "скрипт скачался и запустился"
SCRIPT_PATH="$(realpath "$0")"
echo "🧹 Удаляю скрипт: $SCRIPT_PATH"
sudo rm -f "$SCRIPT_PATH"