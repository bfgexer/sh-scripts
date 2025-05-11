sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
#открываем порты:
sudo ufw allow 'Nginx Full'
sudo ufw status verbose
read -p "Введите домен: " domain
sudo mkdir -p /var/www/$domain/html
sudo wget -P /var/www/$domain/html/ https://raw.githubusercontent.com/bfgexer/sh-scripts/refs/heads/main/html/index.html

sudo tee /etc/nginx/sites-available/$domain.conf > /dev/null <<EOF
server {
    listen 80;
    server_name $domain;

    root /var/www/$domain/html;
    index index.html index.htm;

    access_log /var/log/nginx/$domain.access.log;
    error_log  /var/log/nginx/$domain.error.log;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/$domain.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
sudo systemctl status nginx
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d $domain
sudo certbot renew --dry-run


echo "скрипт скачался и запустился"
SCRIPT_PATH="$(realpath "$0")"
echo "🧹 Удаляю скрипт: $SCRIPT_PATH"
sudo rm -f "$SCRIPT_PATH"